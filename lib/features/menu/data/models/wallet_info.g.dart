// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletInfo _$WalletInfoFromJson(Map<String, dynamic> json) => WalletInfo(
      totalBalance: json['total_balance'] as int?,
      availableBalance: json['available_balance'] as int?,
      holdBalance: json['hold_balance'] as int?,
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transactions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WalletInfoToJson(WalletInfo instance) =>
    <String, dynamic>{
      'total_balance': instance.totalBalance,
      'available_balance': instance.availableBalance,
      'hold_balance': instance.holdBalance,
      'transactions': instance.transactions?.map((e) => e.toJson()).toList(),
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
      id: json['id'] as int?,
      amount: json['amount'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'type': instance.type,
      'status': instance.status,
      'time': instance.time,
    };
