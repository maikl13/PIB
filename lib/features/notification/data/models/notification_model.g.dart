// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifiticationModel _$NotifiticationModelFromJson(Map<String, dynamic> json) =>
    NotifiticationModel(
      id: json['id'] as int?,
      content: json['content'] as String?,
      isRead: json['is_read'] as int?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$NotifiticationModelToJson(
        NotifiticationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'is_read': instance.isRead,
      'created_at': instance.createdAt,
    };
