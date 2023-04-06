class AcceptedOffersModel {
  int? id;
  String? description;
  String? status;
  String? userId;
  String? type;
  String? destinationFromLat;
  String? destinationFromLong;
  String? destinationToLat;
  String? destinationToLong;
  String? time;
  Category? category;
  User? user;

  AcceptedOffersModel(
      {this.id,
      this.description,
      this.status,
      this.userId,
      this.type,
      this.destinationFromLat,
      this.destinationFromLong,
      this.destinationToLat,
      this.destinationToLong,
      this.time,
      this.category,
      this.user});

  AcceptedOffersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    status = json['status'];
    userId = json['user_id'];
    type = json['type'];
    destinationFromLat = json['destination_from_lat'];
    destinationFromLong = json['destination_from_long'];
    destinationToLat = json['destination_to_lat'];
    destinationToLong = json['destination_to_long'];
    time = json['time'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['status'] = status;
    data['user_id'] = userId;
    data['type'] = type;
    data['destination_from_lat'] = destinationFromLat;
    data['destination_from_long'] = destinationFromLong;
    data['destination_to_lat'] = destinationToLat;
    data['destination_to_long'] = destinationToLong;
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
