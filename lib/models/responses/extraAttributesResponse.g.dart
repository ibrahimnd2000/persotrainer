// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extraAttributesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtraAttributes _$ExtraAttributesFromJson(Map<String, dynamic> json) {
  return ExtraAttributes(
    concierge: json['concierge'] as bool,
    withContent: json['withContent'] as bool,
  );
}

Map<String, dynamic> _$ExtraAttributesToJson(ExtraAttributes instance) =>
    <String, dynamic>{
      'concierge': instance.concierge,
      'withContent': instance.withContent,
    };
