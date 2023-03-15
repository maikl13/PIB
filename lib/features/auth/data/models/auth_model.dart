import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthModel {
  bool? status;
  String? token;
  User? user;

  AuthModel({this.status, this.token, this.user});
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'country_id')
  String? countryId;

  String? currency;
  String? token;
  String? status;
  @JsonKey(name: 'referrer_code')
  String? referrerCode;
  @JsonKey(name: 'account_verified')
  String? accountVerified;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.imageUrl,
      this.countryId,
      this.currency,
      this.token,
      this.status,
      this.referrerCode,
      this.accountVerified});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
