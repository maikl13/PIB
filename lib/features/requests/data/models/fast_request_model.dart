class FastRequestModel {
  int? id;
  String? status;
  String? destinationFromLat;
  String? destinationFromLong;
  String? destinationToLat;
  String? destinationToLong;
  String? time;
  Category? category;
  DeliveryMan? deliveryMan;

  FastRequestModel(
      {this.id,
      this.status,
      this.destinationFromLat,
      this.destinationFromLong,
      this.destinationToLat,
      this.destinationToLong,
      this.time,
      this.category,
      this.deliveryMan});

  FastRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    destinationFromLat = json['destination_from_lat'];
    destinationFromLong = json['destination_from_long'];
    destinationToLat = json['destination_to_lat'];
    destinationToLong = json['destination_to_long'];
    time = json['time'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    deliveryMan = json['delivery_man'] != null
        ? DeliveryMan.fromJson(json['delivery_man'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['destination_from_lat'] = destinationFromLat;
    data['destination_from_long'] = destinationFromLong;
    data['destination_to_lat'] = destinationToLat;
    data['destination_to_long'] = destinationToLong;
    data['time'] = time;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (deliveryMan != null) {
      data['delivery_man'] = deliveryMan!.toJson();
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

class DeliveryMan {
  int? id;
  String? name;
  String? imageUrl;
  String? latitude;
  String? longitude;
  String? phone;
  // double? distance;

  DeliveryMan(
      {this.id,
      this.name,
      this.imageUrl,
      this.latitude,
      this.longitude,
      this.phone,
      });

  DeliveryMan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
    // distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['phone'] = phone;
    // data['distance'] = distance;
    return data;
  }
}
