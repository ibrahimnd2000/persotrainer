// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fees _$FeesFromJson(Map<String, dynamic> json) {
  return Fees(
    amount: json['amount'] as String,
    payerCustomer: json['payerCustomer'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$FeesToJson(Fees instance) => <String, dynamic>{
      'amount': instance.amount,
      'payerCustomer': instance.payerCustomer,
      'type': instance.type,
    };
