import 'package:freezed_annotation/freezed_annotation.dart';

part 'skills_model.g.dart';

@JsonSerializable(explicitToJson: true)

class SkillModel {
  int? id;
  String? name;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'enabled')
  int? enabled;

  SkillModel({this.id, this.name, this.imageUrl,this.enabled});

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);
  Map<String, dynamic> toJson() => _$SkillModelToJson(this);


}
