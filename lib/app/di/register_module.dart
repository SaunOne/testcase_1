import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:testcase_1/app/router/auth_notifier.dart';

import 'package:testcase_1/core/network/api_client.dart';
import 'package:testcase_1/core/network/cache/cache_manager.dart';
import 'package:testcase_1/core/network/cache/stores/hive_cache_store.dart';
import 'package:testcase_1/core/network/cache/stores/hybrid_cache_store.dart';
import 'package:testcase_1/core/network/cache/stores/memory_cache_store.dart';
import 'package:testcase_1/core/network/cache/tag_index.dart';
import 'package:testcase_1/core/network/dio_client.dart';
import 'package:testcase_1/core/query/client/query_client.dart';
import 'package:testcase_1/core/storage/preferences_store.dart';
import 'package:testcase_1/core/storage/token_store.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  TokenStore tokenStore(FlutterSecureStorage storage) =>
      TokenStore(storage: storage);

  @lazySingleton
  PreferencesStore preferencesStore(SharedPreferences prefs) =>
      PreferencesStore(prefs: prefs);

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
  ) => HybridCacheStore(memory: memory, hive: hive, tagIndex: tagIndex);

  @lazySingleton
  CacheManager cacheManager(HybridCacheStore store) =>
      CacheManager(store: store);

  @lazySingleton
  DioClient dioClient(
    TokenStore tokenStore,
    CacheManager cacheManager,
    AuthNotifier authNotifier,
  ) => DioClient(
    tokenStore: tokenStore,
    cacheManager: cacheManager,
    authNotifier: authNotifier,
  );

  @lazySingleton
  ApiClient apiClient(DioClient dioClient) => ApiClient(dioClient: dioClient);

  @lazySingleton
  QueryClient queryClient(ApiClient apiClient, CacheManager cacheManager) =>
      QueryClient(apiClient: apiClient, cacheManager: cacheManager);

  // Auth
  @lazySingleton
  AuthNotifier get authNotifier => AuthNotifier();
}
