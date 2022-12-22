import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel {
  @JsonKey(name: 'data')
  UserModelRes data;

  UserModel(this.data);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

}

@JsonSerializable(createToJson: false)
class UserModelRes {
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'attributes')
  RegisterDataAttrReq attributes;

  UserModelRes(this.type, this.attributes);

  factory UserModelRes.fromJson(Map<String, dynamic> json) =>
      _$UserModelResFromJson(json);

}

@JsonSerializable(createToJson: false)
class RegisterDataAttrReq {
  String name;
  String email;
  String role;
  String updated_at;
  String created_at;
  String accessToken;

  RegisterDataAttrReq(
    this.name,
    this.email,
    this.role,
    this.accessToken,
    this.created_at,
    this.updated_at,
  );

  factory RegisterDataAttrReq.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataAttrReqFromJson(json);
}
