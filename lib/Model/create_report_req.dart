import 'package:json_annotation/json_annotation.dart';

part 'create_report_req.g.dart';

@JsonSerializable(createFactory: false)
class CreateReportReq {
  CreateReportDataReq data;

  CreateReportReq(this.data);

  Map<String, dynamic> toJson() => _$CreateReportReqToJson(this);
}

@JsonSerializable(createFactory: false)
class CreateReportDataReq {
  String type;
  CreateReportDataAttrReq attributes;

  CreateReportDataReq(this.type, this.attributes);

  Map<String, dynamic> toJson() => _$CreateReportDataReqToJson(this);
}

@JsonSerializable(createFactory: false)
class CreateReportDataAttrReq {
  String task_id;
  String status;
  String report;

  CreateReportDataAttrReq(
      this.task_id,
      this.status,
      this.report,
      );

  Map<String, dynamic> toJson() => _$CreateReportDataAttrReqToJson(this);
}
