class UnreadNotificationCount {
  int? unreadNotifications;

  UnreadNotificationCount({this.unreadNotifications});

  UnreadNotificationCount.fromJson(Map<String, dynamic> json) {
    unreadNotifications = json['unread_notifications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unread_notifications'] = unreadNotifications;
    return data;
  }
}
