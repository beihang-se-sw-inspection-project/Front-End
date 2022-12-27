
import 'package:json_annotation/json_annotation.dart';

part 'error_res.g.dart';

@JsonSerializable(createToJson: false)
class ErrorRes {
  List<EachError> errors;

  ErrorRes(this.errors);

  factory ErrorRes.fromJson(Map<String, dynamic> json) =>
      _$ErrorResFromJson(json);

  String getConcatError() {
    return errors.map((e) => e.detail).toList().join("\n");
  }
}


@JsonSerializable(createToJson: false)
class EachError {
  String? title;
  String? detail;


  EachError({this.title, this.detail});

  factory EachError.fromJson(Map<String, dynamic> json) =>
      _$EachErrorFromJson(json);
}