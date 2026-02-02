# Query System Blueprint

> RTK Query-like data fetching solution untuk Flutter dengan caching, invalidation, dan type-safety.

---

## Table of Contents

1. [Overview](#overview)
2. [Architecture](#architecture)
3. [File Structure](#file-structure)
4. [Implementation Guide](#implementation-guide)
5. [API Reference](#api-reference)
6. [Usage Examples](#usage-examples)
7. [Migration Guide](#migration-guide)

---

## Overview

### Goals

- **Zero boilerplate**: Define endpoint sekali, pakai di mana saja tanpa buat Bloc/Cubit manual
- **Built-in caching**: Automatic caching dengan TTL dan tag-based invalidation
- **Type-safe**: Full type safety untuk params, body, dan response
- **RTK Query DX**: Developer experience mirip RTK Query (React)
- **Flexible**: Support simple queries sampai complex business logic

### Features

| Feature                  | Status | Description                           |
| ------------------------ | ------ | ------------------------------------- |
| Query Endpoint           | ✅     | Simple GET requests dengan caching    |
| Custom Query Endpoint    | ✅     | Complex queries dengan custom fetcher |
| Mutation Endpoint        | ✅     | POST/PUT/DELETE requests              |
| Custom Mutation Endpoint | ✅     | Mutations dengan side effects         |
| Tag-based Invalidation   | ✅     | Invalidate cache by tags              |
| Auto Refetch             | ✅     | Refetch setelah mutation              |
| Polling                  | ✅     | Auto refetch interval                 |
| Stale While Revalidate   | ✅     | Show stale data while fetching        |
| Pagination               | 🔜     | Infinite scroll support               |
| Optimistic Updates       | 🔜     | Update UI before server response      |

---

## Architecture

### High-Level Diagram

```
┌─────────────────────────────────────────────────────────────────────────┐
│                              UI Layer                                   │
│                                                                         │
│   QueryBuilder<T, P>              MutationBuilder<T, P, B>              │
│   - Subscribes to query state     - Provides mutate function            │
│   - Auto fetch on mount           - Handles loading/error states        │
│   - Provides refetch callback     - Auto invalidates tags               │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                           Endpoint Layer                                │
│                                                                         │
│   ┌─────────────────────┐         ┌─────────────────────┐               │
│   │   QueryEndpoint     │         │   MutationEndpoint  │               │
│   │   - path/pathBuilder│         │   - path/pathBuilder│               │
│   │   - fromJson        │         │   - method          │               │
│   │   - cachePolicy     │         │   - fromJson        │               │
│   │   - queryParams     │         │   - invalidatesTags │               │
│   └─────────────────────┘         └─────────────────────┘               │
│                                                                         │
│   ┌─────────────────────┐         ┌─────────────────────┐               │
│   │ CustomQueryEndpoint │         │CustomMutationEndpoint│              │
│   │   - queryKey        │         │   - mutator         │               │
│   │   - fetcher         │         │   - invalidatesTags │               │
│   │   - cachePolicy     │         │   - onSuccess       │               │
│   └─────────────────────┘         └─────────────────────┘               │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                           QueryClient                                   │
│                                                                         │
│   - Manages all query/mutation states                                   │
│   - Handles caching logic                                               │
│   - Executes fetch/mutate operations                                    │
│   - Tag-based invalidation                                              │
│   - Notifies subscribers on state changes                               │
└─────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                         Infrastructure Layer                            │
│                                                                         │
│   ┌─────────────────────┐         ┌─────────────────────┐               │
│   │     ApiClient       │         │    CacheManager     │               │
│   │   - HTTP requests   │         │   - Memory cache    │               │
│   │   - Error mapping   │         │   - Hive persistence│               │
│   │   - Result<T>       │         │   - Tag indexing    │               │
│   └─────────────────────┘         └─────────────────────┘               │
└─────────────────────────────────────────────────────────────────────────┘
```

### Data Flow

```
1. QUERY FLOW
   ┌────────────┐     ┌──────────────┐     ┌─────────────┐
   │ UI mounts  │ ──▶ │ QueryBuilder │ ──▶ │ QueryClient │
   │ widget     │     │ subscribes   │     │ .query()    │
   └────────────┘     └──────────────┘     └─────────────┘
                                                  │
                      ┌───────────────────────────┼───────────────────────────┐
                      ▼                           ▼                           ▼
               ┌─────────────┐            ┌─────────────┐            ┌─────────────┐
               │ Check cache │            │ Cache HIT   │            │ Cache MISS  │
               │ validity    │            │ Return data │            │ Fetch API   │
               └─────────────┘            └─────────────┘            └─────────────┘
                                                                            │
                                                                            ▼
                                                                     ┌─────────────┐
                                                                     │ Update cache│
                                                                     │ Notify subs │
                                                                     └─────────────┘

2. MUTATION FLOW
   ┌────────────┐     ┌──────────────────┐     ┌─────────────┐
   │ User taps  │ ──▶ │ MutationBuilder  │ ──▶ │ QueryClient │
   │ button     │     │ calls mutate()   │     │ .mutate()   │
   └────────────┘     └──────────────────┘     └─────────────┘
                                                      │
                                                      ▼
                                               ┌─────────────┐
                                               │ Execute API │
                                               │ POST/PUT/DEL│
                                               └─────────────┘
                                                      │
                                    ┌─────────────────┼─────────────────┐
                                    ▼                                   ▼
                             ┌─────────────┐                     ┌─────────────┐
                             │ On Success  │                     │ On Error    │
                             │ Invalidate  │                     │ Return error│
                             │ tags        │                     │ state       │
                             └─────────────┘                     └─────────────┘
                                    │
                                    ▼
                             ┌─────────────┐
                             │ Affected    │
                             │ queries     │
                             │ auto refetch│
                             └─────────────┘
```

---

## File Structure

```
lib/
├── core/
│   ├── query/
│   │   │
│   │   ├── client/
│   │   │   ├── query_client.dart              # Core engine
│   │   │   ├── query_client_provider.dart     # InheritedWidget untuk akses global
│   │   │   └── query_observer.dart            # Optional: logging/debugging
│   │   │
│   │   ├── endpoints/
│   │   │   ├── base_endpoint.dart             # Abstract base class
│   │   │   ├── query_endpoint.dart            # Simple query definition
│   │   │   ├── custom_query_endpoint.dart     # Complex query dengan custom fetcher
│   │   │   ├── mutation_endpoint.dart         # Simple mutation definition
│   │   │   └── custom_mutation_endpoint.dart  # Complex mutation dengan side effects
│   │   │
│   │   ├── states/
│   │   │   ├── query_state.dart               # Query state model (loading, data, error)
│   │   │   └── mutation_state.dart            # Mutation state model
│   │   │
│   │   ├── builders/
│   │   │   ├── query_builder.dart             # Widget untuk consume query
│   │   │   ├── mutation_builder.dart          # Widget untuk consume mutation
│   │   │   └── query_listener.dart            # Listen tanpa rebuild (side effects)
│   │   │
│   │   ├── options/
│   │   │   ├── query_options.dart             # Query config (polling, enabled, etc)
│   │   │   └── mutation_options.dart          # Mutation config
│   │   │
│   │   └── query.dart                         # Barrel file - export semua
│   │
│   └── network/                               # EXISTING - tidak diubah
│       ├── api_client.dart
│       ├── dio_client.dart
│       └── cache/
│           ├── cache_manager.dart
│           ├── cache_policy.dart
│           └── ...
│
└── features/
    ├── auth/
    │   ├── data/
    │   │   ├── api/
    │   │   │   └── auth_endpoints.dart        # Auth endpoints (naming: *_endpoints.dart)
    │   │   └── dto/
    │   │       ├── login/                     # DTO per endpoint
    │   │       │   ├── login_request.dart
    │   │       │   └── login_response.dart
    │   │       ├── register/
    │   │       │   ├── register_request.dart
    │   │       │   └── register_response.dart
    │   │       └── refresh/
    │   │           ├── refresh_request.dart
    │   │           └── refresh_response.dart
    │   ├── domain/
    │   │   └── entities/
    │   │       └── user.dart                  # Domain entity
    │   └── presentation/
    │       └── login/
    │           └── page/
    │               ├── login_page.dart        # Main page dengan routing
    │               └── sections/              # UI sections
    │                   ├── login_form_section.dart
    │                   └── login_header_section.dart
    │
    └── home/
        ├── data/
        │   ├── api/
        │   │   └── post_endpoints.dart        # Post endpoints (naming: *_endpoints.dart)
        │   ├── dto/
        │   │   ├── get_posts/                 # DTO per endpoint
        │   │   │   └── get_posts_response.dart
        │   │   ├── get_post/
        │   │   │   └── get_post_response.dart
        │   │   ├── create_post/
        │   │   │   ├── create_post_request.dart
        │   │   │   └── create_post_response.dart
        │   │   ├── update_post/
        │   │   │   ├── update_post_request.dart
        │   │   │   └── update_post_response.dart
        │   │   └── delete_post/
        │   │       └── (no DTO needed)
        │   ├── entities/
        │   │   └── post.dart                  # Domain entity
        │   └── mappers/
        │       └── post_mapper.dart           # DTO <-> Entity mapping
        └── presentation/
            └── home/
                ├── home_page.dart             # Main page dengan QueryBuilder
                └── sections/                  # UI sections
                    ├── home_header_section.dart
                    └── home_post_list_section.dart
```

### Naming Conventions

| Item            | Convention         | Example                                      |
| --------------- | ------------------ | -------------------------------------------- |
| Endpoints file  | `*_endpoints.dart` | `auth_endpoints.dart`, `post_endpoints.dart` |
| Endpoints class | `*Endpoints`       | `AuthEndpoints`, `PostEndpoints`             |
| DTO folder      | Per endpoint name  | `login/`, `register/`, `get_posts/`          |
| Request DTO     | `*_request.dart`   | `login_request.dart`                         |
| Response DTO    | `*_response.dart`  | `login_response.dart`                        |
| Entity          | Singular noun      | `user.dart`, `post.dart`                     |
| Mapper          | `*_mapper.dart`    | `post_mapper.dart`                           |

---

## Implementation Guide

### Phase 1: Core States

#### 1.1 Query State (`lib/core/query/states/query_state.dart`)

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_state.freezed.dart';

/// Status enum untuk query lifecycle
enum QueryStatus {
  /// Initial state, belum pernah fetch
  idle,

  /// Sedang fetch untuk pertama kali (tidak ada data)
  loading,

  /// Sedang refetch (sudah ada data sebelumnya)
  fetching,

  /// Fetch berhasil
  success,

  /// Fetch gagal
  error,
}

/// State model untuk query
@freezed
class QueryState<T> with _$QueryState<T> {
  const QueryState._();

  const factory QueryState({
    /// Data hasil fetch (bisa null jika belum fetch atau error)
    T? data,

    /// Status query saat ini
    @Default(QueryStatus.idle) QueryStatus status,

    /// Error message jika status == error
    String? errorMessage,

    /// Timestamp terakhir data di-update
    DateTime? lastUpdated,

    /// True jika data dari cache yang sudah expired
    @Default(false) bool isStale,

    /// True jika response dari cache (bukan fresh dari API)
    @Default(false) bool isFromCache,
  }) = _QueryState<T>;

  // ═══════════════════════════════════════════════════════════
  // Convenience getters
  // ═══════════════════════════════════════════════════════════

  /// True jika status idle (belum pernah fetch)
  bool get isIdle => status == QueryStatus.idle;

  /// True jika sedang loading TANPA data sebelumnya
  bool get isLoading => status == QueryStatus.loading;

  /// True jika sedang fetch DENGAN data sebelumnya (refetch)
  bool get isFetching => status == QueryStatus.fetching;

  /// True jika fetch berhasil
  bool get isSuccess => status == QueryStatus.success;

  /// True jika fetch gagal
  bool get isError => status == QueryStatus.error;

  /// True jika ada data (terlepas dari status)
  bool get hasData => data != null;

  /// True jika ada error message
  bool get hasError => errorMessage != null;

  // ═══════════════════════════════════════════════════════════
  // Factory methods untuk state transitions
  // ═══════════════════════════════════════════════════════════

  /// Create loading state (first fetch)
  factory QueryState.loading() => const QueryState(status: QueryStatus.loading);

  /// Create fetching state (refetch with existing data)
  factory QueryState.fetching(T data) => QueryState(
    data: data,
    status: QueryStatus.fetching,
  );

  /// Create success state
  factory QueryState.success(T data, {bool isFromCache = false}) => QueryState(
    data: data,
    status: QueryStatus.success,
    lastUpdated: DateTime.now(),
    isFromCache: isFromCache,
  );

  /// Create error state (keep old data if available)
  factory QueryState.error(String message, {T? previousData}) => QueryState(
    data: previousData,
    status: QueryStatus.error,
    errorMessage: message,
  );
}
```

#### 1.2 Mutation State (`lib/core/query/states/mutation_state.dart`)

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mutation_state.freezed.dart';

/// Status enum untuk mutation lifecycle
enum MutationStatus {
  /// Initial state, belum pernah mutate
  idle,

  /// Sedang proses mutation
  loading,

  /// Mutation berhasil
  success,

  /// Mutation gagal
  error,
}

/// State model untuk mutation
@freezed
class MutationState<T> with _$MutationState<T> {
  const MutationState._();

  const factory MutationState({
    /// Data hasil mutation (bisa null jika belum mutate atau error)
    T? data,

    /// Status mutation saat ini
    @Default(MutationStatus.idle) MutationStatus status,

    /// Error message jika status == error
    String? errorMessage,
  }) = _MutationState<T>;

  // ═══════════════════════════════════════════════════════════
  // Convenience getters
  // ═══════════════════════════════════════════════════════════

  /// True jika status idle (belum pernah mutate)
  bool get isIdle => status == MutationStatus.idle;

  /// True jika sedang proses mutation
  bool get isLoading => status == MutationStatus.loading;

  /// True jika mutation berhasil
  bool get isSuccess => status == MutationStatus.success;

  /// True jika mutation gagal
  bool get isError => status == MutationStatus.error;

  /// True jika ada data
  bool get hasData => data != null;

  // ═══════════════════════════════════════════════════════════
  // Factory methods untuk state transitions
  // ═══════════════════════════════════════════════════════════

  /// Create loading state
  factory MutationState.loading() => const MutationState(status: MutationStatus.loading);

  /// Create success state
  factory MutationState.success(T data) => MutationState(
    data: data,
    status: MutationStatus.success,
  );

  /// Create error state
  factory MutationState.error(String message) => MutationState(
    status: MutationStatus.error,
    errorMessage: message,
  );
}
```

---

### Phase 2: Endpoint Definitions

#### 2.1 Base Endpoint (`lib/core/query/endpoints/base_endpoint.dart`)

```dart
import 'package:testcase_1/core/network/cache/cache_policy.dart';

/// HTTP methods untuk mutations
enum HttpMethod { get, post, put, patch, delete }

/// Base class untuk semua endpoint types
abstract class BaseEndpoint {
  const BaseEndpoint();
}

/// Mixin untuk endpoints yang support caching
mixin CacheableEndpoint {
  CachePolicy get cachePolicy;
  List<String> get tags => cachePolicy.tags;
}

/// Mixin untuk endpoints yang invalidate cache
mixin InvalidatingEndpoint {
  List<String> get invalidatesTags;
}
```

#### 2.2 Query Endpoint (`lib/core/query/endpoints/query_endpoint.dart`)

````dart
import 'package:testcase_1/core/network/cache/cache_policy.dart';
import 'package:testcase_1/core/query/endpoints/base_endpoint.dart';

/// Endpoint definition untuk simple GET queries
///
/// Type parameters:
/// - [TData]: Tipe data response
/// - [TParams]: Tipe parameter (gunakan `void` jika tidak ada params)
///
/// Example:
/// ```dart
/// // Tanpa params
/// static final getPosts = QueryEndpoint<List<Post>, void>(
///   path: '/posts',
///   fromJson: Post.fromJsonList,
/// );
///
/// // Dengan params
/// static final getPost = QueryEndpoint<Post, String>(
///   pathBuilder: (id) => '/posts/$id',
///   fromJson: Post.fromJson,
/// );
///
/// // Dengan query params
/// static final searchPosts = QueryEndpoint<List<Post>, SearchParams>(
///   path: '/posts/search',
///   queryParams: (params) => params.toMap(),
///   fromJson: Post.fromJsonList,
/// );
/// ```
class QueryEndpoint<TData, TParams> extends BaseEndpoint with CacheableEndpoint {
  /// Static path (gunakan ini ATAU pathBuilder, tidak keduanya)
  final String? path;

  /// Dynamic path builder (untuk path dengan params seperti `/posts/$id`)
  final String Function(TParams params)? pathBuilder;

  /// Function untuk convert JSON response ke [TData]
  final TData Function(dynamic json) fromJson;

  /// Function untuk convert [TParams] ke query parameters
  final Map<String, dynamic> Function(TParams params)? queryParams;

  /// Cache policy (TTL, tags, SWR)
  @override
  final CachePolicy cachePolicy;

  const QueryEndpoint({
    this.path,
    this.pathBuilder,
    required this.fromJson,
    this.queryParams,
    this.cachePolicy = const CachePolicy(),
  }) : assert(
         path != null || pathBuilder != null,
         'Either path or pathBuilder must be provided',
       );

  /// Build full path dengan params
  String buildPath(TParams params) {
    if (pathBuilder != null) {
      return pathBuilder!(params);
    }
    return path!;
  }

  /// Build query parameters
  Map<String, dynamic>? buildQueryParams(TParams params) {
    return queryParams?.call(params);
  }

  /// Generate cache key untuk query ini
  String buildCacheKey(TParams params) {
    final path = buildPath(params);
    final query = buildQueryParams(params);

    if (query == null || query.isEmpty) {
      return 'GET:$path';
    }

    final sortedQuery = Map.fromEntries(
      query.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
    );
    return 'GET:$path:${sortedQuery.toString()}';
  }
}

/// Shortcut untuk QueryEndpoint tanpa params
///
/// Example:
/// ```dart
/// static final getPosts = SimpleQueryEndpoint<List<Post>>(
///   path: '/posts',
///   fromJson: Post.fromJsonList,
/// );
/// ```
class SimpleQueryEndpoint<TData> extends QueryEndpoint<TData, void> {
  const SimpleQueryEndpoint({
    required String path,
    required super.fromJson,
    super.cachePolicy,
  }) : super(path: path);

  @override
  String buildPath(void params) => path!;

  @override
  Map<String, dynamic>? buildQueryParams(void params) => null;

  @override
  String buildCacheKey(void params) => 'GET:$path';
}
````

#### 2.3 Custom Query Endpoint (`lib/core/query/endpoints/custom_query_endpoint.dart`)

````dart
import 'package:testcase_1/core/network/cache/cache_policy.dart';
import 'package:testcase_1/core/query/endpoints/base_endpoint.dart';
import 'package:testcase_1/core/query/client/query_client.dart';

/// Type definition untuk custom fetcher function
///
/// Parameters:
/// - [params]: Parameter dari UI
/// - [client]: QueryClient untuk nested queries
typedef QueryFetcher<TData, TParams> = Future<TData> Function(
  TParams params,
  QueryClient client,
);

/// Endpoint definition untuk complex queries dengan custom fetcher
///
/// Gunakan ini ketika:
/// - Perlu combine multiple API calls
/// - Perlu transform data sebelum return
/// - Perlu business logic kompleks
///
/// Example:
/// ```dart
/// static final getPostWithComments = CustomQueryEndpoint<PostWithComments, String>(
///   queryKey: (id) => ['post-with-comments', id],
///   cachePolicy: CachePolicy(tags: ['posts', 'comments']),
///   fetcher: (id, client) async {
///     final post = await client.fetch(getPost, params: id);
///     final comments = await client.fetch(getComments, params: id);
///     return PostWithComments(post: post, comments: comments);
///   },
/// );
/// ```
class CustomQueryEndpoint<TData, TParams> extends BaseEndpoint with CacheableEndpoint {
  /// Function untuk generate unique cache key
  final List<String> Function(TParams params) queryKey;

  /// Custom fetcher function
  final QueryFetcher<TData, TParams> fetcher;

  /// Cache policy
  @override
  final CachePolicy cachePolicy;

  const CustomQueryEndpoint({
    required this.queryKey,
    required this.fetcher,
    this.cachePolicy = const CachePolicy(),
  });

  /// Build cache key dari queryKey function
  String buildCacheKey(TParams params) {
    return queryKey(params).join(':');
  }

  /// Execute fetcher
  Future<TData> execute(TParams params, QueryClient client) {
    return fetcher(params, client);
  }
}

/// Shortcut untuk CustomQueryEndpoint tanpa params
class SimpleCustomQueryEndpoint<TData> extends CustomQueryEndpoint<TData, void> {
  SimpleCustomQueryEndpoint({
    required List<String> queryKey,
    required Future<TData> Function(QueryClient client) fetcher,
    super.cachePolicy,
  }) : super(
         queryKey: (_) => queryKey,
         fetcher: (_, client) => fetcher(client),
       );
}
````

#### 2.4 Mutation Endpoint (`lib/core/query/endpoints/mutation_endpoint.dart`)

````dart
import 'package:testcase_1/core/query/endpoints/base_endpoint.dart';

/// Endpoint definition untuk simple mutations (POST/PUT/DELETE)
///
/// Type parameters:
/// - [TData]: Tipe data response
/// - [TParams]: Tipe parameter untuk path (gunakan `void` jika tidak ada)
/// - [TBody]: Tipe request body (gunakan `void` jika tidak ada body)
///
/// Example:
/// ```dart
/// // POST tanpa params
/// static final createPost = MutationEndpoint<Post, void, CreatePostBody>(
///   path: '/posts',
///   method: HttpMethod.post,
///   fromJson: Post.fromJson,
///   invalidatesTags: ['posts'],
/// );
///
/// // PUT dengan params
/// static final updatePost = MutationEndpoint<Post, String, UpdatePostBody>(
///   pathBuilder: (id) => '/posts/$id',
///   method: HttpMethod.put,
///   fromJson: Post.fromJson,
///   invalidatesTags: ['posts', 'post-detail'],
/// );
///
/// // DELETE tanpa body
/// static final deletePost = MutationEndpoint<void, String, void>(
///   pathBuilder: (id) => '/posts/$id',
///   method: HttpMethod.delete,
///   fromJson: (_) {},
///   invalidatesTags: ['posts'],
/// );
/// ```
class MutationEndpoint<TData, TParams, TBody> extends BaseEndpoint with InvalidatingEndpoint {
  /// Static path
  final String? path;

  /// Dynamic path builder
  final String Function(TParams params)? pathBuilder;

  /// HTTP method
  final HttpMethod method;

  /// Function untuk convert JSON response ke [TData]
  final TData Function(dynamic json) fromJson;

  /// Tags to invalidate on success
  @override
  final List<String> invalidatesTags;

  /// Optional: Function untuk transform body sebelum send
  final Map<String, dynamic> Function(TBody body)? bodyTransformer;

  const MutationEndpoint({
    this.path,
    this.pathBuilder,
    required this.method,
    required this.fromJson,
    this.invalidatesTags = const [],
    this.bodyTransformer,
  }) : assert(
         path != null || pathBuilder != null,
         'Either path or pathBuilder must be provided',
       );

  /// Build full path dengan params
  String buildPath(TParams params) {
    if (pathBuilder != null) {
      return pathBuilder!(params);
    }
    return path!;
  }

  /// Transform body jika ada transformer
  dynamic transformBody(TBody body) {
    if (bodyTransformer != null) {
      return bodyTransformer!(body);
    }
    // Jika body adalah object dengan toJson, panggil itu
    if (body is Map) {
      return body;
    }
    // Try to call toJson if exists
    try {
      return (body as dynamic).toJson();
    } catch (_) {
      return body;
    }
  }
}

/// Shortcut untuk mutation tanpa params dan body (simple action)
class SimpleMutationEndpoint<TData> extends MutationEndpoint<TData, void, void> {
  const SimpleMutationEndpoint({
    required String path,
    required super.method,
    required super.fromJson,
    super.invalidatesTags,
  }) : super(path: path);

  @override
  String buildPath(void params) => path!;
}
````

#### 2.5 Custom Mutation Endpoint (`lib/core/query/endpoints/custom_mutation_endpoint.dart`)

````dart
import 'package:testcase_1/core/query/endpoints/base_endpoint.dart';
import 'package:testcase_1/core/query/client/query_client.dart';
import 'package:get_it/get_it.dart';

/// Type definition untuk custom mutator function
///
/// Parameters:
/// - [params]: Parameter dari UI
/// - [body]: Request body dari UI
/// - [client]: QueryClient untuk nested operations
/// - [deps]: GetIt untuk akses dependencies (services, etc)
typedef MutationMutator<TData, TParams, TBody> = Future<TData> Function(
  TParams params,
  TBody body,
  QueryClient client,
  GetIt deps,
);

/// Endpoint definition untuk complex mutations dengan side effects
///
/// Gunakan ini ketika:
/// - Perlu side effects (analytics, local DB, etc)
/// - Perlu multiple API calls dalam satu mutation
/// - Perlu access ke services lain
///
/// Example:
/// ```dart
/// static final createPostWithDraft = CustomMutationEndpoint<Post, void, CreatePostBody>(
///   invalidatesTags: ['posts'],
///   mutator: (_, body, client, deps) async {
///     // Create post via API
///     final post = await client.mutate(createPost, body: body);
///
///     // Side effect: clear local draft
///     await deps.get<LocalDatabase>().clearDraft(body.draftId);
///
///     // Side effect: track analytics
///     deps.get<AnalyticsService>().trackPostCreated(post.id);
///
///     return post;
///   },
/// );
/// ```
class CustomMutationEndpoint<TData, TParams, TBody> extends BaseEndpoint with InvalidatingEndpoint {
  /// Custom mutator function
  final MutationMutator<TData, TParams, TBody> mutator;

  /// Tags to invalidate on success
  @override
  final List<String> invalidatesTags;

  /// Optional: Callback on success
  final void Function(TData data)? onSuccess;

  /// Optional: Callback on error
  final void Function(String error)? onError;

  const CustomMutationEndpoint({
    required this.mutator,
    this.invalidatesTags = const [],
    this.onSuccess,
    this.onError,
  });

  /// Execute mutator
  Future<TData> execute(
    TParams params,
    TBody body,
    QueryClient client,
    GetIt deps,
  ) {
    return mutator(params, body, client, deps);
  }
}
````

---

### Phase 3: Query Client

#### 3.1 Query Client (`lib/core/query/client/query_client.dart`)

```dart
import 'dart:async';
import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testcase_1/core/network/api_client.dart';
import 'package:testcase_1/core/network/cache/cache_manager.dart';
import 'package:testcase_1/core/network/cache/cache_policy.dart';
import 'package:testcase_1/core/query/endpoints/base_endpoint.dart';
import 'package:testcase_1/core/query/endpoints/query_endpoint.dart';
import 'package:testcase_1/core/query/endpoints/custom_query_endpoint.dart';
import 'package:testcase_1/core/query/endpoints/mutation_endpoint.dart';
import 'package:testcase_1/core/query/endpoints/custom_mutation_endpoint.dart';
import 'package:testcase_1/core/query/states/query_state.dart';
import 'package:testcase_1/core/query/states/mutation_state.dart';

/// Core engine untuk Query System
///
/// Responsibilities:
/// - Execute queries dan mutations
/// - Manage cache
/// - Notify subscribers on state changes
/// - Handle tag-based invalidation
class QueryClient {
  final ApiClient _apiClient;
  final CacheManager _cacheManager;
  final GetIt _deps;

  /// Map of active query streams by cache key
  final Map<String, BehaviorSubject<QueryState<dynamic>>> _queryStreams = {};

  /// Map of in-flight requests to prevent duplicate calls
  final Map<String, Future<dynamic>> _inFlightRequests = {};

  /// Map of cache keys to their tags (for invalidation)
  final Map<String, Set<String>> _keyToTags = {};

  QueryClient({
    required ApiClient apiClient,
    required CacheManager cacheManager,
    GetIt? deps,
  })  : _apiClient = apiClient,
        _cacheManager = cacheManager,
        _deps = deps ?? GetIt.instance;

  // ═══════════════════════════════════════════════════════════════════════════
  // QUERY OPERATIONS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Subscribe ke query stream
  ///
  /// Returns stream of [QueryState] yang akan di-update setiap kali:
  /// - Query di-fetch
  /// - Cache di-invalidate
  /// - Manual refetch
  Stream<QueryState<TData>> watchQuery<TData, TParams>(
    QueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
    bool fetchOnSubscribe = true,
  }) {
    final key = endpoint.buildCacheKey(params);

    // Get or create stream
    final stream = _getOrCreateQueryStream<TData>(key);

    // Auto fetch on first subscribe
    if (fetchOnSubscribe && stream.value.isIdle) {
      _executeQuery(endpoint, params: params);
    }

    // Register tags for this key
    _registerTags(key, endpoint.cachePolicy.tags);

    return stream.stream.cast<QueryState<TData>>();
  }

  /// Subscribe ke custom query stream
  Stream<QueryState<TData>> watchCustomQuery<TData, TParams>(
    CustomQueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
    bool fetchOnSubscribe = true,
  }) {
    final key = endpoint.buildCacheKey(params);

    final stream = _getOrCreateQueryStream<TData>(key);

    if (fetchOnSubscribe && stream.value.isIdle) {
      _executeCustomQuery(endpoint, params: params);
    }

    _registerTags(key, endpoint.cachePolicy.tags);

    return stream.stream.cast<QueryState<TData>>();
  }

  /// Fetch query sekali (one-shot, tidak subscribe)
  Future<TData> fetch<TData, TParams>(
    QueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
  }) async {
    final state = await _executeQuery(endpoint, params: params);
    if (state.isError) {
      throw Exception(state.errorMessage);
    }
    return state.data as TData;
  }

  /// Fetch custom query sekali
  Future<TData> fetchCustom<TData, TParams>(
    CustomQueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
  }) async {
    final state = await _executeCustomQuery(endpoint, params: params);
    if (state.isError) {
      throw Exception(state.errorMessage);
    }
    return state.data as TData;
  }

  /// Refetch query (force fresh data)
  Future<void> refetch<TData, TParams>(
    QueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
  }) {
    return _executeQuery(endpoint, params: params, forceRefresh: true);
  }

  /// Internal: Execute query
  Future<QueryState<TData>> _executeQuery<TData, TParams>(
    QueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
    bool forceRefresh = false,
  }) async {
    final key = endpoint.buildCacheKey(params);
    final stream = _getOrCreateQueryStream<TData>(key);
    final currentState = stream.value as QueryState<TData>;

    // Check if already in flight
    if (_inFlightRequests.containsKey(key)) {
      return _inFlightRequests[key] as Future<QueryState<TData>>;
    }

    // Emit loading/fetching state
    if (currentState.hasData) {
      stream.add(QueryState<TData>.fetching(currentState.data as TData));
    } else {
      stream.add(QueryState<TData>.loading());
    }

    // Check cache first (if not forcing refresh)
    if (!forceRefresh) {
      final cached = await _cacheManager.get(key);
      if (cached != null && !cached.isExpired) {
        final data = endpoint.fromJson(jsonDecode(cached.data));
        final state = QueryState<TData>.success(data, isFromCache: true);
        stream.add(state);
        return state;
      }
    }

    // Create fetch future
    final fetchFuture = _doFetch(endpoint, params, stream, key);
    _inFlightRequests[key] = fetchFuture;

    try {
      return await fetchFuture;
    } finally {
      _inFlightRequests.remove(key);
    }
  }

  /// Internal: Do actual fetch
  Future<QueryState<TData>> _doFetch<TData, TParams>(
    QueryEndpoint<TData, TParams> endpoint,
    TParams params,
    BehaviorSubject<QueryState<dynamic>> stream,
    String key,
  ) async {
    try {
      final path = endpoint.buildPath(params);
      final queryParams = endpoint.buildQueryParams(params);

      final result = await _apiClient.get<TData>(
        path: path,
        queryParameters: queryParams,
        fromJson: endpoint.fromJson,
        cachePolicy: endpoint.cachePolicy,
      );

      return result.when(
        success: (data) {
          // Save to cache
          _cacheManager.put(
            key: key,
            data: jsonEncode(data),
            policy: endpoint.cachePolicy,
          );

          final state = QueryState<TData>.success(data);
          stream.add(state);
          return state;
        },
        failure: (failure) {
          final currentData = (stream.value as QueryState<TData>).data;
          final state = QueryState<TData>.error(
            failure.message,
            previousData: currentData,
          );
          stream.add(state);
          return state;
        },
      );
    } catch (e) {
      final currentData = (stream.value as QueryState<TData>).data;
      final state = QueryState<TData>.error(
        e.toString(),
        previousData: currentData,
      );
      stream.add(state);
      return state;
    }
  }

  /// Internal: Execute custom query
  Future<QueryState<TData>> _executeCustomQuery<TData, TParams>(
    CustomQueryEndpoint<TData, TParams> endpoint, {
    required TParams params,
    bool forceRefresh = false,
  }) async {
    final key = endpoint.buildCacheKey(params);
    final stream = _getOrCreateQueryStream<TData>(key);
    final currentState = stream.value as QueryState<TData>;

    if (_inFlightRequests.containsKey(key)) {
      return _inFlightRequests[key] as Future<QueryState<TData>>;
    }

    if (currentState.hasData) {
      stream.add(QueryState<TData>.fetching(currentState.data as TData));
    } else {
      stream.add(QueryState<TData>.loading());
    }

    // Check cache
    if (!forceRefresh) {
      final cached = await _cacheManager.get(key);
      if (cached != null && !cached.isExpired) {
        try {
          // Note: Custom queries store serialized data differently
          // This is simplified - production code would need proper serialization
          final data = jsonDecode(cached.data) as TData;
          final state = QueryState<TData>.success(data, isFromCache: true);
          stream.add(state);
          return state;
        } catch (_) {
          // Cache parse failed, fetch fresh
        }
      }
    }

    final fetchFuture = _doCustomFetch(endpoint, params, stream, key);
    _inFlightRequests[key] = fetchFuture;

    try {
      return await fetchFuture;
    } finally {
      _inFlightRequests.remove(key);
    }
  }

  Future<QueryState<TData>> _doCustomFetch<TData, TParams>(
    CustomQueryEndpoint<TData, TParams> endpoint,
    TParams params,
    BehaviorSubject<QueryState<dynamic>> stream,
    String key,
  ) async {
    try {
      final data = await endpoint.execute(params, this);

      // Save to cache (simplified - production would need proper serialization)
      _cacheManager.put(
        key: key,
        data: jsonEncode(data),
        policy: endpoint.cachePolicy,
      );

      final state = QueryState<TData>.success(data);
      stream.add(state);
      return state;
    } catch (e) {
      final currentData = (stream.value as QueryState<TData>).data;
      final state = QueryState<TData>.error(
        e.toString(),
        previousData: currentData,
      );
      stream.add(state);
      return state;
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // MUTATION OPERATIONS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Execute mutation
  Future<MutationState<TData>> mutate<TData, TParams, TBody>(
    MutationEndpoint<TData, TParams, TBody> endpoint, {
    TParams? params,
    TBody? body,
  }) async {
    try {
      final path = endpoint.buildPath(params as TParams);
      final transformedBody = body != null ? endpoint.transformBody(body) : null;

      final result = await _executeHttpMethod<TData>(
        method: endpoint.method,
        path: path,
        body: transformedBody,
        fromJson: endpoint.fromJson,
      );

      return result.when(
        success: (data) {
          // Invalidate affected queries
          if (endpoint.invalidatesTags.isNotEmpty) {
            invalidateQueries(endpoint.invalidatesTags);
          }
          return MutationState<TData>.success(data);
        },
        failure: (failure) {
          return MutationState<TData>.error(failure.message);
        },
      );
    } catch (e) {
      return MutationState<TData>.error(e.toString());
    }
  }

  /// Execute custom mutation
  Future<MutationState<TData>> mutateCustom<TData, TParams, TBody>(
    CustomMutationEndpoint<TData, TParams, TBody> endpoint, {
    TParams? params,
    TBody? body,
  }) async {
    try {
      final data = await endpoint.execute(
        params as TParams,
        body as TBody,
        this,
        _deps,
      );

      // Invalidate affected queries
      if (endpoint.invalidatesTags.isNotEmpty) {
        invalidateQueries(endpoint.invalidatesTags);
      }

      endpoint.onSuccess?.call(data);
      return MutationState<TData>.success(data);
    } catch (e) {
      final error = e.toString();
      endpoint.onError?.call(error);
      return MutationState<TData>.error(error);
    }
  }

  /// Internal: Execute HTTP method
  Future<Result<TData>> _executeHttpMethod<TData>({
    required HttpMethod method,
    required String path,
    dynamic body,
    required TData Function(dynamic) fromJson,
  }) {
    switch (method) {
      case HttpMethod.get:
        return _apiClient.get(path: path, fromJson: fromJson);
      case HttpMethod.post:
        return _apiClient.post(path: path, data: body, fromJson: fromJson);
      case HttpMethod.put:
        return _apiClient.put(path: path, data: body, fromJson: fromJson);
      case HttpMethod.patch:
        return _apiClient.put(path: path, data: body, fromJson: fromJson);
      case HttpMethod.delete:
        return _apiClient.delete(path: path, data: body).then(
          (_) => Result.success(fromJson(null)),
        );
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // CACHE INVALIDATION
  // ═══════════════════════════════════════════════════════════════════════════

  /// Invalidate queries by tags
  ///
  /// Semua queries dengan tag yang match akan di-refetch
  Future<void> invalidateQueries(List<String> tags) async {
    // Invalidate cache
    await _cacheManager.invalidateByTags(tags);

    // Find all keys affected by these tags
    final affectedKeys = <String>{};
    for (final entry in _keyToTags.entries) {
      if (entry.value.any((tag) => tags.contains(tag))) {
        affectedKeys.add(entry.key);
      }
    }

    // Mark affected queries as stale and refetch
    for (final key in affectedKeys) {
      final stream = _queryStreams[key];
      if (stream != null && !stream.isClosed) {
        final currentState = stream.value;
        if (currentState.hasData) {
          // Mark as stale
          stream.add(currentState.copyWith(isStale: true));
        }
        // Trigger refetch would happen on next subscription or explicit refetch
      }
    }
  }

  /// Clear all cache and queries
  Future<void> clear() async {
    await _cacheManager.clear();
    for (final stream in _queryStreams.values) {
      if (!stream.isClosed) {
        stream.add(const QueryState());
      }
    }
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // HELPERS
  // ═══════════════════════════════════════════════════════════════════════════

  BehaviorSubject<QueryState<dynamic>> _getOrCreateQueryStream<TData>(String key) {
    if (!_queryStreams.containsKey(key)) {
      _queryStreams[key] = BehaviorSubject<QueryState<dynamic>>.seeded(
        const QueryState<dynamic>(),
      );
    }
    return _queryStreams[key]!;
  }

  void _registerTags(String key, List<String> tags) {
    _keyToTags[key] = {...?_keyToTags[key], ...tags};
  }

  /// Dispose resources
  void dispose() {
    for (final stream in _queryStreams.values) {
      stream.close();
    }
    _queryStreams.clear();
    _inFlightRequests.clear();
    _keyToTags.clear();
  }
}
```

#### 3.2 Query Client Provider (`lib/core/query/client/query_client_provider.dart`)

```dart
import 'package:flutter/widgets.dart';
import 'package:testcase_1/core/query/client/query_client.dart';

/// InheritedWidget untuk provide QueryClient ke widget tree
class QueryClientProvider extends InheritedWidget {
  final QueryClient client;

  const QueryClientProvider({
    super.key,
    required this.client,
    required super.child,
  });

  /// Get QueryClient dari context
  static QueryClient of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<QueryClientProvider>();
    assert(provider != null, 'QueryClientProvider not found in widget tree');
    return provider!.client;
  }

  /// Get QueryClient tanpa dependency (tidak rebuild saat client berubah)
  static QueryClient read(BuildContext context) {
    final provider = context.getInheritedWidgetOfExactType<QueryClientProvider>();
    assert(provider != null, 'QueryClientProvider not found in widget tree');
    return provider!.client;
  }

  @override
  bool updateShouldNotify(QueryClientProvider oldWidget) {
    return client != oldWidget.client;
  }
}
```

---

### Phase 4: Widget Builders

#### 4.1 Query Builder (`lib/core/query/builders/query_builder.dart`)

````dart
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:testcase_1/core/query/client/query_client.dart';
import 'package:testcase_1/core/query/client/query_client_provider.dart';
import 'package:testcase_1/core/query/endpoints/query_endpoint.dart';
import 'package:testcase_1/core/query/endpoints/custom_query_endpoint.dart';
import 'package:testcase_1/core/query/options/query_options.dart';
import 'package:testcase_1/core/query/states/query_state.dart';

/// Widget builder untuk consume query
///
/// Features:
/// - Auto fetch on mount
/// - Provides refetch callback
/// - Optional polling
/// - Handle loading/error/success states
///
/// Example:
/// ```dart
/// QueryBuilder<List<Post>, void>(
///   endpoint: PostApiService.getPosts,
///   builder: (context, state, refetch) {
///     if (state.isLoading) return CircularProgressIndicator();
///     if (state.isError) return Text(state.errorMessage!);
///     return ListView(children: state.data!.map(PostCard.new).toList());
///   },
/// )
/// ```
class QueryBuilder<TData, TParams> extends StatefulWidget {
  /// Query endpoint
  final QueryEndpoint<TData, TParams>? endpoint;

  /// Custom query endpoint (alternative to endpoint)
  final CustomQueryEndpoint<TData, TParams>? customEndpoint;

  /// Parameters untuk query
  final TParams params;

  /// Builder function
  final Widget Function(
    BuildContext context,
    QueryState<TData> state,
    Future<void> Function() refetch,
  ) builder;

  /// Query options (polling, enabled, etc)
  final QueryOptions options;

  /// Callback when query succeeds
  final void Function(TData data)? onSuccess;

  /// Callback when query fails
  final void Function(String error)? onError;

  const QueryBuilder({
    super.key,
    this.endpoint,
    this.customEndpoint,
    required this.params,
    required this.builder,
    this.options = const QueryOptions(),
    this.onSuccess,
    this.onError,
  }) : assert(
         endpoint != null || customEndpoint != null,
         'Either endpoint or customEndpoint must be provided',
       );

  /// Factory constructor untuk simple endpoint (tanpa params)
  factory QueryBuilder.simple({
    Key? key,
    required SimpleQueryEndpoint<TData> endpoint,
    required Widget Function(
      BuildContext context,
      QueryState<TData> state,
      Future<void> Function() refetch,
    ) builder,
    QueryOptions options = const QueryOptions(),
    void Function(TData data)? onSuccess,
    void Function(String error)? onError,
  }) {
    return QueryBuilder<TData, void>(
      key: key,
      endpoint: endpoint,
      params: null as TParams, // void
      builder: builder,
      options: options,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  @override
  State<QueryBuilder<TData, TParams>> createState() => _QueryBuilderState<TData, TParams>();
}

class _QueryBuilderState<TData, TParams> extends State<QueryBuilder<TData, TParams>> {
  late QueryClient _client;
  StreamSubscription<QueryState<TData>>? _subscription;
  Timer? _pollingTimer;
  QueryState<TData> _state = const QueryState();

  @override
  void initState() {
    super.initState();
    _client = QueryClientProvider.read(context);
    _subscribe();
    _setupPolling();
  }

  @override
  void didUpdateWidget(QueryBuilder<TData, TParams> oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Re-subscribe jika params berubah
    if (widget.params != oldWidget.params ||
        widget.endpoint != oldWidget.endpoint ||
        widget.customEndpoint != oldWidget.customEndpoint) {
      _unsubscribe();
      _subscribe();
    }

    // Update polling
    if (widget.options.pollingInterval != oldWidget.options.pollingInterval) {
      _stopPolling();
      _setupPolling();
    }
  }

  @override
  void dispose() {
    _unsubscribe();
    _stopPolling();
    super.dispose();
  }

  void _subscribe() {
    if (!widget.options.enabled) return;

    Stream<QueryState<TData>> stream;

    if (widget.endpoint != null) {
      stream = _client.watchQuery(
        widget.endpoint!,
        params: widget.params,
        fetchOnSubscribe: true,
      );
    } else {
      stream = _client.watchCustomQuery(
        widget.customEndpoint!,
        params: widget.params,
        fetchOnSubscribe: true,
      );
    }

    _subscription = stream.listen((state) {
      if (mounted) {
        setState(() => _state = state);

        // Callbacks
        if (state.isSuccess && state.data != null) {
          widget.onSuccess?.call(state.data as TData);
        }
        if (state.isError && state.errorMessage != null) {
          widget.onError?.call(state.errorMessage!);
        }
      }
    });
  }

  void _unsubscribe() {
    _subscription?.cancel();
    _subscription = null;
  }

  void _setupPolling() {
    final interval = widget.options.pollingInterval;
    if (interval != null && widget.options.enabled) {
      _pollingTimer = Timer.periodic(interval, (_) => _refetch());
    }
  }

  void _stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
  }

  Future<void> _refetch() async {
    if (widget.endpoint != null) {
      await _client.refetch(widget.endpoint!, params: widget.params);
    } else {
      // Custom endpoint refetch
      await _client.fetchCustom(widget.customEndpoint!, params: widget.params);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _state, _refetch);
  }
}
````

#### 4.2 Mutation Builder (`lib/core/query/builders/mutation_builder.dart`)

````dart
import 'package:flutter/widgets.dart';
import 'package:testcase_1/core/query/client/query_client.dart';
import 'package:testcase_1/core/query/client/query_client_provider.dart';
import 'package:testcase_1/core/query/endpoints/mutation_endpoint.dart';
import 'package:testcase_1/core/query/endpoints/custom_mutation_endpoint.dart';
import 'package:testcase_1/core/query/states/mutation_state.dart';

/// Widget builder untuk consume mutation
///
/// Features:
/// - Provides mutate function
/// - Provides reset function
/// - Handle loading/error/success states
/// - Auto invalidates tags on success
///
/// Example:
/// ```dart
/// MutationBuilder<Post, void, CreatePostBody>(
///   endpoint: PostApiService.createPost,
///   onSuccess: (data) => Navigator.pop(context),
///   builder: (context, state, mutate, reset) {
///     return ElevatedButton(
///       onPressed: state.isLoading ? null : () => mutate(body: body),
///       child: state.isLoading ? CircularProgressIndicator() : Text('Create'),
///     );
///   },
/// )
/// ```
class MutationBuilder<TData, TParams, TBody> extends StatefulWidget {
  /// Mutation endpoint
  final MutationEndpoint<TData, TParams, TBody>? endpoint;

  /// Custom mutation endpoint (alternative)
  final CustomMutationEndpoint<TData, TParams, TBody>? customEndpoint;

  /// Builder function
  final Widget Function(
    BuildContext context,
    MutationState<TData> state,
    Future<void> Function({TParams? params, TBody? body}) mutate,
    VoidCallback reset,
  ) builder;

  /// Callback on success
  final void Function(TData data)? onSuccess;

  /// Callback on error
  final void Function(String error)? onError;

  /// Callback on settled (success or error)
  final VoidCallback? onSettled;

  const MutationBuilder({
    super.key,
    this.endpoint,
    this.customEndpoint,
    required this.builder,
    this.onSuccess,
    this.onError,
    this.onSettled,
  }) : assert(
         endpoint != null || customEndpoint != null,
         'Either endpoint or customEndpoint must be provided',
       );

  @override
  State<MutationBuilder<TData, TParams, TBody>> createState() =>
      _MutationBuilderState<TData, TParams, TBody>();
}

class _MutationBuilderState<TData, TParams, TBody>
    extends State<MutationBuilder<TData, TParams, TBody>> {
  late QueryClient _client;
  MutationState<TData> _state = const MutationState();

  @override
  void initState() {
    super.initState();
    _client = QueryClientProvider.read(context);
  }

  Future<void> _mutate({TParams? params, TBody? body}) async {
    if (_state.isLoading) return;

    setState(() => _state = MutationState<TData>.loading());

    MutationState<TData> result;

    if (widget.endpoint != null) {
      result = await _client.mutate(
        widget.endpoint!,
        params: params,
        body: body,
      );
    } else {
      result = await _client.mutateCustom(
        widget.customEndpoint!,
        params: params,
        body: body,
      );
    }

    if (mounted) {
      setState(() => _state = result);

      // Callbacks
      if (result.isSuccess && result.data != null) {
        widget.onSuccess?.call(result.data as TData);
      }
      if (result.isError && result.errorMessage != null) {
        widget.onError?.call(result.errorMessage!);
      }
      widget.onSettled?.call();
    }
  }

  void _reset() {
    setState(() => _state = const MutationState());
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _state, _mutate, _reset);
  }
}
````

#### 4.3 Query Options (`lib/core/query/options/query_options.dart`)

```dart
/// Options untuk QueryBuilder
class QueryOptions {
  /// Polling interval (null = no polling)
  final Duration? pollingInterval;

  /// Enable/disable query (false = tidak auto fetch)
  final bool enabled;

  /// Stale time - setelah ini, data dianggap stale
  final Duration? staleTime;

  /// Retry count on error
  final int retryCount;

  /// Retry delay
  final Duration retryDelay;

  const QueryOptions({
    this.pollingInterval,
    this.enabled = true,
    this.staleTime,
    this.retryCount = 0,
    this.retryDelay = const Duration(seconds: 1),
  });

  /// Preset: No auto fetch
  static const QueryOptions manual = QueryOptions(enabled: false);

  /// Preset: With polling every 30 seconds
  static const QueryOptions polling30s = QueryOptions(
    pollingInterval: Duration(seconds: 30),
  );
}
```

---

### Phase 5: Barrel File & DI Setup

#### 5.1 Barrel File (`lib/core/query/query.dart`)

```dart
// Client
export 'client/query_client.dart';
export 'client/query_client_provider.dart';

// Endpoints
export 'endpoints/base_endpoint.dart';
export 'endpoints/query_endpoint.dart';
export 'endpoints/custom_query_endpoint.dart';
export 'endpoints/mutation_endpoint.dart';
export 'endpoints/custom_mutation_endpoint.dart';

// States
export 'states/query_state.dart';
export 'states/mutation_state.dart';

// Builders
export 'builders/query_builder.dart';
export 'builders/mutation_builder.dart';

// Options
export 'options/query_options.dart';
```

#### 5.2 DI Registration (`lib/app/di/register_module.dart`)

```dart
// Tambahkan di register_module.dart

@module
abstract class RegisterModule {
  // ... existing registrations ...

  @lazySingleton
  QueryClient queryClient(ApiClient apiClient, CacheManager cacheManager) =>
      QueryClient(apiClient: apiClient, cacheManager: cacheManager);
}
```

#### 5.3 Main App Setup

```dart
// main.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return QueryClientProvider(
      client: getIt<QueryClient>(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        // ...
      ),
    );
  }
}
```

---

## Usage Examples

### Example 1: Auth Login (Mutation)

```dart
// lib/features/auth/data/api/auth_api_service.dart

class AuthApiService {
  /// Login mutation
  static final login = MutationEndpoint<AuthResponse, void, LoginBody>(
    path: '/auth/login',
    method: HttpMethod.post,
    fromJson: AuthResponse.fromJson,
    invalidatesTags: ['user'],  // Invalidate user queries after login
  );

  /// Register mutation
  static final register = MutationEndpoint<AuthResponse, void, RegisterBody>(
    path: '/auth/register',
    method: HttpMethod.post,
    fromJson: AuthResponse.fromJson,
    invalidatesTags: ['user'],
  );

  /// Login dengan side effects (save token, notify auth state)
  static final loginWithSideEffects = CustomMutationEndpoint<AuthResponse, void, LoginBody>(
    invalidatesTags: ['user'],
    mutator: (_, body, client, deps) async {
      // Hit login API via simple mutation
      final result = await client.mutate(login, body: body);

      if (result.isSuccess) {
        final response = result.data!;

        // Save tokens
        final tokenStore = deps.get<TokenStore>();
        await tokenStore.saveTokens(
          accessToken: response.accessToken,
          refreshToken: response.refreshToken,
        );

        // Notify auth state
        deps.get<AuthNotifier>().login();

        return response;
      }

      throw Exception(result.errorMessage);
    },
  );
}

// lib/features/auth/domain/models/login_body.dart
class LoginBody {
  final String email;
  final String password;

  const LoginBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}

// lib/features/auth/domain/models/auth_response.dart
class AuthResponse {
  final String accessToken;
  final String refreshToken;
  final User user;

  const AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    accessToken: json['access_token'] as String,
    refreshToken: json['refresh_token'] as String,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
  );
}
```

```dart
// lib/features/auth/presentation/login/page/login_page.dart

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: MutationBuilder<AuthResponse, void, LoginBody>(
        // Pakai mutation dengan side effects
        customEndpoint: AuthApiService.loginWithSideEffects,

        // Success callback - navigate ke home
        onSuccess: (response) {
          context.go(HomePage.routeName);
        },

        // Error callback - show snackbar
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error)),
          );
        },

        builder: (context, state, mutate, reset) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Email field
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (v) => v?.isEmpty == true ? 'Required' : null,
                    enabled: !state.isLoading,
                  ),
                  const SizedBox(height: 16),

                  // Password field
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (v) => v?.isEmpty == true ? 'Required' : null,
                    enabled: !state.isLoading,
                  ),
                  const SizedBox(height: 24),

                  // Error message
                  if (state.isError)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        state.errorMessage!,
                        style: TextStyle(color: Theme.of(context).colorScheme.error),
                      ),
                    ),

                  // Login button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                mutate(
                                  body: LoginBody(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              }
                            },
                      child: state.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
```

### Example 2: Post List (Query)

```dart
// lib/features/home/data/api/post_api_service.dart

class PostApiService {
  /// Get all posts
  static final getPosts = SimpleQueryEndpoint<List<Post>>(
    path: '/posts',
    fromJson: (json) => (json as List).map((e) => Post.fromJson(e)).toList(),
    cachePolicy: CachePolicy(ttlSeconds: 300, tags: ['posts']),
  );

  /// Get single post
  static final getPost = QueryEndpoint<Post, String>(
    pathBuilder: (id) => '/posts/$id',
    fromJson: Post.fromJson,
    cachePolicy: CachePolicy(ttlSeconds: 300, tags: ['posts', 'post-detail']),
  );

  /// Get posts by category
  static final getPostsByCategory = QueryEndpoint<List<Post>, String>(
    path: '/posts',
    queryParams: (category) => {'category': category},
    fromJson: (json) => (json as List).map((e) => Post.fromJson(e)).toList(),
    cachePolicy: CachePolicy(tags: ['posts']),
  );

  /// Create post mutation
  static final createPost = MutationEndpoint<Post, void, CreatePostBody>(
    path: '/posts',
    method: HttpMethod.post,
    fromJson: Post.fromJson,
    invalidatesTags: ['posts'],
  );

  /// Delete post mutation
  static final deletePost = MutationEndpoint<void, String, void>(
    pathBuilder: (id) => '/posts/$id',
    method: HttpMethod.delete,
    fromJson: (_) {},
    invalidatesTags: ['posts'],
  );
}
```

```dart
// lib/features/home/presentation/home/home_page.dart

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push('/posts/create'),
          ),
        ],
      ),
      body: QueryBuilder<List<Post>, void>.simple(
        endpoint: PostApiService.getPosts,

        // Optional: polling setiap 60 detik
        options: QueryOptions(
          pollingInterval: Duration(seconds: 60),
        ),

        builder: (context, state, refetch) {
          // ════════════════════════════════════════
          // Loading state (first load)
          // ════════════════════════════════════════
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // ════════════════════════════════════════
          // Error state (no data)
          // ════════════════════════════════════════
          if (state.isError && !state.hasData) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Error: ${state.errorMessage}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: refetch,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // ════════════════════════════════════════
          // Success state
          // ════════════════════════════════════════
          final posts = state.data ?? [];

          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: refetch,
                child: posts.isEmpty
                    ? const Center(child: Text('No posts yet'))
                    : ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return PostCard(
                            post: post,
                            onTap: () => context.push('/posts/${post.id}'),
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

              // Stale indicator
              if (state.isStale)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Chip(
                    label: const Text('Outdated'),
                    backgroundColor: Colors.orange.shade100,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
```

### Example 3: Post Detail with Delete (Query + Mutation)

```dart
// lib/features/home/presentation/post_detail/page/post_detail_page.dart

class PostDetailPage extends StatelessWidget {
  final String postId;

  const PostDetailPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
        actions: [
          // Delete button with mutation
          _DeleteButton(postId: postId),
        ],
      ),
      body: QueryBuilder<Post, String>(
        endpoint: PostApiService.getPost,
        params: postId,
        builder: (context, state, refetch) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.isError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }

          final post = state.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'By ${post.authorName}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                Text(post.body),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  final String postId;

  const _DeleteButton({required this.postId});

  @override
  Widget build(BuildContext context) {
    return MutationBuilder<void, String, void>(
      endpoint: PostApiService.deletePost,
      onSuccess: (_) {
        // Navigate back setelah delete
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post deleted')),
        );
      },
      onError: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error')),
        );
      },
      builder: (context, state, mutate, reset) {
        return IconButton(
          onPressed: state.isLoading
              ? null
              : () async {
                  // Show confirmation dialog
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Post?'),
                      content: const Text('This action cannot be undone.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );

                  if (confirm == true) {
                    mutate(params: postId);
                  }
                },
          icon: state.isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.delete),
        );
      },
    );
  }
}
```

---

## Migration Guide

### From Bloc/Cubit to Query System

#### Before (Bloc)

```dart
// 4 files untuk satu fitur:
// - posts_bloc.dart
// - posts_event.dart
// - posts_state.dart
// - posts_repository.dart

// posts_bloc.dart
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository _repository;

  PostsBloc(this._repository) : super(PostsInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }

  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    try {
      final posts = await _repository.getPosts();
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostsError(e.toString()));
    }
  }
}

// Di UI:
BlocProvider(
  create: (_) => PostsBloc(getIt<PostsRepository>())..add(FetchPosts()),
  child: BlocBuilder<PostsBloc, PostsState>(
    builder: (context, state) {
      if (state is PostsLoading) return CircularProgressIndicator();
      if (state is PostsError) return Text(state.message);
      if (state is PostsLoaded) return PostList(posts: state.posts);
      return SizedBox();
    },
  ),
)
```

#### After (Query System)

```dart
// 1 file untuk endpoints:
// - post_api_service.dart

// post_api_service.dart
class PostApiService {
  static final getPosts = SimpleQueryEndpoint<List<Post>>(
    path: '/posts',
    fromJson: Post.fromJsonList,
    cachePolicy: CachePolicy(tags: ['posts']),
  );
}

// Di UI - langsung pakai:
QueryBuilder<List<Post>, void>.simple(
  endpoint: PostApiService.getPosts,
  builder: (context, state, refetch) {
    if (state.isLoading) return CircularProgressIndicator();
    if (state.isError) return Text(state.errorMessage!);
    return PostList(posts: state.data!);
  },
)
```

### Migration Checklist

1. [ ] Install dependencies: `rxdart`
2. [ ] Create core/query/ folder structure
3. [ ] Implement states (QueryState, MutationState)
4. [ ] Implement endpoints (QueryEndpoint, MutationEndpoint, etc)
5. [ ] Implement QueryClient
6. [ ] Implement builders (QueryBuilder, MutationBuilder)
7. [ ] Register QueryClient di DI
8. [ ] Wrap app dengan QueryClientProvider
9. [ ] Migrate features satu per satu:
   - [ ] Auth feature (mutations)
   - [ ] Home/Posts feature (queries)
   - [ ] Other features...

---

## Notes untuk Implementation

### Dependencies yang Dibutuhkan

```yaml
# pubspec.yaml
dependencies:
  rxdart: ^0.27.7 # Untuk BehaviorSubject
  freezed_annotation: ^2.4.1

dev_dependencies:
  freezed: ^2.4.5
  build_runner: ^2.4.6
```

### Run Build Runner

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Testing Strategy

1. **Unit tests** untuk QueryClient
2. **Unit tests** untuk endpoint definitions
3. **Widget tests** untuk QueryBuilder dan MutationBuilder
4. **Integration tests** untuk full flow

---

## Summary

Dengan Query System ini:

| Aspect            | Before (Bloc) | After (Query System) |
| ----------------- | ------------- | -------------------- |
| Files per feature | 4+ files      | 1 file (ApiService)  |
| Boilerplate       | High          | Minimal              |
| Caching           | Manual        | Automatic            |
| Refetch           | Manual        | Built-in             |
| Tag invalidation  | Not available | Built-in             |
| Type safety       | Good          | Excellent            |
| Learning curve    | Medium        | Low                  |

**Total estimated implementation: ~500-700 lines of code** untuk core system, kemudian tinggal define endpoints per feature.
