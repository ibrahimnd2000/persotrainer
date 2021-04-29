// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parties _$PartiesFromJson(Map<String, dynamic> json) {
  return Parties(
    role: json['role'] as String,
    customer: json['customer'] as String,
  );
}

Map<String, dynamic> _$PartiesToJson(Parties instance) => <String, dynamic>{
      'role': instance.role,
      'customer': instance.customer,
    };
