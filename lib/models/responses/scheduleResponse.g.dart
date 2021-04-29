// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduleResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    amount: json['amount'] as String,
    beneficiaryCustomer: json['beneficiaryCustomer'] as String,
    payerCustomer: json['payerCustomer'] as String,
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'amount': instance.amount,
      'beneficiaryCustomer': instance.beneficiaryCustomer,
      'payerCustomer': instance.payerCustomer,
      'status': instance.status,
    };
