import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_model.g.dart';
@JsonSerializable(explicitToJson: true)

class OfferModel {
  int? id;
  String? price;
  String? duration;
  String? description;
  @JsonKey(name: 'deal_id')
  String? dealId;
  @JsonKey(name: 'user_id')
  String? userId;
  String? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? time;
  User? user;
  List<Attachments>? attachments;
  Request? request;

  OfferModel(
      {this.id,
      this.price,
      this.duration,
      this.description,
      this.dealId,
      this.userId,
      this.status,
      this.createdAt,
      this.time,
      this.user,
      this.attachments,
      this.request});

        factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
  Map<String, dynamic> toJson() => _$OfferModelToJson(this);


}
@JsonSerializable(explicitToJson: true)
class User {
  int? id;
  String? name;
  @JsonKey(name: 'image_url')
  String? imageUrl;

  User({this.id, this.name, this.imageUrl});
           




        factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);



}
@JsonSerializable(explicitToJson: true)

class Attachments {
  int? id;
  @JsonKey(name: 'attachment_url')
  String? attachmentUrl;

  Attachments({this.id, this.attachmentUrl});

        factory Attachments.fromJson(Map<String, dynamic> json) =>
      _$AttachmentsFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentsToJson(this);

  
}
@JsonSerializable(explicitToJson: true)

class Request {
  int? id;
  String? category;

  Request({this.id, this.category});

       factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);
  Map<String, dynamic> toJson() => _$RequestToJson(this);

 
}
