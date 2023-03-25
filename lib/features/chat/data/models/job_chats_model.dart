class JobChatsModel {
  Request? request;
  List<Chats>? chats;

  JobChatsModel({this.request, this.chats});

  JobChatsModel.fromJson(Map<String, dynamic> json) {
    request =
        json['request'] != null ? Request.fromJson(json['request']) : null;
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats!.add(Chats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (request != null) {
      data['request'] = request!.toJson();
    }
    if (chats != null) {
      data['chats'] = chats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Request {
  int? id;
  String? categoryId;
  String? name;

  Request({this.id, this.categoryId, this.name});

  Request.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    return data;
  }
}

class Chats {
  int? id;
  User? user;
  String? lastMessage;
  String? lastMessageTime;

  Chats({this.id, this.user, this.lastMessage, this.lastMessageTime});

  Chats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    lastMessage = json['last_message'];
    lastMessageTime = json['last_message_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['last_message'] = lastMessage;
    data['last_message_time'] = lastMessageTime;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? imageUrl;

  User({this.id, this.name, this.email, this.phone, this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image_url'] = imageUrl;
    return data;
  }
}
