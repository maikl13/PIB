// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      json['status'] as bool?,
      json['msg'] as String?,
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
    };
