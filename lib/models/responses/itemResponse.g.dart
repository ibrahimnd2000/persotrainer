// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    description: json['description'] as String,
    extraAttributes: json['extraAttributes'] == null
        ? null
        : ExtraAttributes.fromJson(
            json['extraAttributes'] as Map<String, dynamic>),
    fees: (json['fees'] as List)
        ?.map(
            (e) => e == null ? null : Fees.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as int,
    inspectionPeriod: json['inspectionPeriod'] as int,
    quantity: json['quantity'] as int,
    schedule: (json['schedule'] as List)
        ?.map((e) =>
            e == null ? null : Schedule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
    title: json['title'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'description': instance.description,
      'extraAttributes': instance.extraAttributes,
      'fees': instance.fees,
      'id': instance.id,
      'inspectionPeriod': instance.inspectionPeriod,
      'quantity': instance.quantity,
      'schedule': instance.schedule,
      'status': instance.status,
      'title': instance.title,
      'type': instance.type,
    };
