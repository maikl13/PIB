import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MyRequestModel {
  int? id;
  String? description;
  @JsonKey(name: 'category_id')
  String? categoryId;
  String? price;
  String? location;
  String? status;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'accepted_offer_id')
  String? acceptedOfferID;
  String? type;

  @JsonKey(name: 'created_at')
  String? createdAt;
  String? time;
  Category? category;
  Category? user;
  List<Images>? images;
  List<Videos>? videos;
  @JsonKey(name: 'offers_count')
  int? offersCount;
  @JsonKey(name: 'belong_to_current_user')
  bool? belongToCurrentUser;
  @JsonKey(name: 'submitted_offer')
  bool? submittedOffer;
  @JsonKey(name: 'submitted_offer_id')
  int? submittedOfferId;

  MyRequestModel(
      {this.id,
      this.description,
      this.categoryId,
      this.price,
      this.location,
      this.status,
      this.userId,
      this.createdAt,
      this.time,
      this.category,
      this.user,
      this.images,
      this.videos,
      this.offersCount,
      this.belongToCurrentUser,
      this.submittedOffer});

  factory MyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MyRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyRequestModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Category {
  int? id;
  String? name;
  @JsonKey(name: 'image_url')
  String? imageUrl;

  Category({this.id, this.name, this.imageUrl});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Images {
  int? id;
  @JsonKey(name: 'attachment_url')
  String? attachmentUrl;

  Images({this.id, this.attachmentUrl});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Videos {
  int? id;
  String? attachmentUrl;

  Videos({this.id, this.attachmentUrl});

  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);
  Map<String, dynamic> toJson() => _$VideosToJson(this);
}
