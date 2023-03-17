// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => OfferModel(
      id: json['id'] as int?,
      price: json['price'] as String?,
      duration: json['duration'] as String?,
      description: json['description'] as String?,
      dealId: json['deal_id'] as String?,
      userId: json['user_id'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      time: json['time'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachments.fromJson(e as Map<String, dynamic>))
          .toList(),
      request: json['request'] == null
          ? null
          : Request.fromJson(json['request'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OfferModelToJson(OfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'duration': instance.duration,
      'description': instance.description,
      'deal_id': instance.dealId,
      'user_id': instance.userId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'time': instance.time,
      'user': instance.user?.toJson(),
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'request': instance.request?.toJson(),
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
    };

Attachments _$AttachmentsFromJson(Map<String, dynamic> json) => Attachments(
      id: json['id'] as int?,
      attachmentUrl: json['attachment_url'] as String?,
    );

Map<String, dynamic> _$AttachmentsToJson(Attachments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attachment_url': instance.attachmentUrl,
    };

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      id: json['id'] as int?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
    };
