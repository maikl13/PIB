// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillModel _$SkillModelFromJson(Map<String, dynamic> json) => SkillModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      imageUrl: json['image_url'] as String?,
      enabled: json['enabled'] as int?,
    );

Map<String, dynamic> _$SkillModelToJson(SkillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'enabled': instance.enabled,
    };
