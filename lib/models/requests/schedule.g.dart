// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    amount: json['amount'] as int,
    payerCustomer: json['payerCustomer'] as String,
    beneficiaryCustomer: json['beneficiaryCustomer'] as String,
  );
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'amount': instance.amount,
      'payerCustomer': instance.payerCustomer,
      'beneficiaryCustomer': instance.beneficiaryCustomer,
    };
