import 'package:json_annotation/json_annotation.dart';

part 'login_req.g.dart';

@JsonSerializable(createFactory: false)
class LoginReq {
  LoginDataReq data;

  LoginReq(this.data);

  Map<String, dynamic> toJson() => _$LoginReqToJson(this);
}

@JsonSerializable(createFactory: false)
class LoginDataReq {
  String type;
  LoginDataAttrReq attributes;

  LoginDataReq(this.type, this.attributes);

  Map<String, dynamic> toJson() => _$LoginDataReqToJson(this);
}

@JsonSerializable(createFactory: false)
class LoginDataAttrReq {
  String email;
  String password;

  LoginDataAttrReq(
    this.email,
    this.password,
  );

  Map<String, dynamic> toJson() => _$LoginDataAttrReqToJson(this);
}
