class UserInfoModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? imageUrl;
  String? token;
  String? status;
  String? fastRequests;
  String? latitude;
  String? longitude;
  String? accountVerified;

  UserInfoModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.imageUrl,
      this.token,
      this.status,
      this.fastRequests,
      this.latitude,
      this.longitude,
      this.accountVerified});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    imageUrl = json['image_url'];
    token = json['token'];
    status = json['status'];
    fastRequests = json['fast_requests'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    accountVerified = json['account_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image_url'] = imageUrl;
    data['token'] = token;
    data['status'] = status;
    data['fast_requests'] = fastRequests;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['account_verified'] = accountVerified;
    return data;
  }
}
