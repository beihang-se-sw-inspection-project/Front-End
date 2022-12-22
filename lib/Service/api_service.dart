import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report_app/Model/login_req.dart';
import 'package:report_app/Model/user_model.dart';
import 'package:retrofit/retrofit.dart';

import '../Model/register_req.dart';

part 'api_service.g.dart';

@injectable
@RestApi()
abstract class ApiService {
  @factoryMethod
  factory ApiService(
      Dio dio, {
        @Named('apiBaseUrl') String? baseUrl,
        @Named('apiAccessToken') String? accessToken,
        @factoryParam bool? isAnonymous,
      }) {
    isAnonymous ??= false;
    if (!isAnonymous) {
      dio.options.headers.addAll({
        'Authorization': 'Bearer $accessToken',
      });
    }

    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST("/public/api/v1/noauth/users")
  Future <UserModel> register(@Body() RegisterReq body);
  @POST("/public/api/v1/noauth/auth")
  Future <UserModel> login(@Body() LoginReq body);
}
