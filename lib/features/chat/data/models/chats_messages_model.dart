class ChatMessagesModel {
  int? id;
  String? message;
  String? senderId;
  String? receiverId;
  // String? isRead;
  String? attachment;
  String? time;

  ChatMessagesModel(
      {this.id,
      this.message,
      this.senderId,
      this.receiverId,
      // this.isRead,
      this.attachment,
      this.time});

  ChatMessagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    // isRead = json['is_read'];
    attachment = json['attachment'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    // data['is_read'] = this.isRead;
    data['attachment'] = attachment;
    data['time'] = time;
    return data;
  }
}
