// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$RegisterReqToJson(RegisterReq instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Map<String, dynamic> _$RegisterDataReqToJson(RegisterDataReq instance) =>
    <String, dynamic>{
      'type': instance.type,
      'attributes': instance.attributes,
    };

Map<String, dynamic> _$RegisterDataAttrReqToJson(
        RegisterDataAttrReq instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'password_confirmation': instance.password_confirmation,
    };
