class FastRequestCategory {
  int? id;
  String? name;
  String? imageUrl;
  String? description;

  FastRequestCategory({this.id, this.name, this.imageUrl, this.description});

  FastRequestCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['description'] = description;
    return data;
  }
}
