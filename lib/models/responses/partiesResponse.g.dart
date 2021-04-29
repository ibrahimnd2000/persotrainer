// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partiesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parties _$PartiesFromJson(Map<String, dynamic> json) {
  return Parties(
    agreed: json['agreed'] as bool,
    customer: json['customer'] as String,
    role: json['role'] as String,
  );
}

Map<String, dynamic> _$PartiesToJson(Parties instance) => <String, dynamic>{
      'agreed': instance.agreed,
      'customer': instance.customer,
      'role': instance.role,
    };
