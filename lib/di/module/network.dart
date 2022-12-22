import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../Service/share_pref_service.dart';

@module
abstract class WebApiRegisterModule {
  @Named('apiBaseUrl')
  String getContentApiBaseUrl() {
    return 'https://bhinspector.2times180.com';
  }

  @Named('apiAccessToken')
  String getContentApiAccessToken(SharePrefService sharePrefService) {
    return sharePrefService.getAccessToken();
  }

  Dio getDio(
      BaseOptions options,
      PrettyDioLogger loggerInterceptor,
      ) {
    final dio = Dio();
    dio.options = options;
    dio.options.headers["accept"] = "application/vnd.api+json";
    dio.options.headers["content-type"] = "application/vnd.api+json";
    dio.interceptors.add(loggerInterceptor);
    return dio;
  }

  PrettyDioLogger getLoggerInterceptor() => PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 150,
  );

  BaseOptions getBaseOption() => BaseOptions(
    sendTimeout: 30000,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
}
