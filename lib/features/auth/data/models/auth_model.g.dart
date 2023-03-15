// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      status: json['status'] as bool?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
      'user': instance.user?.toJson(),
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      imageUrl: json['image_url'] as String?,
      countryId: json['country_id'] as String?,
      currency: json['currency'] as String?,
      token: json['token'] as String?,
      status: json['status'] as String?,
      referrerCode: json['referrer_code'] as String?,
      accountVerified: json['account_verified'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image_url': instance.imageUrl,
      'country_id': instance.countryId,
      'currency': instance.currency,
      'token': instance.token,
      'status': instance.status,
      'referrer_code': instance.referrerCode,
      'account_verified': instance.accountVerified,
    };
