import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_balance.g.dart';

@JsonSerializable(explicitToJson: true)

class AddBalance {
  bool? status;

  AddBalance({this.status});
 
    factory AddBalance.fromJson(Map<String, dynamic> json) => _$AddBalanceFromJson(json);
  Map<String, dynamic> toJson() => _$AddBalanceToJson(this);

}
