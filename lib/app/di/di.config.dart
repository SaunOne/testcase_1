// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../core/network/api_client.dart' as _i1059;
import '../../core/network/cache/cache_manager.dart' as _i1059;
import '../../core/network/cache/stores/hive_cache_store.dart' as _i837;
import '../../core/network/cache/stores/hybrid_cache_store.dart' as _i610;
import '../../core/network/cache/stores/memory_cache_store.dart' as _i542;
import '../../core/network/cache/tag_index.dart' as _i179;
import '../../core/network/dio_client.dart' as _i571;
import '../../core/query/client/query_client.dart' as _i634;
import '../../core/storage/preferences_store.dart' as _i1062;
import '../../core/storage/token_store.dart' as _i985;
import '../router/auth_notifier.dart' as _i105;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i837.HiveCacheStore>(
      () => registerModule.hiveCacheStore(),
      preResolve: true,
    );
    await gh.factoryAsync<_i179.TagIndex>(
      () => registerModule.tagIndex(),
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i542.MemoryCacheStore>(
      () => registerModule.memoryCacheStore,
    );
    gh.lazySingleton<_i105.AuthNotifier>(() => registerModule.authNotifier);
    gh.lazySingleton<_i1062.PreferencesStore>(
      () => registerModule.preferencesStore(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i610.HybridCacheStore>(
      () => registerModule.hybridCacheStore(
        gh<_i542.MemoryCacheStore>(),
        gh<_i837.HiveCacheStore>(),
        gh<_i179.TagIndex>(),
      ),
    );
    gh.lazySingleton<_i985.TokenStore>(
      () => registerModule.tokenStore(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i1059.CacheManager>(
      () => registerModule.cacheManager(gh<_i610.HybridCacheStore>()),
    );
    gh.lazySingleton<_i571.DioClient>(
      () => registerModule.dioClient(
        gh<_i985.TokenStore>(),
        gh<_i1059.CacheManager>(),
        gh<_i105.AuthNotifier>(),
      ),
    );
    gh.lazySingleton<_i1059.ApiClient>(
      () => registerModule.apiClient(gh<_i571.DioClient>()),
    );
    gh.lazySingleton<_i634.QueryClient>(
      () => registerModule.queryClient(
        gh<_i1059.ApiClient>(),
        gh<_i1059.CacheManager>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
