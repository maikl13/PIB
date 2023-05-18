
import 'package:freezed_annotation/freezed_annotation.dart';

part 'slider_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SliderModel {
  int? id;
  String? name;
  String? image;
  String? link;

  SliderModel({this.id, this.name, this.image, this.link});

    factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);
  Map<String, dynamic> toJson() => _$SliderModelToJson(this);

}
