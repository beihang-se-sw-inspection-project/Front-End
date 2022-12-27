import 'package:json_annotation/json_annotation.dart';

part 'create_project_req.g.dart';

@JsonSerializable(createFactory: false)
class CreateProjectReq {
  CreateProjectDataReq data;

  CreateProjectReq(this.data);

  Map<String, dynamic> toJson() => _$CreateProjectReqToJson(this);
}

@JsonSerializable(createFactory: false)
class CreateProjectDataReq {
  String type;
  CreateProjectDataAttrReq attributes;

  CreateProjectDataReq(this.type, this.attributes);

  Map<String, dynamic> toJson() => _$CreateProjectDataReqToJson(this);
}

@JsonSerializable(createFactory: false)
class CreateProjectDataAttrReq {
  String project_name;
  String project_manager;
  String assignee;
  String date;
  String priority;
  String overview;
  String to_do;


  CreateProjectDataAttrReq(
      this.project_name,
      this.project_manager,
      this.assignee,
      this.date,
      this.priority,
      this.overview,
      this.to_do,
      );

  Map<String, dynamic> toJson() => _$CreateProjectDataAttrReqToJson(this);

  @override
  String toString() {
    return "\n$project_name \n$project_manager \n$assignee \n$date \n$priority \n$overview \n$to_do";
  }
}
