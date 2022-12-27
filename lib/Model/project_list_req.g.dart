// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectListReq _$ProjectListReqFromJson(Map<String, dynamic> json) =>
    ProjectListReq(
      (json['data'] as List<dynamic>)
          .map((e) => ProjectDataReq.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ProjectDataReq _$ProjectDataReqFromJson(Map<String, dynamic> json) =>
    ProjectDataReq(
      json['id'] as String,
      json['type'] as String,
      ProjectDataAttrReq.fromJson(json['attributes'] as Map<String, dynamic>),
    );

ProjectDataAttrReq _$ProjectDataAttrReqFromJson(Map<String, dynamic> json) =>
    ProjectDataAttrReq(
      json['project_name'] as String,
      json['project_manager'] as String,
      json['assignee'] as String,
      json['date'] as String,
      json['priority'] as String,
      json['overview'] as String,
      json['to_do'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
    );
