// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    title: json['title'] as String,
    description: json['description'] as String,
    type: json['type'] as String,
    inspectionPeriod: json['inspectionPeriod'] as int,
    quantity: json['quantity'] as int,
    extraAttributes: json['extraAttributes'] == null
        ? null
        : ExtraAttributes.fromJson(
            json['extraAttributes'] as Map<String, dynamic>),
    schedule: (json['schedule'] as List)
        ?.map((e) =>
            e == null ? null : Schedule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'inspectionPeriod': instance.inspectionPeriod,
      'quantity': instance.quantity,
      'extraAttributes': instance.extraAttributes,
      'schedule': instance.schedule,
    };
