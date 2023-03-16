import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AdModel {
  int? id;
  String? name;
  List<Ads>? ads;

  AdModel({this.id, this.name, this.ads});

  factory AdModel.fromJson(Map<String, dynamic> json) =>
      _$AdModelFromJson(json);
  Map<String, dynamic> toJson() => _$AdModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Ads {
  int? id;
  String? title;
  String? image;
  @JsonKey(name: 'skill_name')
  String? skillName;

  Ads({this.id, this.title, this.image, this.skillName});

  factory Ads.fromJson(Map<String, dynamic> json) => _$AdsFromJson(json);
  Map<String, dynamic> toJson() => _$AdsToJson(this);
}
