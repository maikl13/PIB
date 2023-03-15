import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  bool? status;
  String? msg;

  ErrorModel(this.status, this.msg);

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
