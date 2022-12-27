import 'package:json_annotation/json_annotation.dart';

part 'update_task_req.g.dart';

@JsonSerializable(createFactory: false)
class UpdateTaskReq {
  UpdateTaskDataReq data;

  UpdateTaskReq(this.data);

  Map<String, dynamic> toJson() => _$UpdateTaskReqToJson(this);
}

@JsonSerializable(createFactory: false)
class UpdateTaskDataReq {
  String type;
  String id;
  UpdateTaskDataAttrReq attributes;

  UpdateTaskDataReq(this.type, this.id, this.attributes);

  Map<String, dynamic> toJson() => _$UpdateTaskDataReqToJson(this);
}

@JsonSerializable(createFactory: false)
class UpdateTaskDataAttrReq {
  String taskId;
  String status;
  String report;

  UpdateTaskDataAttrReq(this.taskId,this.status,this.report);

  Map<String, dynamic> toJson() => _$UpdateTaskDataAttrReqToJson(this);
}
