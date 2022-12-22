// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../Service/api_service.dart' as _i7;
import '../Service/share_pref_service.dart' as _i6;
import 'module/network.dart' as _i8;
import 'module/third_party_helper_register_module.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final webApiRegisterModule = _$WebApiRegisterModule();
  final thirdPartyHelperRegisterModule = _$ThirdPartyHelperRegisterModule();
  gh.factory<_i3.BaseOptions>(() => webApiRegisterModule.getBaseOption());
  gh.factory<_i4.PrettyDioLogger>(
      () => webApiRegisterModule.getLoggerInterceptor());
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => thirdPartyHelperRegisterModule.getPreferenceInstance(),
    preResolve: true,
  );
  gh.factory<String>(
    () => webApiRegisterModule.getContentApiBaseUrl(),
    instanceName: 'apiBaseUrl',
  );
  gh.factory<_i3.Dio>(() => webApiRegisterModule.getDio(
        get<_i3.BaseOptions>(),
        get<_i4.PrettyDioLogger>(),
      ));
  gh.factory<_i6.SharePrefService>(
      () => _i6.SharePrefService(get<_i5.SharedPreferences>()));
  gh.factory<String>(
    () => webApiRegisterModule
        .getContentApiAccessToken(get<_i6.SharePrefService>()),
    instanceName: 'apiAccessToken',
  );
  gh.factoryParam<_i7.ApiService, bool?, dynamic>((
    isAnonymous,
    _,
  ) =>
      _i7.ApiService(
        get<_i3.Dio>(),
        baseUrl: get<String>(instanceName: 'apiBaseUrl'),
        accessToken: get<String>(instanceName: 'apiAccessToken'),
        isAnonymous: isAnonymous,
      ));
  return get;
}

class _$WebApiRegisterModule extends _i8.WebApiRegisterModule {}

class _$ThirdPartyHelperRegisterModule
    extends _i9.ThirdPartyHelperRegisterModule {}
