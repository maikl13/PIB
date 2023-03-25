class ChatWithUserModel {
  bool? status;
  int? chatId;

  ChatWithUserModel({this.status, this.chatId});

  ChatWithUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    chatId = json['chat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['chat_id'] = chatId;
    return data;
  }
}
