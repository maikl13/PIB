class AvailableFastRequestModel {
  int? id;
  String? status;
  String? destinationFromLat;
  String? destinationFromLong;
  String? description;
  dynamic distance;
  String? time;
  Category? category;
  User? user;

  AvailableFastRequestModel(
      {this.id,
      this.status,
      this.destinationFromLat,
      this.destinationFromLong,
      this.description,
      this.distance,
      this.time,
      this.category,
      this.user});

  AvailableFastRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    destinationFromLat = json['destination_from_lat'];
    destinationFromLong = json['destination_from_long'];
    description = json['description'];
    distance = json['distance'];
    time = json['time'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['destination_from_lat'] = destinationFromLat;
    data['destination_from_long'] = destinationFromLong;
    data['description'] = description;
    data['distance'] = distance;
    data['time'] = time;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? imageUrl;

  Category({this.id, this.name, this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? imageUrl;
  String? phone;

  User({this.id, this.name, this.imageUrl, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['phone'] = phone;
    return data;
  }
}
