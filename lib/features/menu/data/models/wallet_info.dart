
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_info.g.dart';

@JsonSerializable(explicitToJson: true)
class WalletInfo {
  @JsonKey(name: 'total_balance')
  int? totalBalance;
  @JsonKey(name: 'available_balance')
  int? availableBalance;
  @JsonKey(name: 'hold_balance')
  int? holdBalance;
  List<Transactions>? transactions;

  WalletInfo(
      {this.totalBalance,
      this.availableBalance,
      this.holdBalance,
      this.transactions});

  factory WalletInfo.fromJson(Map<String, dynamic> json) => _$WalletInfoFromJson(json);
  Map<String, dynamic> toJson() => _$WalletInfoToJson(this);


  }

@JsonSerializable(explicitToJson: true)

class Transactions {
  int? id;
  String? amount;
  String? type;
  String? status;
  String? time;

  Transactions({this.id, this.amount, this.type, this.status, this.time});

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}
