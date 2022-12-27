import 'package:json_annotation/json_annotation.dart';

part 'create_task_req.g.dart';

@JsonSerializable(createFactory: false)
class CreateTaskReq {
  CreateTaskDataReq data;

  CreateTaskReq(this.data);

  Map<String, dynamic> toJson() => _$CreateTaskReqToJson(this);
}

@JsonSerializable(createFactory: false)
class CreateTaskDataReq {
  String type;
  CreateTaskDataAttrReq attributes;

  CreateTaskDataReq(this.type, this.attributes);

  Map<String, dynamic> toJson() => _$CreateTaskDataReqToJson(this);
}

@JsonSerializable(createFactory: false)
class CreateTaskDataAttrReq {
  String project_id;
  String title;
  String status;
  String deadline;
  String priority;
  String task_detail;
  String assignee;
  String inspector;
  String project_manager;
  String? report;

  CreateTaskDataAttrReq(
    this.project_id,
    this.title,
    this.status,
    this.deadline,
    this.priority,
    this.task_detail,
    this.assignee,
    this.project_manager,
    this.report,
    this.inspector,
  );

  Map<String, dynamic> toJson() => _$CreateTaskDataAttrReqToJson(this);
}
