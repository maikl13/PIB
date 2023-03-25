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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    // data['is_read'] = this.isRead;
    data['attachment'] = this.attachment;
    data['time'] = this.time;
    return data;
  }
}
