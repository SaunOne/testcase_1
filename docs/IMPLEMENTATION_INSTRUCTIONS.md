# Implementation Instructions: Query System Migration

Dokumen ini berisi instruksi lengkap untuk migrasi ke Query System di dua fitur:

1. **Auth Login** - Implementasi MutationBuilder untuk social login
2. **Home Posts** - Implementasi QueryBuilder untuk fetch posts

---

## PART 1: AUTH LOGIN MIGRATION

### Objective

Migrate auth login dari Bloc pattern ke Query System menggunakan `MutationBuilder` dengan `AuthSocialButton`.

### Current State Analysis

**Files yang akan diubah:**

```
lib/features/auth/
├── data/
│   ├── api/
│   │   └── auth_api_service.dart      → RENAME ke auth_endpoints.dart, hapus instance methods
│   └── repository/
│       └── auth_repository.dart       → HAPUS (tidak perlu lagi)
├── bloc/
│   ├── login/
│   │   ├── login_cubit.dart           → HAPUS
│   │   └── login_state.dart           → HAPUS
│   └── social_login/
│       ├── social_login_bloc.dart     → HAPUS
│       ├── social_login_event.dart    → HAPUS
│       └── social_login_state.dart    → HAPUS
└── presentation/
    └── login/
        └── page/
            ├── login_page.dart        → UPDATE (tambah section)
            └── sections/
                ├── login_header_section.dart  → KEEP
                ├── login_footer_section.dart  → KEEP
                └── login_social_section.dart  → CREATE (MutationBuilder + AuthSocialButton)
```

### Step-by-Step Instructions

#### Step 1: Rename dan Cleanup `auth_api_service.dart` → `auth_endpoints.dart`

**File:** `lib/features/auth/data/api/auth_endpoints.dart`

**Action:**

1. Rename file dari `auth_api_service.dart` ke `auth_endpoints.dart`
2. Hapus instance methods (line 27-64) dan constructor
3. Rename class dari `AuthApiService` ke `AuthEndpoints`
4. Tambah private constructor

**Result:**

```dart
import 'package:testcase_1/app/router/auth_notifier.dart';
import 'package:testcase_1/core/query/query.dart';
import 'package:testcase_1/core/storage/token_store.dart';
import 'package:testcase_1/features/auth/data/dto/oauth_login/oauth_login_request.dart';
import 'package:testcase_1/features/auth/data/dto/oauth_login/oauth_login_response.dart';
import 'package:testcase_1/features/auth/data/dto/refresh/refresh_request.dart';
import 'package:testcase_1/features/auth/data/dto/refresh/refresh_response.dart';

/// Auth endpoints using Query System
class AuthEndpoints {
  AuthEndpoints._(); // Private constructor

  // ═══════════════════════════════════════════════════════════════════════════
  // OAuth Login - Simple API calls
  // ═══════════════════════════════════════════════════════════════════════════

  static final loginWithGoogle =
      MutationEndpoint<OAuthLoginResponse, void, OAuthLoginRequest>(
        path: '/auth/oauth/google',
        method: HttpMethod.post,
        fromJson: (json) =>
            OAuthLoginResponse.fromJson(json as Map<String, dynamic>),
        invalidatesTags: ['user', 'auth'],
      );

  static final loginWithApple =
      MutationEndpoint<OAuthLoginResponse, void, OAuthLoginRequest>(
        path: '/auth/oauth/apple',
        method: HttpMethod.post,
        fromJson: (json) =>
            OAuthLoginResponse.fromJson(json as Map<String, dynamic>),
        invalidatesTags: ['user', 'auth'],
      );

  // ═══════════════════════════════════════════════════════════════════════════
  // OAuth Login - With side effects (save token, notify auth)
  // ═══════════════════════════════════════════════════════════════════════════

  static final loginWithGoogleMutation =
      CustomMutationEndpoint<OAuthLoginResponse, void, OAuthLoginRequest>(
        invalidatesTags: ['user', 'auth'],
        mutator: (_, body, client, deps) async {
          final result = await client.mutate(loginWithGoogle, body: body);

          if (result.isSuccess && result.data != null) {
            final response = result.data!;

            await deps.get<TokenStore>().saveTokens(
              accessToken: response.accessToken,
              refreshToken: response.refreshToken,
            );

            deps.get<AuthNotifier>().login();
            return response;
          }

          throw Exception(result.errorMessage ?? 'Login failed');
        },
      );

  static final loginWithAppleMutation =
      CustomMutationEndpoint<OAuthLoginResponse, void, OAuthLoginRequest>(
        invalidatesTags: ['user', 'auth'],
        mutator: (_, body, client, deps) async {
          final result = await client.mutate(loginWithApple, body: body);

          if (result.isSuccess && result.data != null) {
            final response = result.data!;

            await deps.get<TokenStore>().saveTokens(
              accessToken: response.accessToken,
              refreshToken: response.refreshToken,
            );

            deps.get<AuthNotifier>().login();
            return response;
          }

          throw Exception(result.errorMessage ?? 'Login failed');
        },
      );

  // ═══════════════════════════════════════════════════════════════════════════
  // Token Refresh
  // ═══════════════════════════════════════════════════════════════════════════

  static final refreshToken =
      MutationEndpoint<RefreshResponse, void, RefreshRequest>(
        path: '/auth/refresh',
        method: HttpMethod.post,
        fromJson: (json) =>
            RefreshResponse.fromJson(json as Map<String, dynamic>),
      );

  static final refreshTokenMutation =
      CustomMutationEndpoint<RefreshResponse, void, RefreshRequest>(
        mutator: (_, body, client, deps) async {
          final result = await client.mutate(refreshToken, body: body);

          if (result.isSuccess && result.data != null) {
            final response = result.data!;

            await deps.get<TokenStore>().saveTokens(
              accessToken: response.accessToken,
              refreshToken: response.refreshToken,
            );

            return response;
          }

          throw Exception(result.errorMessage ?? 'Token refresh failed');
        },
      );

  // ═══════════════════════════════════════════════════════════════════════════
  // Queries
  // ═══════════════════════════════════════════════════════════════════════════

  static final healthCheck = SimpleQueryEndpoint<bool>(
    path: '/health',
    fromJson: (_) => true,
  );
}
```

#### Step 2: Create `login_social_section.dart`

**File:** `lib/features/auth/presentation/login/page/sections/login_social_section.dart`

**Action:** Create new file dengan MutationBuilder + AuthSocialButton

```dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:testcase_1/core/query/query.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/features/auth/data/api/auth_endpoints.dart';
import 'package:testcase_1/features/auth/data/dto/oauth_login/oauth_login_request.dart';
import 'package:testcase_1/features/auth/data/dto/oauth_login/oauth_login_response.dart';
import 'package:testcase_1/features/auth/presentation/login/widgets/auth_social_button.dart';
import 'package:testcase_1/features/home/presentation/home/home_page.dart';

class LoginSocialSection extends StatefulWidget {
  const LoginSocialSection({super.key});

  @override
  State<LoginSocialSection> createState() => _LoginSocialSectionState();
}

class _LoginSocialSectionState extends State<LoginSocialSection> {
  final _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ════════════════════════════════════════════════════════════════════
        // Google Login Button
        // ════════════════════════════════════════════════════════════════════
        MutationBuilder<OAuthLoginResponse, void, OAuthLoginRequest>(
          customEndpoint: AuthEndpoints.loginWithGoogleMutation,
          onSuccess: (_) => context.go(HomePage.routeName),
          onError: (error) => _showError(context, error),
          builder: (context, state, mutate, reset) {
            return AuthSocialButton(
              provider: AuthSocialProvider.google,
              isLoading: state.isLoading,
              onPressed: () => _handleGoogleLogin(mutate),
            );
          },
        ),

        AppSpacing.heightMd,

        // ════════════════════════════════════════════════════════════════════
        // Apple Login Button (iOS/macOS only)
        // ════════════════════════════════════════════════════════════════════
        if (Platform.isIOS || Platform.isMacOS)
          MutationBuilder<OAuthLoginResponse, void, OAuthLoginRequest>(
            customEndpoint: AuthEndpoints.loginWithAppleMutation,
            onSuccess: (_) => context.go(HomePage.routeName),
            onError: (error) => _showError(context, error),
            builder: (context, state, mutate, reset) {
              return AuthSocialButton(
                provider: AuthSocialProvider.apple,
                variant: AuthSocialButtonVariant.dark,
                isLoading: state.isLoading,
                onPressed: () => _handleAppleLogin(mutate),
              );
            },
          ),
      ],
    );
  }

  Future<void> _handleGoogleLogin(
    Future<void> Function({OAuthLoginRequest? body}) mutate,
  ) async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) return; // User cancelled

      final authentication = await account.authentication;
      final idToken = authentication.idToken;

      if (idToken == null) {
        _showError(context, 'Failed to get Google ID token');
        return;
      }

      await mutate(body: OAuthLoginRequest(idToken: idToken));
    } catch (e) {
      _showError(context, e.toString());
    }
  }

  Future<void> _handleAppleLogin(
    Future<void> Function({OAuthLoginRequest? body}) mutate,
  ) async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final idToken = credential.identityToken;
      if (idToken == null) {
        _showError(context, 'Failed to get Apple ID token');
        return;
      }

      await mutate(body: OAuthLoginRequest(idToken: idToken));
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code != AuthorizationErrorCode.canceled) {
        _showError(context, e.message);
      }
    } catch (e) {
      _showError(context, e.toString());
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
```

#### Step 3: Update `login_page.dart`

**File:** `lib/features/auth/presentation/login/page/login_page.dart`

**Action:** Add LoginSocialSection to the page

```dart
import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/features/auth/presentation/login/page/sections/login_footer_section.dart';
import 'package:testcase_1/features/auth/presentation/login/page/sections/login_header_section.dart';
import 'package:testcase_1/features/auth/presentation/login/page/sections/login_social_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: AppSpacing.paddingMd,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LoginHeaderSection(),
                    AppSpacing.heightXl,
                    LoginSocialSection(),
                  ],
                ),
              ),
            ),
            LoginFooterSection(),
          ],
        ),
      ),
    );
  }
}
```

#### Step 4: Delete Unused Files

**Action:** Delete the following files (no longer needed):

```
# Bloc files - replaced by Query System
DELETE: lib/features/auth/bloc/login/login_cubit.dart
DELETE: lib/features/auth/bloc/login/login_state.dart
DELETE: lib/features/auth/bloc/social_login/social_login_bloc.dart
DELETE: lib/features/auth/bloc/social_login/social_login_event.dart
DELETE: lib/features/auth/bloc/social_login/social_login_state.dart

# Repository - logic moved to CustomMutationEndpoint
DELETE: lib/features/auth/data/repository/auth_repository.dart

# Old API service - renamed to auth_endpoints.dart
DELETE: lib/features/auth/data/api/auth_api_service.dart (after creating auth_endpoints.dart)

# Duplicate widget (keep one in login/widgets/)
DELETE: lib/features/auth/presentation/widgets/auth_social_button.dart

# Unused sections/files
DELETE: lib/features/auth/presentation/login/page/sections/login_action_section.dart (if exists and unused)
DELETE: lib/features/auth/presentation/login/page/login_layout.dart (if unused)
```

#### Step 5: Update DI Registration

**File:** `lib/app/di/register_module.dart` atau `di.config.dart`

**Action:** Remove registrations for deleted classes:

```dart
// REMOVE these registrations:
// - AuthApiService (instance-based)
// - AuthRepository
// - LoginCubit
// - SocialLoginBloc

// KEEP these (used by CustomMutationEndpoint via deps.get<>):
// - TokenStore
// - AuthNotifier
// - QueryClient
```

---

## PART 2: HOME POSTS MIGRATION

### Objective

Migrate home posts dari Bloc pattern ke Query System menggunakan `QueryBuilder`.

### Current State Analysis

**Files yang akan diubah:**

```
lib/features/home/
├── data/
│   ├── api/
│   │   └── post_api_service.dart      → RENAME ke post_endpoints.dart (jika belum)
│   ├── repositories/
│   │   ├── post_repository.dart       → HAPUS
│   │   └── post_repository_impl.dart  → HAPUS
│   ├── datasources/
│   │   └── post_local_datasource.dart → KEEP (untuk offline support nanti)
│   ├── dto/
│   │   └── get_posts/
│   │       └── get_posts_response.dart → KEEP (sudah benar)
│   └── mappers/
│       └── post_mapper.dart           → KEEP (sudah benar)
├── bloc/
│   ├── home/
│   │   ├── home_cubit.dart            → HAPUS
│   │   └── home_state.dart            → HAPUS
│   └── post_detail/
│       ├── post_detail_cubit.dart     → HAPUS
│       └── post_detail_state.dart     → HAPUS
└── presentation/
    ├── home/
    │   ├── home_page.dart             → UPDATE (QueryBuilder)
    │   └── sections/
    │       ├── home_header_section.dart   → UPDATE (remove Bloc dependency)
    │       └── home_post_list_section.dart → HAPUS (merged into home_page.dart)
    └── post_detail/
        └── page/
            └── post_detail_page.dart  → UPDATE (QueryBuilder)
```

### Step-by-Step Instructions

#### Step 1: Ensure `post_endpoints.dart` is correct

**File:** `lib/features/home/data/api/post_endpoints.dart`

**Verify:** File should already exist with correct structure. If named `post_api_service.dart`, rename to `post_endpoints.dart`.

```dart
import 'package:testcase_1/core/network/cache/cache_policy.dart';
import 'package:testcase_1/core/query/query.dart';
import 'package:testcase_1/features/home/data/dto/get_posts/get_posts_response.dart';
import 'package:testcase_1/features/home/data/entities/post.dart';
import 'package:testcase_1/features/home/data/mappers/post_mapper.dart';

class PostEndpoints {
  PostEndpoints._();

  // ═══════════════════════════════════════════════════════════════════════════
  // Queries
  // ═══════════════════════════════════════════════════════════════════════════

  static final getPosts = SimpleQueryEndpoint<List<Post>>(
    path: '/posts',
    fromJson: (json) => PostMapper.fromGetPostsResponseList(
      GetPostsResponse.fromJsonList(json),
    ),
    cachePolicy: const CachePolicy(
      ttlSeconds: 300,
      tags: ['posts'],
    ),
  );

  static final getPost = QueryEndpoint<Post, String>(
    pathBuilder: (id) => '/posts/$id',
    fromJson: (json) => PostMapper.fromGetPostsResponse(
      GetPostsResponse.fromJson(json as Map<String, dynamic>),
    ),
    cachePolicy: const CachePolicy(
      ttlSeconds: 300,
      tags: ['posts', 'post-detail'],
    ),
  );

  static final getPostsByCategory = QueryEndpoint<List<Post>, PostCategory>(
    path: '/posts',
    queryParams: (category) => {
      'category_id': _categoryToId(category).toString(),
    },
    fromJson: (json) => PostMapper.fromGetPostsResponseList(
      GetPostsResponse.fromJsonList(json),
    ),
    cachePolicy: const CachePolicy(ttlSeconds: 300, tags: ['posts']),
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // Mutations
  // ═══════════════════════════════════════════════════════════════════════════

  static final createPost =
      MutationEndpoint<Post, void, Map<String, dynamic>>(
        path: '/posts',
        method: HttpMethod.post,
        fromJson: (json) => PostMapper.fromGetPostsResponse(
          GetPostsResponse.fromJson(json as Map<String, dynamic>),
        ),
        invalidatesTags: ['posts'],
      );

  static final updatePost =
      MutationEndpoint<Post, String, Map<String, dynamic>>(
        pathBuilder: (id) => '/posts/$id',
        method: HttpMethod.put,
        fromJson: (json) => PostMapper.fromGetPostsResponse(
          GetPostsResponse.fromJson(json as Map<String, dynamic>),
        ),
        invalidatesTags: ['posts', 'post-detail'],
      );

  static final deletePost = MutationEndpoint<void, String, void>(
    pathBuilder: (id) => '/posts/$id',
    method: HttpMethod.delete,
    fromJson: (_) {},
    invalidatesTags: ['posts'],
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // Helpers
  // ═══════════════════════════════════════════════════════════════════════════

  static int _categoryToId(PostCategory category) {
    switch (category) {
      case PostCategory.technology:
        return 1;
      case PostCategory.lifestyle:
        return 2;
      case PostCategory.business:
        return 3;
      case PostCategory.other:
        return 4;
    }
  }
}
```

#### Step 2: Update `home_page.dart`

**File:** `lib/features/home/presentation/home/home_page.dart`

**Action:** Replace Bloc with QueryBuilder, merge post list logic into page

```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testcase_1/core/query/query.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/features/home/data/api/post_endpoints.dart';
import 'package:testcase_1/features/home/data/entities/post.dart';
import 'package:testcase_1/features/home/presentation/_widgets/post_card.dart';
import 'package:testcase_1/features/home/presentation/home/sections/home_header_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeaderSection(),
            Expanded(
              child: QueryBuilder<List<Post>, void>.simple(
                endpoint: PostEndpoints.getPosts,
                onError: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
                },
                builder: (context, state, refetch) {
                  // ════════════════════════════════════════════════════════
                  // Loading State
                  // ════════════════════════════════════════════════════════
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // ════════════════════════════════════════════════════════
                  // Error State (no data)
                  // ════════════════════════════════════════════════════════
                  if (state.isError && !state.hasData) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('home.error.load_failed'.tr()),
                          AppSpacing.heightMd,
                          ElevatedButton(
                            onPressed: refetch,
                            child: Text('common.retry'.tr()),
                          ),
                        ],
                      ),
                    );
                  }

                  // ════════════════════════════════════════════════════════
                  // Success State
                  // ════════════════════════════════════════════════════════
                  final posts = state.data ?? [];

                  if (posts.isEmpty) {
                    return Center(child: Text('home.empty'.tr()));
                  }

                  return Stack(
                    children: [
                      RefreshIndicator(
                        onRefresh: refetch,
                        child: ListView.builder(
                          padding: AppSpacing.paddingMd,
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            final post = posts[index];
                            return PostCard(
                              post: post,
                              onTap: () => context.push('/home/post/${post.id}'),
                            );
                          },
                        ),
                      ),

                      // Refetching indicator
                      if (state.isFetching)
                        const Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: LinearProgressIndicator(),
                        ),

                      // Stale indicator (optional)
                      if (state.isStale)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Chip(
                            label: Text('home.stale'.tr()),
                            backgroundColor: Colors.orange.shade100,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### Step 3: Update `home_header_section.dart`

**File:** `lib/features/home/presentation/home/sections/home_header_section.dart`

**Action:** Remove any Bloc dependency (if any), keep simple

```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/features/home/presentation/_modals/post_filter/post_filter_modal.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.paddingLg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'home.title'.tr(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'home.subtitle'.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => PostFilterModal.show(context),
            tooltip: 'home.filter'.tr(),
          ),
        ],
      ),
    );
  }
}
```

#### Step 4: Update `post_detail_page.dart`

**File:** `lib/features/home/presentation/post_detail/page/post_detail_page.dart`

**Action:** Replace Bloc with QueryBuilder

```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testcase_1/core/query/query.dart';
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/features/home/data/api/post_endpoints.dart';
import 'package:testcase_1/features/home/data/entities/post.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key, required this.postId});

  final String postId;

  static const routeName = '/home/post/:id';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('post_detail.title'.tr()),
      ),
      body: QueryBuilder<Post, String>(
        endpoint: PostEndpoints.getPost,
        params: postId,
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        },
        builder: (context, state, refetch) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.isError && !state.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('post_detail.error.load_failed'.tr()),
                  AppSpacing.heightMd,
                  ElevatedButton(
                    onPressed: refetch,
                    child: Text('common.retry'.tr()),
                  ),
                ],
              ),
            );
          }

          final post = state.data;
          if (post == null) {
            return Center(child: Text('post_detail.not_found'.tr()));
          }

          return RefreshIndicator(
            onRefresh: refetch,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: AppSpacing.paddingLg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category chip
                  Chip(label: Text(post.category.name)),
                  AppSpacing.heightMd,

                  // Title
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  AppSpacing.heightSm,

                  // Author & Date
                  Text(
                    '${post.author} • ${_formatDate(post.createdAt)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  AppSpacing.heightLg,

                  // Body
                  Text(
                    post.body,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
```

#### Step 5: Delete Unused Files

**Action:** Delete the following files:

```
# Bloc files - replaced by Query System
DELETE: lib/features/home/bloc/home/home_cubit.dart
DELETE: lib/features/home/bloc/home/home_state.dart
DELETE: lib/features/home/bloc/post_detail/post_detail_cubit.dart
DELETE: lib/features/home/bloc/post_detail/post_detail_state.dart

# Repository files - not needed with Query System
DELETE: lib/features/home/data/repositories/post_repository.dart
DELETE: lib/features/home/data/repositories/post_repository_impl.dart

# Section merged into home_page.dart
DELETE: lib/features/home/presentation/home/sections/home_post_list_section.dart

# Old DTO files (replaced by get_posts/ folder structure)
DELETE: lib/features/home/data/dto/post_response.dart
DELETE: lib/features/home/data/dto/post_response.g.dart
DELETE: lib/features/home/data/dto/response/post_response.dart (if exists)
DELETE: lib/features/home/data/dto/request/create_post_request.dart (if exists)
DELETE: lib/features/home/data/dto/create_post_request.dart
DELETE: lib/features/home/data/dto/create_post_request.g.dart
DELETE: lib/features/home/data/dto/update_post_request.dart

# Old API service (if renamed to post_endpoints.dart)
DELETE: lib/features/home/data/api/post_api_service.dart (if post_endpoints.dart exists)
```

#### Step 6: Update DI Registration

**File:** `lib/app/di/register_module.dart` atau `di.config.dart`

**Action:** Remove registrations for deleted classes:

```dart
// REMOVE these registrations:
// - PostRepository / PostRepositoryImpl
// - HomeCubit
// - PostDetailCubit

// KEEP:
// - QueryClient (required for Query System)
// - CacheManager (required for caching)
```

---

## PART 3: FINAL CLEANUP

### Update Barrel Files

**File:** `lib/features/auth/auth.dart` (if exists)

```dart
// Update exports to reflect new structure
export 'data/api/auth_endpoints.dart';
export 'data/dto/oauth_login/oauth_login_request.dart';
export 'data/dto/oauth_login/oauth_login_response.dart';
export 'presentation/login/page/login_page.dart';
```

**File:** `lib/features/home/home.dart` (if exists)

```dart
// Update exports to reflect new structure
export 'data/api/post_endpoints.dart';
export 'data/entities/post.dart';
export 'presentation/home/home_page.dart';
export 'presentation/post_detail/page/post_detail_page.dart';
```

### Run Build Runner

After all changes, run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Verify No Broken Imports

```bash
flutter analyze
```

Fix any broken imports pointing to deleted files.

---

## Summary Checklist

### Auth Login

- [ ] Rename `auth_api_service.dart` → `auth_endpoints.dart`
- [ ] Remove instance methods and constructor from AuthEndpoints
- [ ] Create `login_social_section.dart` with MutationBuilder
- [ ] Update `login_page.dart` to include LoginSocialSection
- [ ] Delete Bloc files (login*cubit, login_state, social_login*\*)
- [ ] Delete `auth_repository.dart`
- [ ] Update DI registrations

### Home Posts

- [ ] Verify `post_endpoints.dart` structure
- [ ] Update `home_page.dart` with QueryBuilder
- [ ] Update `home_header_section.dart` (remove Bloc dependency)
- [ ] Update `post_detail_page.dart` with QueryBuilder
- [ ] Delete Bloc files (home*cubit, home_state, post_detail*\*)
- [ ] Delete repository files
- [ ] Delete `home_post_list_section.dart`
- [ ] Clean up old DTO files
- [ ] Update DI registrations

### Final

- [ ] Update barrel files
- [ ] Run build_runner
- [ ] Run flutter analyze
- [ ] Test login flow
- [ ] Test home page
- [ ] Test post detail page
