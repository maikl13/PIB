import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_skill.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateSkill {
  bool? status;

  UpdateSkill({this.status});

  factory UpdateSkill.fromJson(Map<String, dynamic> json) =>
      _$UpdateSkillFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateSkillToJson(this);
}
