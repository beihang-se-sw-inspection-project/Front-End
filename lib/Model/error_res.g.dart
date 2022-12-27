// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorRes _$ErrorResFromJson(Map<String, dynamic> json) => ErrorRes(
      (json['errors'] as List<dynamic>)
          .map((e) => EachError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

EachError _$EachErrorFromJson(Map<String, dynamic> json) => EachError(
      title: json['title'] as String?,
      detail: json['detail'] as String?,
    );
