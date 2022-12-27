// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskListReq _$TaskListReqFromJson(Map<String, dynamic> json) => TaskListReq(
      (json['data'] as List<dynamic>)
          .map((e) => TaskDataReq.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

TaskDataReq _$TaskDataReqFromJson(Map<String, dynamic> json) => TaskDataReq(
      json['id'] as String,
      json['type'] as String,
      TaskDataAttrReq.fromJson(json['attributes'] as Map<String, dynamic>),
    );

TaskDataAttrReq _$TaskDataAttrReqFromJson(Map<String, dynamic> json) =>
    TaskDataAttrReq(
      json['project_id'] as String,
      json['status'] as String,
      json['deadline'] as String,
      json['priority'] as String,
      json['task_detail'] as String,
      json['title'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['assignee'] as String,
      json['inspector'] as String,
      json['project_manager'] as String,
      json['report'] as String,
    );
