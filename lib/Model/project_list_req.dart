import 'package:json_annotation/json_annotation.dart';

part 'project_list_req.g.dart';

@JsonSerializable(createToJson: false)
class ProjectListReq {
  List<ProjectDataReq> data;

  ProjectListReq(this.data);

  factory ProjectListReq.fromJson(Map<String, dynamic> json) =>
      _$ProjectListReqFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProjectDataReq {
  String id;
  String type;
  ProjectDataAttrReq attributes;

  ProjectDataReq(
    this.id,
    this.type,
    this.attributes,
  );

  factory ProjectDataReq.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataReqFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProjectDataAttrReq {
  String project_name;
  String project_manager;
  String assignee;
  String date;
  String priority;
  String overview;
  String to_do;
  String created_at;
  String updated_at;

  ProjectDataAttrReq(
    this.project_name,
    this.project_manager,
    this.assignee,
    this.date,
    this.priority,
    this.overview,
    this.to_do,
    this.created_at,
    this.updated_at,
  );

  factory ProjectDataAttrReq.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataAttrReqFromJson(json);
}
