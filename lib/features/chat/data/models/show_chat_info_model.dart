class ShowChatInfoModel {
  Chat? chat;
  User? user;
  Request? request;
  bool? canSubmitOffer;

  ShowChatInfoModel({this.chat, this.user, this.request, this.canSubmitOffer});

  ShowChatInfoModel.fromJson(Map<String, dynamic> json) {
    chat = json['chat'] != null ? Chat.fromJson(json['chat']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    request =
        json['request'] != null ? Request.fromJson(json['request']) : null;
    canSubmitOffer = json['can_submit_offer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chat != null) {
      data['chat'] = chat!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (request != null) {
      data['request'] = request!.toJson();
    }
    data['can_submit_offer'] = canSubmitOffer;
    return data;
  }
}

class Chat {
  int? id;
  String? status;
  String? dealId;

  Chat({this.id, this.status, this.dealId});

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    dealId = json['deal_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['deal_id'] = dealId;
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

class Request {
  int? id;
  String? status;

  Request({this.id, this.status});

  Request.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    return data;
  }
}
