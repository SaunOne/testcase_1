# Flutter Starter Kit — Implementation Prompt

> Prompt ini digunakan untuk memandu AI/Engineer dalam mengimplementasikan Flutter Starter Kit secara bertahap dan konsisten.

---

## Context

Anda adalah Senior Mobile Flutter Engineer yang akan mengimplementasikan Flutter Starter Kit dengan spesifikasi yang sudah di-lock. Ikuti semua keputusan arsitektur yang sudah ditentukan tanpa melakukan improvisasi atau perubahan tanpa persetujuan.

---

## Master Reference

Selalu rujuk ke dokumen `docs/woee_BLUEPRINT.md` untuk:

- Tech stack yang digunakan
- Project structure
- Naming conventions
- Implementation patterns

---

## Locked Decisions Summary

| Category          | Decision                                                             |
| ----------------- | -------------------------------------------------------------------- |
| State Management  | flutter_bloc (Cubit default, Bloc untuk flow kompleks)               |
| Routing           | go_router + StatefulShellRoute.indexedStack                          |
| Route Location    | `features/<feature>/routes/<feature>_routes.dart`                    |
| Route Naming      | `routeName` only (const untuk static, function untuk dynamic params) |
| Shell Branches    | Feature export `List<RouteBase>`, wrap di central                    |
| Router Helper     | Class wrapper `AppRouter` dengan context global                      |
| **Import Style**  | **Package imports (`package:testcase_1/...`), BUKAN relative**       |
| Cache             | Hybrid (Memory + Hive), write-through, tag invalidation              |
| Error Handling    | Result<T> pattern, Failure sealed class                              |
| DI                | get_it + injectable                                                  |
| Theme Persistence | HydratedBloc                                                         |
| Error State       | String message (simple)                                              |
| SWR Behavior      | Show stale + loading indicator (configurable)                        |
| Hive Strategy     | Hybrid (1 main box + tag index box)                                  |
| Token Refresh     | Full implementation (queue pending requests)                         |
| Shared Widgets    | Basic (Button, TextField, Loading, Error)                            |
| Logger            | Direct usage (Logger())                                              |
| i18n Script       | Dart script via Makefile                                             |
| Initial Features  | Auth (Login/Register) + Home                                         |

---

## Dependencies (pubspec.yaml)

> **Last Updated: January 2026** - Versi terbaru dan stabil dari pub.dev

```yaml
dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_bloc: ^9.1.1
  hydrated_bloc: ^10.1.1

  # Routing
  go_router: ^17.0.1

  # Networking
  dio: ^5.9.0

  # Cache Storage
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  path_provider: ^2.1.5

  # DI
  get_it: ^9.2.0
  injectable: ^2.7.1

  # Models
  freezed_annotation: ^3.1.0
  json_annotation: ^4.9.0

  # Storage
  flutter_secure_storage: ^10.0.0
  shared_preferences: ^2.5.4

  # Localization
  easy_localization: ^3.0.8

  # Utilities
  logger: ^2.6.2
  intl: ^0.20.2
  collection: ^1.19.0
  equatable: ^2.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter

  # Lint
  very_good_analysis: ^10.0.0

  # Code Generation
  build_runner: ^2.10.5
  freezed: ^3.2.4
  json_serializable: ^6.11.4
  injectable_generator: ^2.12.0
  hive_generator: ^2.0.1

  # Testing
  mocktail: ^1.0.4
```

---

## Prompt Template per Phase

---

### Phase 1: Project Foundation

```
Implementasikan Phase 1: Project Foundation untuk Flutter Starter Kit.

Tasks:
1. Update pubspec.yaml dengan dependencies yang sudah ditentukan (lihat daftar di atas)

2. Buat folder structure:
   lib/
   ├── app/
   │   ├── bootstrap/
   │   ├── di/
   │   ├── router/
   │   │   └── guards/
   │   ├── shell/
   │   │   ├── bloc/
   │   │   └── widgets/
   │   └── theme/
   │       └── bloc/
   ├── core/
   │   ├── config/
   │   ├── network/
   │   │   ├── cache/
   │   │   │   └── stores/
   │   │   ├── error/
   │   │   └── interceptors/
   │   ├── result/
   │   ├── state/
   │   ├── storage/
   │   ├── utils/
   │   │   └── extensions/
   │   └── shared/
   │       ├── widgets/
   │       └── styles/
   └── features/
       ├── auth/
       │   ├── routes/              # Feature routes
       │   ├── data/
       │   │   ├── datasources/
       │   │   ├── models/
       │   │   └── repositories/
       │   ├── domain/
       │   │   ├── entities/
       │   │   ├── repositories/
       │   │   └── usecases/
       │   ├── presentation/
       │   │   ├── login/
       │   │   │   ├── bloc/
       │   │   │   ├── pages/
       │   │   │   └── widgets/
       │   │   └── register/
       │   │       ├── bloc/
       │   │       ├── pages/
       │   │       └── widgets/
       │   └── l10n/
       │       ├── en/
       │       └── id/
       └── home/
           ├── routes/              # Feature routes
           ├── presentation/
           │   └── dashboard/
           │       ├── bloc/
           │       ├── pages/
           │       └── widgets/
           └── l10n/
               ├── en/
               └── id/

   assets/
   └── i18n/
       ├── en/
       └── id/

   tools/

   .env/
   ├── dev.json
   ├── staging.json
   └── prod.json

3. Setup analysis_options.yaml:
   include: package:very_good_analysis/analysis_options.yaml

   analyzer:
     exclude:
       - "**/*.g.dart"
       - "**/*.freezed.dart"
       - "lib/app/di/di.config.dart"

4. Setup environment files (.env/*.json):
   dev.json:
   {
     "ENV": "dev",
     "BASE_URL": "https://api-dev.example.com",
     "API_KEY": "dev-api-key"
   }

   staging.json & prod.json dengan nilai yang sesuai

5. Setup Makefile (lihat section Makefile di bawah)

Rules:
- Gunakan snake_case untuk semua file names
- Buat .gitkeep di folder kosong
- Pastikan pubspec.yaml valid (run flutter pub get)
```

---

### Phase 2: Core Infrastructure

```
Implementasikan Phase 2: Core Infrastructure.

Files to create:

1. lib/core/config/env_config.dart
---
class EnvConfig {
  static const String env = String.fromEnvironment('ENV', defaultValue: 'dev');
  static const String baseUrl = String.fromEnvironment('BASE_URL');
  static const String apiKey = String.fromEnvironment('API_KEY');

  static bool get isDev => env == 'dev';
  static bool get isStaging => env == 'staging';
  static bool get isProd => env == 'prod';
}
---

2. lib/core/result/result.dart
---
import 'package:freezed_annotation/freezed_annotation.dart';
import '../network/error/failure.dart';

part 'result.freezed.dart';

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

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) failure,
  }) {
    return switch (this) {
      Success(:final data) => success(data),
      Fail(:final failure) => failure(failure),
    };
  }
}
---

3. lib/core/state/async_state.dart
---
import 'package:freezed_annotation/freezed_annotation.dart';

part 'async_state.freezed.dart';

@freezed
sealed class AsyncState<T> with _$AsyncState<T> {
  const factory AsyncState.initial() = AsyncInitial<T>;
  const factory AsyncState.loading() = AsyncLoading<T>;
  const factory AsyncState.success(T data) = AsyncSuccess<T>;
  const factory AsyncState.error(String message) = AsyncError<T>;
}

extension AsyncStateX<T> on AsyncState<T> {
  bool get isInitial => this is AsyncInitial<T>;
  bool get isLoading => this is AsyncLoading<T>;
  bool get isSuccess => this is AsyncSuccess<T>;
  bool get isError => this is AsyncError<T>;

  T? get dataOrNull => switch (this) {
    AsyncSuccess(:final data) => data,
    _ => null,
  };

  String? get errorOrNull => switch (this) {
    AsyncError(:final message) => message,
    _ => null,
  };
}
---

4. lib/core/network/error/failure.dart
---
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network({String? message}) = NetworkFailure;
  const factory Failure.server({required int code, String? message}) = ServerFailure;
  const factory Failure.unauthorized({String? message}) = UnauthorizedFailure;
  const factory Failure.notFound({String? message}) = NotFoundFailure;
  const factory Failure.validation({required Map<String, List<String>> errors}) = ValidationFailure;
  const factory Failure.unknown({String? message}) = UnknownFailure;
}

extension FailureX on Failure {
  String get displayMessage => switch (this) {
    NetworkFailure(:final message) => message ?? 'Network error occurred',
    ServerFailure(:final message) => message ?? 'Server error occurred',
    UnauthorizedFailure(:final message) => message ?? 'Unauthorized access',
    NotFoundFailure(:final message) => message ?? 'Resource not found',
    ValidationFailure(:final errors) => errors.values.expand((e) => e).join(', '),
    UnknownFailure(:final message) => message ?? 'Unknown error occurred',
  };
}
---

5. lib/core/network/error/dio_error_mapper.dart
---
import 'package:dio/dio.dart';
import 'failure.dart';

class DioErrorMapper {
  static Failure map(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.connectionError =>
        const Failure.network(message: 'Connection error. Please check your internet.'),

      DioExceptionType.badResponse => _mapStatusCode(exception.response),

      DioExceptionType.cancel =>
        const Failure.network(message: 'Request was cancelled'),

      _ => Failure.unknown(message: exception.message),
    };
  }

  static Failure _mapStatusCode(Response? response) {
    final statusCode = response?.statusCode ?? 0;
    final data = response?.data;
    final message = data is Map ? data['message'] as String? : null;

    return switch (statusCode) {
      400 => Failure.server(code: statusCode, message: message ?? 'Bad request'),
      401 => Failure.unauthorized(message: message),
      403 => Failure.unauthorized(message: message ?? 'Access forbidden'),
      404 => Failure.notFound(message: message),
      422 => Failure.validation(errors: _parseValidationErrors(response)),
      >= 500 => Failure.server(code: statusCode, message: message ?? 'Server error'),
      _ => Failure.unknown(message: message),
    };
  }

  static Map<String, List<String>> _parseValidationErrors(Response? response) {
    final data = response?.data;
    if (data is Map && data['errors'] is Map) {
      final errors = data['errors'] as Map;
      return errors.map((key, value) {
        final messages = value is List
            ? value.map((e) => e.toString()).toList()
            : [value.toString()];
        return MapEntry(key.toString(), messages);
      });
    }
    return {};
  }
}
---

After creating files:
- Run: make gen
- Verify .freezed.dart files are generated
```

---

### Phase 3: Cache System

```
Implementasikan Phase 3: Cache System (RTK Query Style).

Files to create:

1. lib/core/network/cache/cache_entry.dart
---
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_entry.freezed.dart';
part 'cache_entry.g.dart';

@freezed
class CacheEntry with _$CacheEntry {
  const CacheEntry._();

  const factory CacheEntry({
    required String key,
    required String data,
    required DateTime createdAt,
    required int ttlSeconds,
    @Default([]) List<String> tags,
  }) = _CacheEntry;

  factory CacheEntry.fromJson(Map<String, dynamic> json) => _$CacheEntryFromJson(json);

  bool get isExpired => DateTime.now().isAfter(expiresAt);
  DateTime get expiresAt => createdAt.add(Duration(seconds: ttlSeconds));
}
---

2. lib/core/network/cache/cache_key_builder.dart
---
import 'dart:collection';

class CacheKeyBuilder {
  static String build({
    required String method,
    required String path,
    Map<String, dynamic>? queryParams,
  }) {
    final sortedQuery = _sortAndEncodeQuery(queryParams);
    return '$method:$path${sortedQuery.isNotEmpty ? '?$sortedQuery' : ''}';
  }

  static String _sortAndEncodeQuery(Map<String, dynamic>? params) {
    if (params == null || params.isEmpty) return '';

    final sorted = SplayTreeMap<String, dynamic>.from(params);
    return sorted.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}')
        .join('&');
  }
}
---

3. lib/core/network/cache/cache_policy.dart
---
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_policy.freezed.dart';

@freezed
class CachePolicy with _$CachePolicy {
  const factory CachePolicy({
    @Default(60) int ttlSeconds,
    @Default(false) bool swr, // stale-while-revalidate
    @Default(true) bool showStaleWithIndicator,
    @Default([]) List<String> tags,
  }) = _CachePolicy;

  static const CachePolicy noCache = CachePolicy(ttlSeconds: 0);
  static const CachePolicy standard = CachePolicy();
  static const CachePolicy swrEnabled = CachePolicy(swr: true);
}
---

4. lib/core/network/cache/cache_store.dart
---
import 'cache_entry.dart';

abstract class CacheStore {
  Future<CacheEntry?> get(String key);
  Future<void> put(CacheEntry entry);
  Future<void> remove(String key);
  Future<void> clear();
}
---

5. lib/core/network/cache/tag_index.dart
---
import 'package:hive/hive.dart';

class TagIndex {
  static const String _boxName = 'cache_tag_index';
  late Box<List<String>> _box;

  Future<void> init() async {
    _box = await Hive.openBox<List<String>>(_boxName);
  }

  Future<void> index(String key, List<String> tags) async {
    for (final tag in tags) {
      final keys = _box.get(tag) ?? [];
      if (!keys.contains(key)) {
        keys.add(key);
        await _box.put(tag, keys);
      }
    }
  }

  Future<Set<String>> getKeysByTags(List<String> tags) async {
    final keys = <String>{};
    for (final tag in tags) {
      final tagKeys = _box.get(tag) ?? [];
      keys.addAll(tagKeys);
    }
    return keys;
  }

  Future<void> removeKey(String key) async {
    for (final tag in _box.keys) {
      final keys = _box.get(tag) ?? [];
      if (keys.contains(key)) {
        keys.remove(key);
        await _box.put(tag as String, keys);
      }
    }
  }

  Future<void> removeKeys(Set<String> keysToRemove) async {
    for (final key in keysToRemove) {
      await removeKey(key);
    }
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
---

6. lib/core/network/cache/stores/memory_cache_store.dart
---
import '../cache_entry.dart';
import '../cache_store.dart';

class MemoryCacheStore implements CacheStore {
  final Map<String, CacheEntry> _cache = {};

  @override
  Future<CacheEntry?> get(String key) async {
    final entry = _cache[key];
    if (entry != null && entry.isExpired) {
      _cache.remove(key);
      return null;
    }
    return entry;
  }

  @override
  Future<void> put(CacheEntry entry) async {
    _cache[key] = entry;
  }

  @override
  Future<void> remove(String key) async {
    _cache.remove(key);
  }

  @override
  Future<void> clear() async {
    _cache.clear();
  }

  // Additional helper
  CacheEntry? getSync(String key) {
    final entry = _cache[key];
    if (entry != null && entry.isExpired) {
      _cache.remove(key);
      return null;
    }
    return entry;
  }
}
---

7. lib/core/network/cache/stores/hive_cache_store.dart
---
import 'dart:convert';
import 'package:hive/hive.dart';
import '../cache_entry.dart';
import '../cache_store.dart';

class HiveCacheStore implements CacheStore {
  static const String _boxName = 'cache_entries';
  late Box<String> _box;

  Future<void> init() async {
    _box = await Hive.openBox<String>(_boxName);
  }

  @override
  Future<CacheEntry?> get(String key) async {
    final json = _box.get(key);
    if (json == null) return null;

    try {
      final entry = CacheEntry.fromJson(jsonDecode(json) as Map<String, dynamic>);
      if (entry.isExpired) {
        await remove(key);
        return null;
      }
      return entry;
    } catch (e) {
      await remove(key);
      return null;
    }
  }

  @override
  Future<void> put(CacheEntry entry) async {
    await _box.put(entry.key, jsonEncode(entry.toJson()));
  }

  @override
  Future<void> remove(String key) async {
    await _box.delete(key);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }
}
---

8. lib/core/network/cache/stores/hybrid_cache_store.dart
---
import '../cache_entry.dart';
import '../cache_store.dart';
import '../tag_index.dart';
import 'memory_cache_store.dart';
import 'hive_cache_store.dart';

class HybridCacheStore implements CacheStore {
  final MemoryCacheStore _memory;
  final HiveCacheStore _hive;
  final TagIndex _tagIndex;

  HybridCacheStore({
    required MemoryCacheStore memory,
    required HiveCacheStore hive,
    required TagIndex tagIndex,
  })  : _memory = memory,
        _hive = hive,
        _tagIndex = tagIndex;

  // READ: memory-first → fallback Hive → promote to memory
  @override
  Future<CacheEntry?> get(String key) async {
    // Try memory first
    var entry = await _memory.get(key);
    if (entry != null) return entry;

    // Fallback to Hive
    entry = await _hive.get(key);
    if (entry != null) {
      // Promote to memory
      await _memory.put(entry);
      return entry;
    }

    return null;
  }

  // WRITE: write-through (memory + Hive)
  @override
  Future<void> put(CacheEntry entry) async {
    await _memory.put(entry);
    await _hive.put(entry);
    await _tagIndex.index(entry.key, entry.tags);
  }

  @override
  Future<void> remove(String key) async {
    await _memory.remove(key);
    await _hive.remove(key);
    await _tagIndex.removeKey(key);
  }

  @override
  Future<void> clear() async {
    await _memory.clear();
    await _hive.clear();
    await _tagIndex.clear();
  }

  // Tag-based invalidation
  Future<void> invalidateByTags(List<String> tags) async {
    final keys = await _tagIndex.getKeysByTags(tags);
    for (final key in keys) {
      await _memory.remove(key);
      await _hive.remove(key);
    }
    await _tagIndex.removeKeys(keys);
  }

  // Get stale entry (even if expired) for SWR
  Future<CacheEntry?> getStale(String key) async {
    // Memory doesn't keep expired, check Hive raw
    final entry = _memory.getSync(key);
    if (entry != null) return entry;

    // For Hive, we need raw access
    return _hive.get(key);
  }
}
---

9. lib/core/network/cache/cache_manager.dart
---
import 'dart:async';
import 'cache_entry.dart';
import 'cache_policy.dart';
import 'cache_key_builder.dart';
import 'stores/hybrid_cache_store.dart';

class CacheManager {
  final HybridCacheStore _store;

  // In-flight request deduplication
  final Map<String, Completer<String?>> _inFlight = {};

  CacheManager({required HybridCacheStore store}) : _store = store;

  Future<CacheEntry?> get(String key) => _store.get(key);

  Future<void> put({
    required String key,
    required String data,
    required CachePolicy policy,
  }) async {
    final entry = CacheEntry(
      key: key,
      data: data,
      createdAt: DateTime.now(),
      ttlSeconds: policy.ttlSeconds,
      tags: policy.tags,
    );
    await _store.put(entry);
  }

  Future<void> invalidate(String key) => _store.remove(key);

  Future<void> invalidateByTags(List<String> tags) => _store.invalidateByTags(tags);

  Future<void> clear() => _store.clear();

  // In-flight deduplication for network requests
  Future<String?> getOrFetch(
    String key,
    Future<String> Function() fetcher,
  ) async {
    // Check if request is already in-flight
    if (_inFlight.containsKey(key)) {
      return _inFlight[key]!.future;
    }

    // Start new request
    final completer = Completer<String?>();
    _inFlight[key] = completer;

    try {
      final data = await fetcher();
      completer.complete(data);
      return data;
    } catch (e) {
      completer.completeError(e);
      rethrow;
    } finally {
      _inFlight.remove(key);
    }
  }

  String buildKey({
    required String method,
    required String path,
    Map<String, dynamic>? queryParams,
  }) {
    return CacheKeyBuilder.build(
      method: method,
      path: path,
      queryParams: queryParams,
    );
  }
}
---

After creating files:
- Run: make gen
```

---

### Phase 4: Network Layer

```
Implementasikan Phase 4: Network Layer.

Files to create:

1. lib/core/network/interceptors/logger_interceptor.dart
---
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../config/env_config.dart';

class LoggerInterceptor extends Interceptor {
  final _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, printEmojis: false),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (EnvConfig.isDev) {
      _logger.d('REQUEST[${options.method}] => ${options.path}');
      if (options.queryParameters.isNotEmpty) {
        _logger.d('Query: ${options.queryParameters}');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (EnvConfig.isDev) {
      _logger.d('RESPONSE[${response.statusCode}] => ${response.requestOptions.path}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (EnvConfig.isDev) {
      _logger.e('ERROR[${err.response?.statusCode}] => ${err.requestOptions.path}');
      _logger.e('Message: ${err.message}');
    }
    handler.next(err);
  }
}
---

2. lib/core/network/interceptors/auth_interceptor.dart
---
import 'dart:async';
import 'package:dio/dio.dart';
import '../../storage/token_store.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  final TokenStore _tokenStore;
  final Dio _dio;
  final void Function()? onTokenExpired;

  AuthInterceptor({
    required TokenStore tokenStore,
    required Dio dio,
    this.onTokenExpired,
  })  : _tokenStore = tokenStore,
        _dio = dio;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStore.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Try to refresh token
      final refreshed = await _refreshToken();
      if (refreshed) {
        // Retry the original request
        try {
          final response = await _retryRequest(err.requestOptions);
          handler.resolve(response);
          return;
        } catch (e) {
          handler.reject(err);
          return;
        }
      } else {
        // Token refresh failed, logout
        await _tokenStore.clearTokens();
        onTokenExpired?.call();
      }
    }
    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _tokenStore.getRefreshToken();
      if (refreshToken == null) return false;

      final response = await _dio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
        options: Options(
          headers: {'Authorization': null}, // Remove auth header for refresh
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        await _tokenStore.saveTokens(
          accessToken: data['access_token'] as String,
          refreshToken: data['refresh_token'] as String,
        );
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<Response> _retryRequest(RequestOptions options) async {
    final token = await _tokenStore.getAccessToken();
    options.headers['Authorization'] = 'Bearer $token';
    return _dio.fetch(options);
  }
}
---

3. lib/core/network/interceptors/cache_interceptor.dart
---
import 'dart:convert';
import 'package:dio/dio.dart';
import '../cache/cache_manager.dart';
import '../cache/cache_policy.dart';
import '../cache/cache_entry.dart';

class CacheInterceptor extends Interceptor {
  final CacheManager _cacheManager;

  CacheInterceptor({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Only cache GET requests
    if (options.method != 'GET') {
      handler.next(options);
      return;
    }

    final policy = options.extra['cachePolicy'] as CachePolicy?;
    if (policy == null || policy.ttlSeconds == 0) {
      handler.next(options);
      return;
    }

    final key = _cacheManager.buildKey(
      method: options.method,
      path: options.path,
      queryParams: options.queryParameters,
    );

    final entry = await _cacheManager.get(key);

    if (entry != null && !entry.isExpired) {
      // Return cached response
      handler.resolve(
        Response(
          requestOptions: options,
          data: jsonDecode(entry.data),
          statusCode: 200,
          extra: {'fromCache': true},
        ),
      );
      return;
    }

    // SWR: return stale and continue
    if (policy.swr && entry != null) {
      options.extra['staleEntry'] = entry;
      options.extra['cacheKey'] = key;
    } else {
      options.extra['cacheKey'] = key;
    }

    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    // Only cache GET 200 responses
    if (response.requestOptions.method != 'GET' ||
        response.statusCode != 200) {
      handler.next(response);
      return;
    }

    final policy = response.requestOptions.extra['cachePolicy'] as CachePolicy?;
    final key = response.requestOptions.extra['cacheKey'] as String?;

    if (policy != null && key != null && policy.ttlSeconds > 0) {
      await _cacheManager.put(
        key: key,
        data: jsonEncode(response.data),
        policy: policy,
      );
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // On error, try to return stale cache
    final policy = err.requestOptions.extra['cachePolicy'] as CachePolicy?;
    final key = err.requestOptions.extra['cacheKey'] as String?;

    if (policy != null && key != null) {
      final entry = await _cacheManager.get(key);
      if (entry != null) {
        handler.resolve(
          Response(
            requestOptions: err.requestOptions,
            data: jsonDecode(entry.data),
            statusCode: 200,
            extra: {'fromCache': true, 'isStale': true},
          ),
        );
        return;
      }
    }

    handler.next(err);
  }
}
---

4. lib/core/network/dio_client.dart
---
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../config/env_config.dart';
import '../storage/token_store.dart';
import 'cache/cache_manager.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/cache_interceptor.dart';
import 'interceptors/logger_interceptor.dart';

@lazySingleton
class DioClient {
  late final Dio _dio;
  final TokenStore _tokenStore;
  final CacheManager _cacheManager;
  void Function()? onTokenExpired;

  DioClient({
    required TokenStore tokenStore,
    required CacheManager cacheManager,
  })  : _tokenStore = tokenStore,
        _cacheManager = cacheManager {
    _dio = Dio(
      BaseOptions(
        baseUrl: EnvConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (EnvConfig.apiKey.isNotEmpty) 'X-API-Key': EnvConfig.apiKey,
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.addAll([
      AuthInterceptor(
        tokenStore: _tokenStore,
        dio: _dio,
        onTokenExpired: () => onTokenExpired?.call(),
      ),
      CacheInterceptor(cacheManager: _cacheManager),
      LoggerInterceptor(),
    ]);
  }

  Dio get dio => _dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CachePolicy? cachePolicy,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(
        extra: {
          ...?options?.extra,
          if (cachePolicy != null) 'cachePolicy': cachePolicy,
        },
      ),
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.post<T>(path, data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.put<T>(path, data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.delete<T>(path, data: data, queryParameters: queryParameters, options: options);
  }
}
---

5. lib/core/network/api_client.dart
---
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../result/result.dart';
import 'cache/cache_policy.dart';
import 'dio_client.dart';
import 'error/dio_error_mapper.dart';
import 'error/failure.dart';

@lazySingleton
class ApiClient {
  final DioClient _dioClient;

  ApiClient({required DioClient dioClient}) : _dioClient = dioClient;

  Future<Result<T>> get<T>({
    required String path,
    required T Function(dynamic json) fromJson,
    Map<String, dynamic>? queryParameters,
    CachePolicy? cachePolicy,
  }) async {
    try {
      final response = await _dioClient.get(
        path,
        queryParameters: queryParameters,
        cachePolicy: cachePolicy,
      );
      return Result.success(fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(DioErrorMapper.map(e));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }

  Future<Result<T>> post<T>({
    required String path,
    required T Function(dynamic json) fromJson,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dioClient.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return Result.success(fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(DioErrorMapper.map(e));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }

  Future<Result<T>> put<T>({
    required String path,
    required T Function(dynamic json) fromJson,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dioClient.put(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return Result.success(fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(DioErrorMapper.map(e));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }

  Future<Result<void>> delete({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      await _dioClient.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(DioErrorMapper.map(e));
    } catch (e) {
      return Result.failure(Failure.unknown(message: e.toString()));
    }
  }
}
---

6. lib/core/network/index.dart
---
export 'api_client.dart';
export 'dio_client.dart';
export 'cache/cache_manager.dart';
export 'cache/cache_policy.dart';
export 'cache/cache_entry.dart';
export 'cache/cache_key_builder.dart';
export 'error/failure.dart';
export 'error/dio_error_mapper.dart';
---

After creating files:
- Run: make gen
```

---

### Phase 5: Storage

```
Implementasikan Phase 5: Storage Layer.

Files to create:

1. lib/core/storage/token_store.dart
---
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TokenStore {
  final FlutterSecureStorage _storage;

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  TokenStore({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  Future<String?> getAccessToken() async {
    return _storage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return _storage.read(key: _refreshTokenKey);
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
    ]);
  }

  Future<bool> hasTokens() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
}
---

2. lib/core/storage/preferences_store.dart
---
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class PreferencesStore {
  final SharedPreferences _prefs;

  PreferencesStore({required SharedPreferences prefs}) : _prefs = prefs;

  // Onboarding
  static const _onboardingCompletedKey = 'onboarding_completed';

  bool get isOnboardingCompleted =>
      _prefs.getBool(_onboardingCompletedKey) ?? false;

  Future<void> setOnboardingCompleted(bool value) =>
      _prefs.setBool(_onboardingCompletedKey, value);

  // Add more preferences as needed
  // Example: last sync time, user preferences, etc.
}
---
```

---

### Phase 6: DI Setup

```
Implementasikan Phase 6: Dependency Injection.

Files to create:

1. lib/app/di/di.dart
---
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => getIt.init();
---

2. lib/app/di/register_module.dart
---
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/cache/cache_manager.dart';
import '../../core/network/cache/stores/hive_cache_store.dart';
import '../../core/network/cache/stores/hybrid_cache_store.dart';
import '../../core/network/cache/stores/memory_cache_store.dart';
import '../../core/network/cache/tag_index.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  MemoryCacheStore get memoryCacheStore => MemoryCacheStore();

  @preResolve
  Future<HiveCacheStore> hiveCacheStore() async {
    final store = HiveCacheStore();
    await store.init();
    return store;
  }

  @preResolve
  Future<TagIndex> tagIndex() async {
    final index = TagIndex();
    await index.init();
    return index;
  }

  @lazySingleton
  HybridCacheStore hybridCacheStore(
    MemoryCacheStore memory,
    HiveCacheStore hive,
    TagIndex tagIndex,
  ) =>
      HybridCacheStore(
        memory: memory,
        hive: hive,
        tagIndex: tagIndex,
      );

  @lazySingleton
  CacheManager cacheManager(HybridCacheStore store) =>
      CacheManager(store: store);
}
---

After creating files:
- Run: make gen
- Verify di.config.dart is generated
```

---

### Phase 7: Routing & Navigation

```
Implementasikan Phase 7: Routing & Navigation dengan routeName pattern.

Files to create:

1. lib/features/auth/presentation/login/pages/auth_login_page.dart
---
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase_1/features/auth/presentation/login/bloc/auth_login_cubit.dart';
import 'package:testcase_1/features/auth/presentation/login/bloc/auth_login_state.dart';
import 'package:testcase_1/features/auth/presentation/login/widgets/auth_login_form_widget.dart';

class AuthLoginPage extends StatelessWidget {
  const AuthLoginPage({super.key});

  /// Static route - gunakan const untuk route tanpa params
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthLoginCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: AuthLoginFormWidget(),
        ),
      ),
    );
  }
}
---

2. lib/features/auth/presentation/register/pages/auth_register_page.dart
---
import 'package:flutter/material.dart';

class AuthRegisterPage extends StatelessWidget {
  /// Static route - gunakan const untuk route tanpa params
  static const routeName = '/register';

  const AuthRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Register Page')),
    );
  }
}
---

3. lib/features/home/presentation/dashboard/pages/home_dashboard_page.dart
---
import 'package:flutter/material.dart';

class HomeDashboardPage extends StatelessWidget {
  /// Static route - gunakan const untuk route tanpa params
  static const routeName = '/';

  const HomeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Home Dashboard')),
    );
  }
}
---

4. lib/features/home/presentation/detail/pages/home_detail_page.dart
---
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  /// Dynamic route - gunakan function dengan default ':id' untuk definition
  /// Pass actual id untuk navigasi: HomeDetailPage.routeName(id: '123')
  static String routeName({String id = ':id'}) => '/detail/$id';

  final String id;
  const HomeDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail $id')),
      body: Center(child: Text('Detail Page: $id')),
    );
  }
}
---

5. lib/features/auth/routes/auth_routes.dart
---
import 'package:testcase_1/features/auth/presentation/login/pages/auth_login_page.dart';
import 'package:testcase_1/features/auth/presentation/register/pages/auth_register_page.dart';
import 'package:go_router/go_router.dart';

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
---

6. lib/features/home/routes/home_routes.dart
---
import 'package:go_router/go_router.dart';
import '../presentation/dashboard/pages/home_dashboard_page.dart';
import '../presentation/detail/pages/home_detail_page.dart';

/// Private routes untuk home (dalam shell)
final List<RouteBase> homeRoutes = [
  GoRoute(
    path: HomeDashboardPage.routeName,
    name: 'home',
    builder: (context, state) => const HomeDashboardPage(),
    routes: [
      // Nested route
      GoRoute(
        path: HomeDetailPage.routeName(),  // → /detail/:id (relative to parent)
        name: 'home-detail',
        builder: (context, state) => HomeDetailPage(
          id: state.pathParameters['id']!,
        ),
      ),
    ],
  ),
];
---

7. lib/app/router/guards/auth_guard.dart
---
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../di/di.dart';
import '../../../features/auth/domain/auth_notifier.dart';
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
---

8. lib/app/router/app_router.dart
---
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/config/env_config.dart';
import '../../features/auth/routes/auth_routes.dart';
import '../../features/home/routes/home_routes.dart';
import '../shell/app_shell_page.dart';
import 'guards/auth_guard.dart';

class AppRouter {
  AppRouter._();
  static final AppRouter instance = AppRouter._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

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
              navigatorKey: _shellNavigatorKey,
              routes: homeRoutes,
            ),
            // Tambah branch lain di sini (profile, settings, etc.)
          ],
        ),
      ],
    );
  }
}
---

Navigation Examples:
---
// Static route navigation
context.go(AuthLoginPage.routeName);           // → /login
context.go(HomeDashboardPage.routeName);       // → /

// Dynamic route navigation
context.go(HomeDetailPage.routeName(id: '123')); // → /detail/123
context.push(HomeDetailPage.routeName(id: '456')); // push ke stack

// Dari mana saja tanpa context (via AppRouter)
AppRouter.instance.router.go(AuthLoginPage.routeName);
---

Rules:
- Static route: gunakan `static const routeName = '/path'`
- Dynamic route: gunakan `static String routeName({String param = ':param'}) => '/path/$param'`
- Route definition di GoRoute: panggil tanpa args → `Page.routeName()` atau `Page.routeName`
- Navigation: panggil dengan actual value → `Page.routeName(id: '123')`
```

---

### Phase 8-16: Continue with remaining phases...

(Dokumen ini sudah sangat panjang. Untuk phase 8-16, ikuti pattern yang sama dengan merujuk ke Blueprint document untuk detail implementasi masing-masing component.)

---

## Makefile

```makefile
.PHONY: help get build clean test lint gen i18n run-dev run-staging run-prod

help:
	@echo "Available commands:"
	@echo "  make get         - Get dependencies"
	@echo "  make gen         - Run build_runner"
	@echo "  make i18n        - Merge i18n translations"
	@echo "  make build       - Run gen + i18n"
	@echo "  make clean       - Clean project"
	@echo "  make test        - Run tests"
	@echo "  make lint        - Run analyzer"
	@echo "  make run-dev     - Run app (dev)"
	@echo "  make run-staging - Run app (staging)"
	@echo "  make run-prod    - Run app (prod)"

get:
	flutter pub get

gen:
	dart run build_runner build --delete-conflicting-outputs

i18n:
	dart run tools/merge_i18n.dart

build: gen i18n

clean:
	flutter clean
	rm -rf .dart_tool
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

build-apk-dev:
	flutter build apk --dart-define-from-file=.env/dev.json

build-apk-prod:
	flutter build apk --dart-define-from-file=.env/prod.json

build-ios-dev:
	flutter build ios --dart-define-from-file=.env/dev.json

build-ios-prod:
	flutter build ios --dart-define-from-file=.env/prod.json
```

---

## App Flow Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                        main.dart                            │
│                            │                                │
│                      bootstrap()                            │
│                            │                                │
│    ┌───────────────────────┼───────────────────────┐       │
│    │                       │                       │        │
│    ▼                       ▼                       ▼        │
│  Hive.init           DI.configure          EasyLocalization │
│    │                       │                       │        │
│    └───────────────────────┼───────────────────────┘       │
│                            │                                │
│                        App()                                │
│                            │                                │
│                   MaterialApp.router                        │
│                            │                                │
│                      GoRouter                               │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                      GoRouter Routes                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Public Routes (no shell):                                  │
│  ├── /login      → AuthLoginPage                           │
│  └── /register   → AuthRegisterPage                        │
│                                                             │
│  Private Routes (with shell):                               │
│  └── StatefulShellRoute.indexedStack                       │
│      └── AppShellPage                                       │
│          ├── Branch 0: /        → HomeDashboardPage        │
│          └── Branch 1: /profile → ProfilePage              │
│                                                             │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                     Login Flow                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  User opens app                                             │
│       │                                                     │
│       ▼                                                     │
│  AuthGuard.redirect()                                       │
│       │                                                     │
│       ├── Not logged in → /login                           │
│       │       │                                             │
│       │       ▼                                             │
│       │   AuthLoginPage                                     │
│       │       │                                             │
│       │       ▼                                             │
│       │   AuthLoginCubit.submit()                          │
│       │       │                                             │
│       │       ▼                                             │
│       │   LoginUseCase → AuthRepository → API              │
│       │       │                                             │
│       │       ▼                                             │
│       │   TokenStore.saveTokens()                          │
│       │       │                                             │
│       │       ▼                                             │
│       │   AuthNotifier.notifyListeners()                   │
│       │       │                                             │
│       │       ▼                                             │
│       │   GoRouter.refresh() → AuthGuard                   │
│       │       │                                             │
│       └───────┼── Logged in → /                            │
│               │                                             │
│               ▼                                             │
│           AppShellPage                                      │
│               │                                             │
│               ▼                                             │
│           HomeDashboardPage                                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                  Cache Flow (RTK Query Style)               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  GET Request with CachePolicy                               │
│       │                                                     │
│       ▼                                                     │
│  CacheInterceptor.onRequest()                              │
│       │                                                     │
│       ├── Cache hit (valid) → Return cached response       │
│       │                                                     │
│       ├── Cache hit (stale) + SWR enabled:                 │
│       │       │                                             │
│       │       ├── Return stale immediately                 │
│       │       └── Continue to network (background)         │
│       │                                                     │
│       └── Cache miss → Continue to network                 │
│               │                                             │
│               ▼                                             │
│           Network Request                                   │
│               │                                             │
│               ▼                                             │
│       CacheInterceptor.onResponse()                        │
│               │                                             │
│               ▼                                             │
│       CacheManager.put() → HybridCacheStore                │
│               │                                             │
│               ├── Memory (fast)                            │
│               └── Hive (persistent)                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Quick Start Commands

```bash
# 1. Clone/create project
flutter create woee
cd woee

# 2. Setup dependencies
# (update pubspec.yaml first)
make get

# 3. Generate code
make gen

# 4. Merge translations
make i18n

# 5. Run app
make run-dev
```

---

## Checklist Final

- [ ] pubspec.yaml dengan semua dependencies
- [ ] Folder structure lengkap
- [ ] analysis_options.yaml
- [ ] Environment files (.env/\*.json)
- [ ] Makefile
- [ ] Core: EnvConfig, Result, AsyncState, Failure, DioErrorMapper
- [ ] Cache: CacheEntry, CacheKeyBuilder, CachePolicy, Stores, CacheManager
- [ ] Network: Interceptors, DioClient, ApiClient
- [ ] Storage: TokenStore, PreferencesStore
- [ ] DI: di.dart, register_module.dart
- [ ] Theme: AppColors, AppTypography, AppTheme, ThemeCubit
- [ ] Shared: AppSpacing, AppRadius, Widgets
- [ ] Router: AuthGuard, AppRouter (routeName di Page classes)
- [ ] Shell: AppShellConfig, BottomNavWidget, AppShellLayout, AppShellPage
- [ ] Bootstrap: bootstrap.dart
- [ ] App: app.dart, main.dart
- [ ] Auth Feature: Domain, Data, Presentation
- [ ] Home Feature: Presentation
- [ ] i18n: merge script, JSON files
- [ ] Tests: CacheKeyBuilder, DioErrorMapper

---

_Prompt Version: 1.1_
_Last Updated: January 2026_
