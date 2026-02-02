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
import '../../features/auth/data/services/social_auth_service.dart' as _i821;
import '../../features/social_maps/data/datasources/map_camera_local_data_source.dart'
    as _i927;
import '../../features/social_maps/data/datasources/map_tiles_remote_data_source.dart'
    as _i903;
import '../../features/social_maps/data/services/location_api_service.dart'
    as _i1023;
import '../../features/social_maps/data/services/map_socket_service.dart'
    as _i48;
import '../../features/social_maps/data/services/real_map_socket_service.dart'
    as _i917;
import '../../features/social_maps/data/services/social_dio_client.dart'
    as _i595;
import '../../features/social_maps/data/services/social_maps_service.dart'
    as _i340;
import '../../features/social_maps/data/services/social_websocket_service.dart'
    as _i363;
import '../../features/social_maps/presentation/maps/blocs/map_camera_cubit/map_camera_cubit.dart'
    as _i303;
import '../../features/social_maps/presentation/maps/blocs/places_bloc/places_bloc.dart'
    as _i839;
import '../../features/social_maps/presentation/maps/blocs/users_map_bloc/users_map_bloc.dart'
    as _i443;
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
    gh.factory<_i839.PlacesBloc>(() => registerModule.placesBloc);
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
    gh.lazySingleton<_i903.MapTilesRemoteDataSource>(
      () => registerModule.mapTilesDataSource,
    );
    gh.lazySingleton<_i821.SocialAuthService>(() => _i821.SocialAuthService());
    gh.lazySingleton<_i1062.PreferencesStore>(
      () => registerModule.preferencesStore(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i927.MapCameraLocalDataSource>(
      () => registerModule.mapCameraDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i610.HybridCacheStore>(
      () => registerModule.hybridCacheStore(
        gh<_i542.MemoryCacheStore>(),
        gh<_i837.HiveCacheStore>(),
        gh<_i179.TagIndex>(),
      ),
    );
    gh.factory<_i303.MapCameraCubit>(
      () => registerModule.mapCameraCubit(
        gh<_i927.MapCameraLocalDataSource>(),
        gh<_i903.MapTilesRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i340.SocialMapsService>(
      () => registerModule.socialMapsService(
        gh<_i903.MapTilesRemoteDataSource>(),
        gh<_i927.MapCameraLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i985.TokenStore>(
      () => registerModule.tokenStore(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i363.SocialWebSocketService>(
      () => _i363.SocialWebSocketService(tokenStore: gh<_i985.TokenStore>()),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i595.SocialDioClient>(
      () => _i595.SocialDioClient(
        tokenStore: gh<_i985.TokenStore>(),
        authNotifier: gh<_i105.AuthNotifier>(),
      ),
    );
    gh.lazySingleton<_i1059.CacheManager>(
      () => registerModule.cacheManager(gh<_i610.HybridCacheStore>()),
    );
    gh.lazySingleton<_i571.DioClient>(
      () => registerModule.socialDioClient(
        gh<_i985.TokenStore>(),
        gh<_i1059.CacheManager>(),
        gh<_i105.AuthNotifier>(),
      ),
      instanceName: 'social',
    );
    gh.lazySingleton<_i1023.LocationApiService>(
      () => _i1023.LocationApiService(client: gh<_i595.SocialDioClient>()),
    );
    gh.lazySingleton<_i571.DioClient>(
      () => registerModule.dioClient(
        gh<_i985.TokenStore>(),
        gh<_i1059.CacheManager>(),
        gh<_i105.AuthNotifier>(),
      ),
    );
    gh.lazySingleton<_i1059.ApiClient>(
      () => registerModule.socialApiClient(
        gh<_i571.DioClient>(instanceName: 'social'),
      ),
      instanceName: 'social',
    );
    gh.lazySingleton<_i634.QueryClient>(
      () => registerModule.socialQueryClient(
        gh<_i1059.ApiClient>(instanceName: 'social'),
        gh<_i1059.CacheManager>(),
      ),
      instanceName: 'social',
    );
    gh.lazySingleton<_i1059.ApiClient>(
      () => registerModule.apiClient(gh<_i571.DioClient>()),
    );
    gh.lazySingleton<_i48.MapSocketService>(
      () => _i917.RealMapSocketService(
        locationApi: gh<_i1023.LocationApiService>(),
        webSocket: gh<_i363.SocialWebSocketService>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i634.QueryClient>(
      () => registerModule.queryClient(
        gh<_i1059.ApiClient>(),
        gh<_i1059.CacheManager>(),
      ),
    );
    gh.factory<_i443.UsersMapBloc>(
      () => registerModule.usersMapBloc(gh<_i48.MapSocketService>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
