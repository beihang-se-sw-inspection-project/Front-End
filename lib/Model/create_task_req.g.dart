// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateTaskReqToJson(CreateTaskReq instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Map<String, dynamic> _$CreateTaskDataReqToJson(CreateTaskDataReq instance) =>
    <String, dynamic>{
      'type': instance.type,
      'attributes': instance.attributes,
    };

Map<String, dynamic> _$CreateTaskDataAttrReqToJson(
        CreateTaskDataAttrReq instance) =>
    <String, dynamic>{
      'project_id': instance.project_id,
      'title': instance.title,
      'status': instance.status,
      'deadline': instance.deadline,
      'priority': instance.priority,
      'task_detail': instance.task_detail,
      'assignee': instance.assignee,
      'inspector': instance.inspector,
      'project_manager': instance.project_manager,
      'report': instance.report,
    };
