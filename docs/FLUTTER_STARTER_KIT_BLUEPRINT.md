# Flutter Starter Kit Blueprint — Complete Implementation Guide

> **Target**: Starter-kit Flutter modular (feature-based), scalable, performa bagus (StatefulShellRoute), siap tim (linting/logging/testing), i18n per-feature, design system kuat, dan cache by URL ala RTK Query.

---

## Table of Contents

1. [Tech Stack](#1-tech-stack)
2. [Project Structure](#2-project-structure)
3. [Feature Structure](#3-feature-structure)
4. [Naming Rules](#4-naming-rules)
5. [Import Rules & Barrel Exports](#5-import-rules--barrel-exports)
6. [Environment Configuration](#6-environment-configuration)
7. [Dependency Injection](#7-dependency-injection)
8. [Network Layer & Cache](#8-network-layer--cache)
9. [Error Handling & Result Pattern](#9-error-handling--result-pattern)
10. [State Management](#10-state-management)
11. [Routing & Navigation](#11-routing--navigation)
12. [App Shell](#12-app-shell)
13. [Theme & Design System](#13-theme--design-system)
14. [Localization (i18n)](#14-localization-i18n)
15. [Shared Widgets](#15-shared-widgets)
16. [Storage](#16-storage)
17. [Logging](#17-logging)
18. [Testing](#18-testing)
19. [Lint Rules](#19-lint-rules)
20. [Makefile Commands](#20-makefile-commands)
21. [Implementation Phases](#21-implementation-phases)

---

## 1) Tech Stack

> **Last Updated: January 2026** - Versi terbaru dan stabil dari pub.dev

### State + Routing

| Package         | Version | Purpose                                                    |
| --------------- | ------- | ---------------------------------------------------------- |
| `flutter_bloc`  | ^9.1.1  | State management (Cubit default, Bloc untuk flow kompleks) |
| `hydrated_bloc` | ^10.1.1 | Theme & locale persistence                                 |
| `go_router`     | ^17.0.1 | Routing dengan StatefulShellRoute + auth guard             |

### Networking + Cache

| Package         | Version | Purpose                     |
| --------------- | ------- | --------------------------- |
| `dio`           | ^5.9.0  | HTTP client                 |
| `hive`          | ^2.2.3  | Cache storage (persistent)  |
| `hive_flutter`  | ^1.1.0  | Flutter bindings untuk Hive |
| `path_provider` | ^2.1.5  | Path untuk Hive box         |

### Dependency Injection

| Package      | Version | Purpose              |
| ------------ | ------- | -------------------- |
| `get_it`     | ^9.2.0  | Service locator      |
| `injectable` | ^2.7.1  | Auto DI registration |

### Models + Codegen

| Package              | Version | Purpose                        |
| -------------------- | ------- | ------------------------------ |
| `freezed_annotation` | ^3.1.0  | Immutable models + union types |
| `json_annotation`    | ^4.9.0  | JSON serialization annotations |

### Storage

| Package                  | Version | Purpose                 |
| ------------------------ | ------- | ----------------------- |
| `flutter_secure_storage` | ^10.0.0 | Token / session secrets |
| `shared_preferences`     | ^2.5.4  | Settings non-sensitif   |

### Localization

| Package             | Version | Purpose                         |
| ------------------- | ------- | ------------------------------- |
| `easy_localization` | ^3.0.8  | i18n dengan modular JSON loader |

### Logging

| Package  | Version | Purpose                    |
| -------- | ------- | -------------------------- |
| `logger` | ^2.6.2  | Dev logging (direct usage) |

### Utilities

| Package      | Version | Purpose            |
| ------------ | ------- | ------------------ |
| `intl`       | ^0.20.2 | Format date/number |
| `collection` | ^1.19.0 | Collection helpers |
| `equatable`  | ^2.0.8  | Value equality     |

### Dev Dependencies

| Package                | Version | Purpose                     |
| ---------------------- | ------- | --------------------------- |
| `very_good_analysis`   | ^10.0.0 | Lint rules                  |
| `build_runner`         | ^2.10.5 | Code generation             |
| `freezed`              | ^3.2.4  | Freezed generator           |
| `json_serializable`    | ^6.11.4 | JSON generator              |
| `injectable_generator` | ^2.12.0 | Injectable generator        |
| `hive_generator`       | ^2.0.1  | Hive type adapter generator |
| `mocktail`             | ^1.0.4  | Testing mocks               |

---

## 2) Project Structure

```
lib/
├── app/
│   ├── app.dart                    # MaterialApp.router entry
│   ├── bootstrap/
│   │   └── bootstrap.dart          # App initialization
│   ├── di/
│   │   ├── di.dart                 # configureDependencies()
│   │   └── di.config.dart          # Generated
│   ├── router/
│   │   ├── app_router.dart         # AppRouter class wrapper
│   │   └── guards/
│   │       └── auth_guard.dart
│   ├── shell/
│   │   ├── app_shell_page.dart
│   │   ├── app_shell_layout.dart
│   │   ├── app_shell_config.dart
│   │   ├── bloc/
│   │   │   ├── shell_cubit.dart
│   │   │   └── shell_state.dart
│   │   └── widgets/
│   │       └── bottom_nav_widget.dart
│   └── theme/
│       ├── app_theme.dart          # ThemeData light/dark
│       ├── app_colors.dart
│       ├── app_typography.dart
│       └── bloc/
│           ├── theme_cubit.dart    # HydratedCubit
│           └── theme_state.dart
│
├── core/
│   ├── config/
│   │   └── env_config.dart         # Environment variables
│   ├── network/
│   │   ├── index.dart              # Barrel export
│   │   ├── api_client.dart         # Abstract API client
│   │   ├── dio_client.dart         # Dio implementation
│   │   ├── interceptors/
│   │   │   ├── auth_interceptor.dart
│   │   │   ├── cache_interceptor.dart
│   │   │   └── logger_interceptor.dart
│   │   ├── cache/
│   │   │   ├── cache_entry.dart
│   │   │   ├── cache_key_builder.dart
│   │   │   ├── cache_policy.dart
│   │   │   ├── cache_store.dart
│   │   │   ├── cache_manager.dart
│   │   │   ├── tag_index.dart
│   │   │   └── stores/
│   │   │       ├── memory_cache_store.dart
│   │   │       ├── hive_cache_store.dart
│   │   │       └── hybrid_cache_store.dart
│   │   └── error/
│   │       ├── failure.dart
│   │       └── dio_error_mapper.dart
│   ├── result/
│   │   └── result.dart             # Result<T> type
│   ├── state/
│   │   └── async_state.dart        # AsyncState<T> generic
│   ├── storage/
│   │   ├── token_store.dart
│   │   └── preferences_store.dart
│   ├── utils/
│   │   ├── logger.dart
│   │   └── extensions/
│   │       └── string_extensions.dart
│   └── shared/
│       ├── index.dart              # Barrel export
│       ├── widgets/
│       │   ├── app_button.dart
│       │   ├── app_text_field.dart
│       │   ├── app_loading_indicator.dart
│       │   └── app_error_widget.dart
│       └── styles/
│           ├── app_spacing.dart
│           └── app_radius.dart
│
├── features/
│   ├── auth/
│   │   ├── index.dart              # Barrel export
│   │   ├── routes/
│   │   │   └── auth_routes.dart    # List<RouteBase> untuk auth
│   │   ├── presentation/
│   │   │   ├── login/
│   │   │   │   ├── pages/
│   │   │   │   │   └── auth_login_page.dart
│   │   │   │   ├── bloc/
│   │   │   │   │   ├── auth_login_cubit.dart
│   │   │   │   │   └── auth_login_state.dart
│   │   │   │   └── widgets/
│   │   │   │       └── auth_login_form_widget.dart
│   │   │   └── register/
│   │   │       ├── pages/
│   │   │       │   └── auth_register_page.dart
│   │   │       ├── bloc/
│   │   │       │   ├── auth_register_cubit.dart
│   │   │       │   └── auth_register_state.dart
│   │   │       └── widgets/
│   │   │           └── auth_register_form_widget.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart
│   │   │   └── usecases/
│   │   │       ├── login_usecase.dart
│   │   │       └── register_usecase.dart
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── auth_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── user_model.dart
│   │   │   │   ├── login_request_model.dart
│   │   │   │   └── login_response_model.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository_impl.dart
│   │   └── l10n/
│   │       ├── en/
│   │       │   ├── common.json
│   │       │   ├── login.json
│   │       │   └── register.json
│   │       └── id/
│   │           ├── common.json
│   │           ├── login.json
│   │           └── register.json
│   │
│   └── home/
│       ├── index.dart
│       ├── routes/
│       │   └── home_routes.dart    # List<RouteBase> untuk home
│       ├── presentation/
│       │   └── dashboard/
│       │       ├── pages/
│       │       │   └── home_dashboard_page.dart
│       │       ├── bloc/
│       │       │   ├── home_dashboard_cubit.dart
│       │       │   └── home_dashboard_state.dart
│       │       └── widgets/
│       └── l10n/
│           ├── en/
│           │   └── common.json
│           └── id/
│               └── common.json
│
├── main.dart
│
assets/
├── i18n/                           # Generated by merge script
│   ├── en/
│   │   ├── common.json
│   │   ├── auth.json
│   │   └── home.json
│   └── id/
│       ├── common.json
│       ├── auth.json
│       └── home.json
│
tools/
└── merge_i18n.dart                 # i18n merge script
│
.env/
├── dev.json
├── staging.json
└── prod.json
```

---

## 3) Feature Structure

Setiap feature mengikuti struktur ini:

```
features/<feature>/
├── index.dart                      # Barrel export
├── routes/
│   └── <feature>_routes.dart       # List<RouteBase> untuk feature
├── presentation/
│   └── <subfeature>/
│       ├── pages/
│       │   └── <feature>_<subfeature>_page.dart  # static routeName di sini
│       ├── bloc/
│       │   ├── <feature>_<subfeature>_cubit.dart
│       │   └── <feature>_<subfeature>_state.dart
│       └── widgets/
│           └── <feature>_<subfeature>_<name>_widget.dart
├── domain/
│   ├── entities/
│   ├── repositories/               # Abstract interfaces
│   └── usecases/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/               # Implementations
└── l10n/
    ├── en/
    │   └── *.json
    └── id/
        └── *.json
```

---

## 4) Naming Rules

### File Naming

- **Format**: `<feature>_<subfeature...>_<type>.dart`
- **Style**: snake_case (underscore)
- **First word**: feature name
- **Last word**: type

### Types

| Type     | Usage                          |
| -------- | ------------------------------ |
| `page`   | Full screen                    |
| `widget` | Reusable component             |
| `modal`  | Modal dialog                   |
| `sheet`  | Bottom sheet                   |
| `dialog` | Alert/confirm dialog           |
| `cubit`  | State management (simple)      |
| `bloc`   | State management (event-based) |
| `state`  | State class                    |
| `event`  | Event class (Bloc only)        |

### Examples

```
auth_login_page.dart
auth_login_cubit.dart
auth_login_state.dart
auth_login_form_widget.dart
auth_register_page.dart
home_dashboard_page.dart
home_dashboard_cubit.dart
```

---

## 5) Import Rules & Barrel Exports

### Import Convention (LOCKED)

**Selalu gunakan package imports, BUKAN relative imports:**

```dart
// ✅ CORRECT - Package imports
import 'package:testcase_1/core/shared/styles/app_spacing.dart';
import 'package:testcase_1/core/shared/widgets/app_button.dart';
import 'package:testcase_1/features/auth/presentation/login/pages/login_page.dart';

// ❌ WRONG - Relative imports
import '../../../../../core/shared/styles/app_spacing.dart';
import '../../login/pages/login_page.dart';
```

**Alasan:**

- Lebih mudah dibaca dan dipahami
- Tidak perlu menghitung level direktori (`../../../`)
- Konsisten di seluruh codebase
- Mudah untuk refactor/move files

**Import Order:**

```dart
// 1. Dart SDK
import 'dart:async';
import 'dart:convert';

// 2. Flutter SDK
import 'package:flutter/material.dart';

// 3. Package imports (third-party)
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// 4. Project imports (package:testcase_1/...)
import 'package:testcase_1/core/shared/widgets/app_button.dart';
import 'package:testcase_1/features/auth/presentation/login/pages/login_page.dart';
```

### Barrel Exports (index.dart)

```dart
// core/network/index.dart
export 'api_client.dart';
export 'dio_client.dart';
export 'cache/cache_manager.dart';
export 'error/failure.dart';
```

### Boundary Rules

| From            | Can Import         | Cannot Import            |
| --------------- | ------------------ | ------------------------ |
| `presentation/` | `domain/`          | `data/`                  |
| `domain/`       | nothing in feature | `presentation/`, `data/` |
| `data/`         | `domain/entities/` | `presentation/`          |
| `core/`         | nothing            | `features/`              |

---

## 6) Environment Configuration

### File: `.env/dev.json`

```json
{
  "ENV": "dev",
  "BASE_URL": "https://api-dev.example.com",
  "API_KEY": "dev-api-key"
}
```

### File: `.env/staging.json`

```json
{
  "ENV": "staging",
  "BASE_URL": "https://api-staging.example.com",
  "API_KEY": "staging-api-key"
}
```

### File: `.env/prod.json`

```json
{
  "ENV": "prod",
  "BASE_URL": "https://api.example.com",
  "API_KEY": "prod-api-key"
}
```

### File: `lib/core/config/env_config.dart`

```dart
class EnvConfig {
  static const String env = String.fromEnvironment('ENV', defaultValue: 'dev');
  static const String baseUrl = String.fromEnvironment('BASE_URL');
  static const String apiKey = String.fromEnvironment('API_KEY');

  static bool get isDev => env == 'dev';
  static bool get isStaging => env == 'staging';
  static bool get isProd => env == 'prod';
}
```

---

## 7) Dependency Injection

### Setup: `lib/app/di/di.dart`

```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
```

### Registration Pattern

```dart
// Repository interface
@injectable
abstract class AuthRepository {
  Future<Result<User>> login(LoginRequest request);
}

// Implementation
@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Result<User>> login(LoginRequest request) async {
    // implementation
  }
}
```

---

## 8) Network Layer & Cache

### Cache Key Builder

```dart
class CacheKeyBuilder {
  static String build({
    required String method,
    required String path,
    Map<String, dynamic>? queryParams,
  }) {
    final sortedQuery = _sortQuery(queryParams);
    return '$method:$path?$sortedQuery';
  }

  static String _sortQuery(Map<String, dynamic>? params) {
    if (params == null || params.isEmpty) return '';
    final sorted = SplayTreeMap<String, dynamic>.from(params);
    return sorted.entries.map((e) => '${e.key}=${e.value}').join('&');
  }
}
```

### Cache Policy

```dart
@freezed
class CachePolicy with _$CachePolicy {
  const factory CachePolicy({
    @Default(Duration(seconds: 60)) Duration ttl,
    @Default(false) bool swr,              // stale-while-revalidate
    @Default(true) bool showStaleWithIndicator,
    @Default([]) List<String> tags,
  }) = _CachePolicy;
}
```

### Cache Entry

```dart
@freezed
class CacheEntry with _$CacheEntry {
  const factory CacheEntry({
    required String key,
    required String data,
    required DateTime createdAt,
    required Duration ttl,
    required List<String> tags,
  }) = _CacheEntry;

  bool get isExpired => DateTime.now().isAfter(createdAt.add(ttl));
}
```

### Hybrid Cache Store (Memory + Hive)

```dart
class HybridCacheStore implements CacheStore {
  final MemoryCacheStore _memory;
  final HiveCacheStore _hive;
  final TagIndex _tagIndex;

  // READ: memory-first → fallback Hive → promote to memory
  @override
  Future<CacheEntry?> get(String key) async {
    var entry = _memory.get(key);
    if (entry != null) return entry;

    entry = await _hive.get(key);
    if (entry != null && !entry.isExpired) {
      _memory.put(entry); // promote
      return entry;
    }
    return null;
  }

  // WRITE: write-through (memory + Hive)
  @override
  Future<void> put(CacheEntry entry) async {
    _memory.put(entry);
    await _hive.put(entry);
    await _tagIndex.index(entry.key, entry.tags);
  }

  // INVALIDATE: hapus dari memory + Hive + update tag index
  @override
  Future<void> invalidateByTags(List<String> tags) async {
    final keys = await _tagIndex.getKeysByTags(tags);
    for (final key in keys) {
      _memory.remove(key);
      await _hive.remove(key);
    }
    await _tagIndex.removeKeys(keys);
  }
}
```

### Auth Interceptor (with Token Refresh)

```dart
class AuthInterceptor extends QueuedInterceptorsWrapper {
  final TokenStore _tokenStore;
  final Dio _dio;

  bool _isRefreshing = false;
  final _pendingRequests = <_PendingRequest>[];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _tokenStore.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (!_isRefreshing) {
        _isRefreshing = true;
        try {
          await _refreshToken();
          _isRefreshing = false;
          // Retry pending requests
          _retryPendingRequests();
        } catch (e) {
          _isRefreshing = false;
          _rejectPendingRequests(e);
          handler.reject(err);
          return;
        }
      }
      // Queue current request
      _pendingRequests.add(_PendingRequest(err.requestOptions, handler));
      return;
    }
    handler.next(err);
  }

  Future<void> _refreshToken() async {
    final refreshToken = await _tokenStore.getRefreshToken();
    final response = await _dio.post('/auth/refresh', data: {
      'refresh_token': refreshToken,
    });
    await _tokenStore.saveTokens(
      accessToken: response.data['access_token'],
      refreshToken: response.data['refresh_token'],
    );
  }
}
```

---

## 9) Error Handling & Result Pattern

### Failure Types

```dart
@freezed
sealed class Failure with _$Failure {
  const factory Failure.network({String? message}) = NetworkFailure;
  const factory Failure.server({required int code, String? message}) = ServerFailure;
  const factory Failure.unauthorized({String? message}) = UnauthorizedFailure;
  const factory Failure.notFound({String? message}) = NotFoundFailure;
  const factory Failure.validation({required Map<String, List<String>> errors}) = ValidationFailure;
  const factory Failure.unknown({String? message}) = UnknownFailure;
}
```

### Result Type

```dart
@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure(Failure failure) = Fail<T>;
}

extension ResultX<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Fail<T>;

  T? get dataOrNull => switch (this) {
    Success(:final data) => data,
    Fail() => null,
  };

  Failure? get failureOrNull => switch (this) {
    Success() => null,
    Fail(:final failure) => failure,
  };
}
```

### Dio Error Mapper

```dart
class DioErrorMapper {
  static Failure map(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.connectionError =>
        const Failure.network(message: 'Connection error'),

      DioExceptionType.badResponse => _mapStatusCode(exception.response),

      _ => Failure.unknown(message: exception.message),
    };
  }

  static Failure _mapStatusCode(Response? response) {
    final statusCode = response?.statusCode ?? 0;
    final message = response?.data?['message'] as String?;

    return switch (statusCode) {
      401 => Failure.unauthorized(message: message),
      404 => Failure.notFound(message: message),
      422 => Failure.validation(errors: _parseValidationErrors(response)),
      >= 500 => Failure.server(code: statusCode, message: message),
      _ => Failure.unknown(message: message),
    };
  }
}
```

### Flow

```
Dio → DioErrorMapper → Failure → Result<T> → Cubit/Bloc → UI
```

---

## 10) State Management

### AsyncState<T> Generic

```dart
@freezed
sealed class AsyncState<T> with _$AsyncState<T> {
  const factory AsyncState.initial() = AsyncInitial<T>;
  const factory AsyncState.loading() = AsyncLoading<T>;
  const factory AsyncState.success(T data) = AsyncSuccess<T>;
  const factory AsyncState.error(String message) = AsyncError<T>;
}
```

### Screen State Pattern (with pagination)

```dart
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(AsyncState.initial()) AsyncState<List<Item>> items,
    @Default(false) bool isRefreshing,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedEnd,
    @Default(1) int currentPage,
  }) = _HomeState;
}
```

### Form State Pattern

```dart
@freezed
class AuthLoginState with _$AuthLoginState {
  const factory AuthLoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isSubmitting,
    @Default(null) Failure? error,
    @Default(false) bool isSuccess,
  }) = _AuthLoginState;
}
```

### Cubit Pattern

```dart
@injectable
class AuthLoginCubit extends Cubit<AuthLoginState> {
  final LoginUseCase _loginUseCase;

  AuthLoginCubit(this._loginUseCase) : super(const AuthLoginState());

  void emailChanged(String value) => emit(state.copyWith(email: value));
  void passwordChanged(String value) => emit(state.copyWith(password: value));

  Future<void> submit() async {
    emit(state.copyWith(isSubmitting: true, error: null));

    final result = await _loginUseCase(
      LoginRequest(email: state.email, password: state.password),
    );

    result.when(
      success: (_) => emit(state.copyWith(isSubmitting: false, isSuccess: true)),
      failure: (failure) => emit(state.copyWith(
        isSubmitting: false,
        error: failure,
      )),
    );
  }
}
```

---

## 11) Routing & Navigation

### Routing Strategy (LOCKED)

| Decision       | Choice                                                               |
| -------------- | -------------------------------------------------------------------- |
| Route location | `features/<feature>/routes/<feature>_routes.dart`                    |
| Route naming   | `routeName` only (const untuk static, function untuk dynamic params) |
| Shell branches | Feature export `List<RouteBase>`, wrap di central                    |
| Router helper  | Class wrapper `AppRouter` dengan context global + helpers            |

### Page Route Name Convention

**Static route (tanpa params):**

```dart
// features/auth/presentation/login/pages/auth_login_page.dart
class AuthLoginPage extends StatelessWidget {
  static const routeName = '/login';

  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context) => ...;
}

// Navigasi: context.go(AuthLoginPage.routeName)
```

**Dynamic route (dengan params):**

```dart
// features/quiz/presentation/detail/pages/quiz_detail_page.dart
class QuizDetailPage extends StatelessWidget {
  /// Default ':id' untuk route definition, atau pass actual id untuk navigasi
  static String routeName({String id = ':id'}) => '/quiz/detail/$id';

  final String id;
  const QuizDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) => ...;
}

// Route definition: QuizDetailPage.routeName()        → /quiz/detail/:id
// Navigasi:         QuizDetailPage.routeName(id: '123') → /quiz/detail/123
```

**Multiple params:**

```dart
class ChatRoomPage extends StatelessWidget {
  static String routeName({
    String odId = ':roomId',
    String messageId = ':messageId',
  }) => '/chat/$roomId/message/$messageId';

  final String roomId;
  final String messageId;
  const ChatRoomPage({super.key, required this.roomId, required this.messageId});
}

// Route definition: ChatRoomPage.routeName()
// Navigasi:         ChatRoomPage.routeName(roomId: 'abc', messageId: '123')
```

### Feature Routes File

```dart
// features/auth/routes/auth_routes.dart
import 'package:go_router/go_router.dart';
import '../presentation/login/pages/auth_login_page.dart';
import '../presentation/register/pages/auth_register_page.dart';

/// Public routes untuk auth (tanpa shell)
final List<RouteBase> authRoutes = [
  GoRoute(
    path: AuthLoginPage.routeName,
    name: 'login',
    builder: (context, state) => const AuthLoginPage(),
  ),
  GoRoute(
    path: AuthRegisterPage.routeName,
    name: 'register',
    builder: (context, state) => const AuthRegisterPage(),
  ),
];
```

```dart
// features/quiz/routes/quiz_routes.dart
import 'package:go_router/go_router.dart';
import '../presentation/list/pages/quiz_list_page.dart';
import '../presentation/detail/pages/quiz_detail_page.dart';

final List<RouteBase> quizRoutes = [
  GoRoute(
    path: QuizListPage.routeName,
    name: 'quiz-list',
    builder: (context, state) => const QuizListPage(),
  ),
  GoRoute(
    path: QuizDetailPage.routeName(),  // → /quiz/detail/:id
    name: 'quiz-detail',
    builder: (context, state) => QuizDetailPage(
      id: state.pathParameters['id']!,
    ),
  ),
];
```

### AppRouter Class Wrapper

```dart
// app/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/config/env_config.dart';
import '../../features/auth/routes/auth_routes.dart';
import '../../features/home/routes/home_routes.dart';
import '../../features/profile/routes/profile_routes.dart';
import '../shell/app_shell_page.dart';
import 'guards/auth_guard.dart';

class AppRouter {
  AppRouter._();
  static final AppRouter instance = AppRouter._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
  static final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

  late final GoRouter router;

  /// Akses context global dari router
  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  /// Initialize router dengan auth notifier
  void init({required Listenable authNotifier}) {
    router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: HomeDashboardPage.routeName,
      debugLogDiagnostics: EnvConfig.isDev,
      refreshListenable: authNotifier,
      redirect: authGuard,
      errorBuilder: (context, state) => ErrorPage(error: state.error),
      routes: [
        // Public routes (tanpa shell)
        ...authRoutes,

        // Private routes (dengan shell)
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => AppShellPage(
            navigationShell: navigationShell,
          ),
          branches: [
            // Home branch (index 0)
            StatefulShellBranch(
              navigatorKey: _homeNavigatorKey,
              routes: homeRoutes,
            ),
            // Profile branch (index 1)
            StatefulShellBranch(
              navigatorKey: _profileNavigatorKey,
              routes: profileRoutes,
            ),
          ],
        ),
      ],
    );
  }

  /// Helper untuk build MaterialPage
  static Page<void> buildPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
```

### Auth Guard

```dart
// app/router/guards/auth_guard.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../di/di.dart';
import '../../../features/auth/presentation/login/pages/auth_login_page.dart';
import '../../../features/home/presentation/dashboard/pages/home_dashboard_page.dart';

String? authGuard(BuildContext context, GoRouterState state) {
  final isLoggedIn = getIt<AuthNotifier>().isLoggedIn;
  final currentPath = state.matchedLocation;

  // Daftar public routes yang tidak perlu auth
  final publicRoutes = [
    AuthLoginPage.routeName,
    AuthRegisterPage.routeName,
  ];

  final isPublicRoute = publicRoutes.contains(currentPath);

  // Belum login + bukan public route → redirect ke login
  if (!isLoggedIn && !isPublicRoute) {
    return AuthLoginPage.routeName;
  }

  // Sudah login + akses public route → redirect ke home
  if (isLoggedIn && isPublicRoute) {
    return HomeDashboardPage.routeName;
  }

  return null; // Lanjut ke route yang diminta
}
```

### Usage di App

```dart
// app/app.dart
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.instance.router,
      // ... theme, localization, etc.
    );
  }
}

// Navigasi dari mana saja:
// context.go(AuthLoginPage.routeName);
// context.go(HomeDashboardPage.routeName);
// context.push('${HomeDashboardPage.routeName}/detail/123');
```

---

## 12) App Shell

### Shell Page

```dart
class AppShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppShellPage({required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ShellCubit>(),
      child: AppShellLayout(navigationShell: navigationShell),
    );
  }
}
```

### Shell Layout

```dart
class AppShellLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppShellLayout({required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavWidget(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}
```

### Shell Config

```dart
class AppShellConfig {
  static const tabs = [
    ShellTab(
      label: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      index: 0,
    ),
    ShellTab(
      label: 'Profile',
      icon: Icons.person_outlined,
      activeIcon: Icons.person,
      index: 1,
    ),
  ];
}

class ShellTab {
  final String label;
  final IconData icon;
  final IconData activeIcon;
  final int index;

  const ShellTab({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.index,
  });
}
```

---

## 13) Theme & Design System

### Theme Cubit (Hydrated)

```dart
class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  void toggleTheme() {
    emit(state.copyWith(
      themeMode: state.themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light,
    ));
  }

  void setThemeMode(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState(
      themeMode: ThemeMode.values[json['themeMode'] as int? ?? 0],
    );
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'themeMode': state.themeMode.index};
  }
}

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _ThemeState;
}
```

### App Colors

```dart
class AppColors {
  // Brand
  static const primary = Color(0xFF6200EE);
  static const primaryVariant = Color(0xFF3700B3);
  static const secondary = Color(0xFF03DAC6);

  // Semantic
  static const error = Color(0xFFB00020);
  static const success = Color(0xFF4CAF50);
  static const warning = Color(0xFFFFC107);

  // Neutral
  static const background = Color(0xFFF5F5F5);
  static const surface = Color(0xFFFFFFFF);
  static const onPrimary = Color(0xFFFFFFFF);
  static const onSecondary = Color(0xFF000000);
  static const onBackground = Color(0xFF1C1B1F);
  static const onSurface = Color(0xFF1C1B1F);

  // Dark
  static const backgroundDark = Color(0xFF121212);
  static const surfaceDark = Color(0xFF1E1E1E);
  static const onBackgroundDark = Color(0xFFE6E1E5);
  static const onSurfaceDark = Color(0xFFE6E1E5);
}
```

### App Typography

```dart
class AppTypography {
  static const _fontFamily = 'Roboto';

  static const displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
  );

  static const headlineLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w400,
  );

  static const titleLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static const bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static const labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );
}
```

### App Spacing

```dart
class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const xxl = 32.0;
}
```

### App Radius

```dart
class AppRadius {
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;

  static final smBorder = BorderRadius.circular(sm);
  static final mdBorder = BorderRadius.circular(md);
  static final lgBorder = BorderRadius.circular(lg);
  static final xlBorder = BorderRadius.circular(xl);
}
```

### App Theme

```dart
class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
      background: AppColors.background,
      surface: AppColors.surface,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onBackground: AppColors.onBackground,
      onSurface: AppColors.onSurface,
    ),
    textTheme: _textTheme,
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
      background: AppColors.backgroundDark,
      surface: AppColors.surfaceDark,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onBackground: AppColors.onBackgroundDark,
      onSurface: AppColors.onSurfaceDark,
    ),
    textTheme: _textTheme,
  );

  static final _textTheme = TextTheme(
    displayLarge: AppTypography.displayLarge,
    headlineLarge: AppTypography.headlineLarge,
    titleLarge: AppTypography.titleLarge,
    bodyLarge: AppTypography.bodyLarge,
    labelLarge: AppTypography.labelLarge,
  );
}
```

---

## 14) Localization (i18n)

### Strategy: Build-time Bundle per Feature

#### Source Structure (per feature)

```
features/auth/l10n/
├── en/
│   ├── common.json     → {"auth.welcome": "Welcome"}
│   ├── login.json      → {"auth.login.title": "Login"}
│   └── register.json   → {"auth.register.title": "Register"}
└── id/
    ├── common.json
    ├── login.json
    └── register.json
```

#### Output Structure (merged)

```
assets/i18n/
├── en/
│   ├── common.json     → Global common translations
│   ├── auth.json       → Merged from features/auth/l10n/en/*.json
│   └── home.json       → Merged from features/home/l10n/en/*.json
└── id/
    ├── common.json
    ├── auth.json
    └── home.json
```

#### Merge Script: `tools/merge_i18n.dart`

```dart
import 'dart:convert';
import 'dart:io';

void main() async {
  final featuresDir = Directory('lib/features');
  final outputDir = Directory('assets/i18n');
  final locales = ['en', 'id'];

  for (final locale in locales) {
    final localeDir = Directory('${outputDir.path}/$locale');
    if (!localeDir.existsSync()) {
      localeDir.createSync(recursive: true);
    }
  }

  final features = featuresDir.listSync().whereType<Directory>();

  for (final feature in features) {
    final featureName = feature.path.split('/').last;
    final l10nDir = Directory('${feature.path}/l10n');

    if (!l10nDir.existsSync()) continue;

    for (final locale in locales) {
      final localeDir = Directory('${l10nDir.path}/$locale');
      if (!localeDir.existsSync()) continue;

      final merged = <String, dynamic>{};
      final jsonFiles = localeDir.listSync().whereType<File>().where(
            (f) => f.path.endsWith('.json'),
          );

      for (final file in jsonFiles) {
        final content = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;

        // Check for duplicate keys
        for (final key in content.keys) {
          if (merged.containsKey(key)) {
            stderr.writeln('ERROR: Duplicate key "$key" in ${file.path}');
            exit(1);
          }
        }

        merged.addAll(content);
      }

      final outputFile = File('${outputDir.path}/$locale/$featureName.json');
      outputFile.writeAsStringSync(
        const JsonEncoder.withIndent('  ').convert(merged),
      );
      print('Generated: ${outputFile.path}');
    }
  }

  print('i18n merge complete!');
}
```

#### Runtime Loading (easy_localization)

```dart
// In bootstrap.dart
await EasyLocalization.ensureInitialized();

// In app.dart
EasyLocalization(
  supportedLocales: const [Locale('en'), Locale('id')],
  path: 'assets/i18n',
  fallbackLocale: const Locale('en'),
  assetLoader: const FeatureAssetLoader(), // Custom loader
  child: const App(),
)
```

---

## 15) Shared Widgets

### AppButton

```dart
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final AppButtonVariant variant;

  const AppButton({
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.variant = AppButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading || isDisabled ? null : onPressed,
        style: _getStyle(theme),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(label),
      ),
    );
  }

  ButtonStyle _getStyle(ThemeData theme) {
    return switch (variant) {
      AppButtonVariant.primary => ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),
      AppButtonVariant.secondary => ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.secondary,
          foregroundColor: theme.colorScheme.onSecondary,
        ),
      AppButtonVariant.ghost => ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: theme.colorScheme.primary,
          elevation: 0,
        ),
    };
  }
}

enum AppButtonVariant { primary, secondary, ghost }
```

### AppTextField

```dart
class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorText;
  final bool obscureText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  const AppTextField({
    this.label,
    this.hint,
    this.errorText,
    this.obscureText = false,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        errorText: errorText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: AppRadius.smBorder,
        ),
      ),
    );
  }
}
```

### AppLoadingIndicator

```dart
class AppLoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;

  const AppLoadingIndicator({
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: color ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
```

### AppErrorWidget

```dart
class AppErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const AppErrorWidget({
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                label: 'Retry',
                onPressed: onRetry,
                variant: AppButtonVariant.ghost,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
```

---

## 16) Storage

### Token Store

```dart
@injectable
class TokenStore {
  final FlutterSecureStorage _storage;

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  TokenStore(this._storage);

  Future<String?> getAccessToken() => _storage.read(key: _accessTokenKey);
  Future<String?> getRefreshToken() => _storage.read(key: _refreshTokenKey);

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
    ]);
  }
}
```

### Preferences Store

```dart
@injectable
class PreferencesStore {
  final SharedPreferences _prefs;

  PreferencesStore(this._prefs);

  // Example: onboarding completed
  bool get isOnboardingCompleted => _prefs.getBool('onboarding_completed') ?? false;
  Future<void> setOnboardingCompleted(bool value) =>
      _prefs.setBool('onboarding_completed', value);
}
```

---

## 17) Logging

### Direct Usage (dev only)

```dart
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 80,
    colors: true,
    printEmojis: true,
  ),
);

// Usage
logger.d('Debug message');
logger.i('Info message');
logger.w('Warning message');
logger.e('Error message', error: exception, stackTrace: stackTrace);
```

### Logger Interceptor (Dio - dev only)

```dart
class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (EnvConfig.isDev) {
      logger.d('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (EnvConfig.isDev) {
      logger.d('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (EnvConfig.isDev) {
      logger.e('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    }
    handler.next(err);
  }
}
```

---

## 18) Testing

### Mocking: mocktail

```dart
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockRepo;
  late LoginUseCase useCase;

  setUp(() {
    mockRepo = MockAuthRepository();
    useCase = LoginUseCase(mockRepo);
  });

  test('should return user on successful login', () async {
    // Arrange
    when(() => mockRepo.login(any())).thenAnswer(
      (_) async => Result.success(User(id: '1', email: 'test@test.com')),
    );

    // Act
    final result = await useCase(LoginRequest(email: 'test@test.com', password: '123'));

    // Assert
    expect(result.isSuccess, true);
  });
}
```

### Minimum Unit Tests

```dart
// test/core/network/cache_key_builder_test.dart
void main() {
  group('CacheKeyBuilder', () {
    test('should build key with sorted query params', () {
      final key = CacheKeyBuilder.build(
        method: 'GET',
        path: '/users',
        queryParams: {'b': '2', 'a': '1'},
      );
      expect(key, 'GET:/users?a=1&b=2');
    });

    test('should build key without query params', () {
      final key = CacheKeyBuilder.build(method: 'GET', path: '/users');
      expect(key, 'GET:/users?');
    });
  });
}

// test/core/network/dio_error_mapper_test.dart
void main() {
  group('DioErrorMapper', () {
    test('should map 401 to UnauthorizedFailure', () {
      final exception = DioException(
        type: DioExceptionType.badResponse,
        response: Response(
          statusCode: 401,
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(),
      );

      final failure = DioErrorMapper.map(exception);
      expect(failure, isA<UnauthorizedFailure>());
    });

    test('should map timeout to NetworkFailure', () {
      final exception = DioException(
        type: DioExceptionType.connectionTimeout,
        requestOptions: RequestOptions(),
      );

      final failure = DioErrorMapper.map(exception);
      expect(failure, isA<NetworkFailure>());
    });
  });
}
```

---

## 19) Lint Rules

### analysis_options.yaml

```yaml
include: package:very_good_analysis/analysis_options.yaml

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
    - "lib/app/di/di.config.dart"

linter:
  rules:
    # Enforce naming
    file_names: true

    # Prefer immutability
    prefer_final_locals: true
    prefer_const_constructors: true
    prefer_const_declarations: true

    # Import order
    directives_ordering: true

    # Avoid common mistakes
    avoid_print: true
    avoid_dynamic_calls: true

    # No hardcoded colors (use AppColors)
    # Custom rule via dart_code_metrics if needed
```

---

## 20) Makefile Commands

```makefile
.PHONY: help get build clean test lint gen i18n run-dev run-prod

help:
	@echo "Available commands:"
	@echo "  make get        - Get dependencies"
	@echo "  make gen        - Run build_runner"
	@echo "  make i18n       - Merge i18n translations"
	@echo "  make build      - Run gen + i18n"
	@echo "  make clean      - Clean project"
	@echo "  make test       - Run tests"
	@echo "  make lint       - Run analyzer"
	@echo "  make run-dev    - Run app (dev)"
	@echo "  make run-staging- Run app (staging)"
	@echo "  make run-prod   - Run app (prod)"

get:
	flutter pub get

gen:
	dart run build_runner build --delete-conflicting-outputs

i18n:
	dart run tools/merge_i18n.dart

build: gen i18n

clean:
	flutter clean
	dart run build_runner clean

test:
	flutter test

lint:
	flutter analyze

run-dev:
	flutter run --dart-define-from-file=.env/dev.json

run-staging:
	flutter run --dart-define-from-file=.env/staging.json

run-prod:
	flutter run --dart-define-from-file=.env/prod.json
```

---

## 21) Implementation Phases

### Phase 1: Project Foundation

1. Setup pubspec.yaml with all dependencies
2. Create folder structure
3. Setup analysis_options.yaml
4. Setup environment files (.env/\*.json)
5. Setup Makefile

### Phase 2: Core Infrastructure

1. `core/config/env_config.dart`
2. `core/result/result.dart`
3. `core/state/async_state.dart`
4. `core/network/error/failure.dart`
5. `core/network/error/dio_error_mapper.dart`

### Phase 3: Cache System

1. `core/network/cache/cache_entry.dart`
2. `core/network/cache/cache_key_builder.dart`
3. `core/network/cache/cache_policy.dart`
4. `core/network/cache/cache_store.dart`
5. `core/network/cache/tag_index.dart`
6. `core/network/cache/stores/memory_cache_store.dart`
7. `core/network/cache/stores/hive_cache_store.dart`
8. `core/network/cache/stores/hybrid_cache_store.dart`
9. `core/network/cache/cache_manager.dart`

### Phase 4: Network Layer

1. `core/network/dio_client.dart`
2. `core/network/interceptors/auth_interceptor.dart`
3. `core/network/interceptors/cache_interceptor.dart`
4. `core/network/interceptors/logger_interceptor.dart`
5. `core/network/api_client.dart`

### Phase 5: Storage

1. `core/storage/token_store.dart`
2. `core/storage/preferences_store.dart`

### Phase 6: DI Setup

1. `app/di/di.dart`
2. Register all core services

### Phase 7: Theme & Design System

1. `app/theme/app_colors.dart`
2. `app/theme/app_typography.dart`
3. `app/theme/app_theme.dart`
4. `app/theme/bloc/theme_cubit.dart`
5. `core/shared/styles/app_spacing.dart`
6. `core/shared/styles/app_radius.dart`

### Phase 8: Shared Widgets

1. `core/shared/widgets/app_button.dart`
2. `core/shared/widgets/app_text_field.dart`
3. `core/shared/widgets/app_loading_indicator.dart`
4. `core/shared/widgets/app_error_widget.dart`

### Phase 9: Router & Shell

1. `app/router/route_names.dart`
2. `app/router/guards/auth_guard.dart`
3. `app/router/app_router.dart`
4. `app/shell/app_shell_config.dart`
5. `app/shell/widgets/bottom_nav_widget.dart`
6. `app/shell/app_shell_layout.dart`
7. `app/shell/app_shell_page.dart`

### Phase 10: Bootstrap & App Entry

1. `app/bootstrap/bootstrap.dart`
2. `app/app.dart`
3. `main.dart`

### Phase 11: Auth Feature

1. Domain layer (entities, repository interface, usecases)
2. Data layer (models, datasource, repository impl)
3. Presentation layer (login page, register page, cubits)
4. i18n files

### Phase 12: Home Feature

1. Domain layer
2. Data layer
3. Presentation layer (dashboard page, cubit)
4. i18n files

### Phase 13: i18n Setup

1. Create `tools/merge_i18n.dart`
2. Run merge script
3. Configure easy_localization

### Phase 14: Testing

1. Unit tests for CacheKeyBuilder
2. Unit tests for DioErrorMapper
3. (Optional) Widget tests

### Phase 15: Final Polish

1. Verify all barrel exports
2. Run lint and fix issues
3. Test full flow (login → home)
4. Document any remaining TODOs

---

## App Flow Summary

```
main.dart
    ↓
bootstrap.dart (init Hive, DI, Localization)
    ↓
app.dart (MaterialApp.router)
    ↓
┌─────────────────────────────────────────┐
│              GoRouter                   │
├─────────────────────────────────────────┤
│  /login  → AuthLoginPage               │
│  /register → AuthRegisterPage          │
├─────────────────────────────────────────┤
│  StatefulShellRoute (AppShellPage)     │
│  ├── Branch 0: / → HomeDashboardPage   │
│  └── Branch 1: /profile → ProfilePage  │
└─────────────────────────────────────────┘
```

### Login Flow

```
User opens app
    ↓
AuthGuard checks isLoggedIn
    ↓
Not logged in → Redirect to /login
    ↓
User enters credentials
    ↓
AuthLoginCubit.submit()
    ↓
LoginUseCase → AuthRepository → API
    ↓
Success → TokenStore.saveTokens()
    ↓
AuthNotifier.notifyListeners()
    ↓
GoRouter.refresh() → AuthGuard
    ↓
Logged in → Redirect to /
    ↓
AppShellPage (with BottomNav)
    ↓
HomeDashboardPage
```

---

## Summary of All Locked Decisions

| Category          | Decision                                                |
| ----------------- | ------------------------------------------------------- |
| State Management  | flutter_bloc (Cubit default)                            |
| Routing           | go_router + StatefulShellRoute                          |
| Cache             | Hybrid (Memory + Hive), write-through, tag invalidation |
| Error Handling    | Result<T> pattern, Failure sealed class                 |
| DI                | get_it + injectable                                     |
| Theme Persistence | HydratedBloc                                            |
| Error State       | String message (simple)                                 |
| SWR Behavior      | Show stale + loading indicator (configurable)           |
| Hive Strategy     | Hybrid (1 main box + tag index box)                     |
| Token Refresh     | Full implementation (queue pending requests)            |
| Shared Widgets    | Basic (Button, TextField, Loading, Error)               |
| Logger            | Direct usage (Logger())                                 |
| i18n Script       | Dart script via Makefile                                |
| Initial Features  | Auth (Login/Register) + Home                            |

---

_Document Version: 1.0_
_Last Updated: 2025_
