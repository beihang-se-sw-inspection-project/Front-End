import 'package:json_annotation/json_annotation.dart';

part 'register_req.g.dart';

@JsonSerializable(createFactory: false)
class RegisterReq {
  RegisterDataReq data;

  RegisterReq(this.data);

  Map<String, dynamic> toJson() => _$RegisterReqToJson(this);
}

@JsonSerializable(createFactory: false)
class RegisterDataReq {
  String type;
  RegisterDataAttrReq attributes;

  RegisterDataReq(this.type, this.attributes);

  Map<String, dynamic> toJson() => _$RegisterDataReqToJson(this);
}


@JsonSerializable(createFactory: false)
class RegisterDataAttrReq {
  String name;
  String email;
  String password;
  String role;
  String password_confirmation;


  RegisterDataAttrReq(this.name, this.email, this.password, this.role,
      this.password_confirmation);

  Map<String, dynamic> toJson() => _$RegisterDataAttrReqToJson(this);
}