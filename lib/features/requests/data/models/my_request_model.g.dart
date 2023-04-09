// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyRequestModel _$MyRequestModelFromJson(Map<String, dynamic> json) =>
    MyRequestModel(
      id: json['id'] as int?,
      description: json['description'] as String?,
      categoryId: json['category_id'] as String?,
      price: json['price'] as String?,
      location: json['location'] as String?,
      status: json['status'] as String?,
      userId: json['user_id'] as String?,
      createdAt: json['created_at'] as String?,
      time: json['time'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : Category.fromJson(json['user'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Videos.fromJson(e as Map<String, dynamic>))
          .toList(),
      offersCount: json['offers_count'] as int?,
      belongToCurrentUser: json['belong_to_current_user'] as bool?,
      submittedOffer: json['submitted_offer'] as bool?,
    )
      ..acceptedOfferID = json['accepted_offer_id'] as String?
      ..type = json['type'] as String?
      ..submittedOfferId = json['submitted_offer_id'] as int?;

Map<String, dynamic> _$MyRequestModelToJson(MyRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'category_id': instance.categoryId,
      'price': instance.price,
      'location': instance.location,
      'status': instance.status,
      'user_id': instance.userId,
      'accepted_offer_id': instance.acceptedOfferID,
      'type': instance.type,
      'created_at': instance.createdAt,
      'time': instance.time,
      'category': instance.category?.toJson(),
      'user': instance.user?.toJson(),
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'videos': instance.videos?.map((e) => e.toJson()).toList(),
      'offers_count': instance.offersCount,
      'belong_to_current_user': instance.belongToCurrentUser,
      'submitted_offer': instance.submittedOffer,
      'submitted_offer_id': instance.submittedOfferId,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      id: json['id'] as int?,
      attachmentUrl: json['attachment_url'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'id': instance.id,
      'attachment_url': instance.attachmentUrl,
    };

Videos _$VideosFromJson(Map<String, dynamic> json) => Videos(
      id: json['id'] as int?,
      attachmentUrl: json['attachmentUrl'] as String?,
    );

Map<String, dynamic> _$VideosToJson(Videos instance) => <String, dynamic>{
      'id': instance.id,
      'attachmentUrl': instance.attachmentUrl,
    };
