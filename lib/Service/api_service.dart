import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:report_app/Model/create_project_req.dart';
import 'package:report_app/Model/create_report_req.dart';
import 'package:report_app/Model/create_task_req.dart';
import 'package:report_app/Model/login_req.dart';
import 'package:report_app/Model/project_list_req.dart';
import 'package:report_app/Model/task_list_req.dart';
import 'package:report_app/Model/update_task_req.dart';
import 'package:report_app/Model/user_model.dart';
import 'package:report_app/Model/user_model_list.dart';
import 'package:report_app/Screen/CreateReport.dart';
import 'package:report_app/Screen/CreateTask.dart';
import 'package:report_app/Screen/UpdateStatus.dart';
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
  Future<UserModel> register(@Body() RegisterReq body);

  @POST("/public/api/v1/noauth/auth")
  Future<UserModel> login(@Body() LoginReq body);

  @POST("/public/api/v1/projects")
  Future createProject(@Body() CreateProjectReq body);

  @POST("/public/api/v1/tasks")
  Future createTask(@Body() CreateTaskReq body);

  @POST("/public/api/v1/inspections")
  Future createReport(@Body() CreateReportReq body);

  @PATCH("/public/api/v1/tasks/{id}")
  Future updateTask(@Path("id") String id, @Body() UpdateTaskReq body);

  @GET("/public/api/v1/tasks")
  Future<TaskListReq> getTask();

  @GET("/public/api/v1/projects")
  Future<ProjectListReq> getProject();

  @GET("/public/api/v1/users")
  Future<UserModelList> getUser();
}
