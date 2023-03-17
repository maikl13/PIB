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
  String? content;
  String? phone;
  String? website;
  String? location;
  @JsonKey(name: 'skill_id')
  String? skilId;
  @JsonKey(name: 'ad_category_id')
  String? adCategoryId;
  String? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'skill_name')
  String? skillName;
  @JsonKey(name: 'category_name')
  String? categoryName;

  Ads(
      {this.id,
      this.title,
      this.image,
      this.content,
      this.phone,
      this.website,
      this.location,
      this.skilId,
      this.adCategoryId,
      this.status,
      this.createdAt,
      this.skillName,
      this.categoryName});



  factory Ads.fromJson(Map<String, dynamic> json) => _$AdsFromJson(json);
  Map<String, dynamic> toJson() => _$AdsToJson(this);
}
