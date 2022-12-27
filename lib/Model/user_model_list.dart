import 'package:json_annotation/json_annotation.dart';

part 'user_model_list.g.dart';

@JsonSerializable(createToJson: false)
class UserModelList {
  @JsonKey(name: 'data')
  List<UserModelRes> data;

  UserModelList(this.data);

  factory UserModelList.fromJson(Map<String, dynamic> json) =>
      _$UserModelListFromJson(json);

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

  RegisterDataAttrReq(
      this.name,
      this.email,
      this.role,
      this.created_at,
      this.updated_at,
      );

  factory RegisterDataAttrReq.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataAttrReqFromJson(json);
}
