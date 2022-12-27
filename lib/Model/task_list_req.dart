import 'package:json_annotation/json_annotation.dart';

part 'task_list_req.g.dart';

@JsonSerializable(createToJson: false)
class TaskListReq {
  List<TaskDataReq> data;

  TaskListReq(this.data);

  factory TaskListReq.fromJson(Map<String, dynamic> json) =>
      _$TaskListReqFromJson(json);
}

@JsonSerializable(createToJson: false)
class TaskDataReq {
  String id;
  String type;
  TaskDataAttrReq attributes;

  TaskDataReq(
      this.id,
      this.type,
      this.attributes,
      );

  factory TaskDataReq.fromJson(Map<String, dynamic> json) =>
      _$TaskDataReqFromJson(json);
}

@JsonSerializable(createToJson: false)
class TaskDataAttrReq {
  String project_id;
  String status;
  String deadline;
  String priority;
  String task_detail;
  String title;
  String created_at;
  String updated_at;
  String assignee;
  String inspector;
  String project_manager;
  String report;

  TaskDataAttrReq(
      this.project_id,
      this.status,
      this.deadline,
      this.priority,
      this.task_detail,
      this.title,
      this.created_at,
      this.updated_at,
      this.assignee,
      this.inspector,
      this.project_manager,
      this.report,
      );

  factory TaskDataAttrReq.fromJson(Map<String, dynamic> json) =>
      _$TaskDataAttrReqFromJson(json);
}
