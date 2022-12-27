// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateProjectReqToJson(CreateProjectReq instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Map<String, dynamic> _$CreateProjectDataReqToJson(
        CreateProjectDataReq instance) =>
    <String, dynamic>{
      'type': instance.type,
      'attributes': instance.attributes,
    };

Map<String, dynamic> _$CreateProjectDataAttrReqToJson(
        CreateProjectDataAttrReq instance) =>
    <String, dynamic>{
      'project_name': instance.project_name,
      'project_manager': instance.project_manager,
      'assignee': instance.assignee,
      'date': instance.date,
      'priority': instance.priority,
      'overview': instance.overview,
      'to_do': instance.to_do,
    };
