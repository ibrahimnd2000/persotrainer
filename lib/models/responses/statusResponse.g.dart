// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statusResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    secured: json['secured'] as bool,
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'secured': instance.secured,
    };
