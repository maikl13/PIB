class ToggleModel {
  bool? status;
  String? action;

  ToggleModel({this.status, this.action});

  ToggleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['action'] = action;
    return data;
  }
}
