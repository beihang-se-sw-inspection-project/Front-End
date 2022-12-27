// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelList _$UserModelListFromJson(Map<String, dynamic> json) =>
    UserModelList(
      (json['data'] as List<dynamic>)
          .map((e) => UserModelRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

UserModelRes _$UserModelResFromJson(Map<String, dynamic> json) => UserModelRes(
      json['type'] as String,
      RegisterDataAttrReq.fromJson(json['attributes'] as Map<String, dynamic>),
    );

RegisterDataAttrReq _$RegisterDataAttrReqFromJson(Map<String, dynamic> json) =>
    RegisterDataAttrReq(
      json['name'] as String,
      json['email'] as String,
      json['role'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
    );
