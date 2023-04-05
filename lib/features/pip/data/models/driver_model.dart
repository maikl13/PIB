class DriverModel {
  int? id;
  String? destinationFromLat;
  String? destinationFromLong;
  String? destinationToLat;
  String? destinationToLong;
  String? status;
  DeliveryMan? deliveryMan;

  DriverModel(
      {this.id,
      this.destinationFromLat,
      this.destinationFromLong,
      this.destinationToLat,
      this.destinationToLong,
      this.status,
      this.deliveryMan});

  DriverModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    destinationFromLat = json['destination_from_lat'];
    destinationFromLong = json['destination_from_long'];
    destinationToLat = json['destination_to_lat'];
    destinationToLong = json['destination_to_long'];
    status = json['status'];
    deliveryMan = json['delivery_man'] != null
        ? DeliveryMan.fromJson(json['delivery_man'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['destination_from_lat'] = destinationFromLat;
    data['destination_from_long'] = destinationFromLong;
    data['destination_to_lat'] = destinationToLat;
    data['destination_to_long'] = destinationToLong;
    data['status'] = status;
    if (deliveryMan != null) {
      data['delivery_man'] = deliveryMan!.toJson();
    }
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
  dynamic distance;

  DeliveryMan(
      {this.id,
      this.name,
      this.imageUrl,
      this.latitude,
      this.longitude,
      this.phone,
      this.distance});

  DeliveryMan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['phone'] = phone;
    data['distance'] = distance;
    return data;
  }
}
