// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      UserModelRes.fromJson(json['data'] as Map<String, dynamic>),
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
      json['accessToken'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
    );
