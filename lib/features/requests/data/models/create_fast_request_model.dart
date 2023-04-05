class CreateFastRequestModel {
  bool? status;
  int? requestId;

  CreateFastRequestModel({this.status, this.requestId});

  CreateFastRequestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['request_id'] = requestId;
    return data;
  }
}
