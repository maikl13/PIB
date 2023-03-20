class HiringChatModel {
  int? id;
  String? categoryId;
  String? name;
  List<Images>? images;
  int? chatCount;

  HiringChatModel(
      {this.id, this.categoryId, this.name, this.images, this.chatCount});

  HiringChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    chatCount = json['chat_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['chat_count'] = chatCount;
    return data;
  }
}

class Images {
  int? id;
  String? attachmentUrl;

  Images({this.id, this.attachmentUrl});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attachmentUrl = json['attachment_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['attachment_url'] = attachmentUrl;
    return data;
  }
}
