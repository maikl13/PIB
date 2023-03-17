// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdModel _$AdModelFromJson(Map<String, dynamic> json) => AdModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      ads: (json['ads'] as List<dynamic>?)
          ?.map((e) => Ads.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdModelToJson(AdModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ads': instance.ads?.map((e) => e.toJson()).toList(),
    };

Ads _$AdsFromJson(Map<String, dynamic> json) => Ads(
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      content: json['content'] as String?,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      location: json['location'] as String?,
      skilId: json['skill_id'] as String?,
      adCategoryId: json['ad_category_id'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      skillName: json['skill_name'] as String?,
      categoryName: json['category_name'] as String?,
    );

Map<String, dynamic> _$AdsToJson(Ads instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'content': instance.content,
      'phone': instance.phone,
      'website': instance.website,
      'location': instance.location,
      'skill_id': instance.skilId,
      'ad_category_id': instance.adCategoryId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'skill_name': instance.skillName,
      'category_name': instance.categoryName,
    };
