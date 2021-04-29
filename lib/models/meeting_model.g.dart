// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meeting _$MeetingFromJson(Map<String, dynamic> json) {
  return Meeting(
    json['eventName'] as String,
    json['from'] == null ? null : DateTime.parse(json['from'] as String),
    json['to'] == null ? null : DateTime.parse(json['to'] as String),
    json['background'] as String,
    json['isAllDay'] as bool,
  );
}

Map<String, dynamic> _$MeetingToJson(Meeting instance) => <String, dynamic>{
      'eventName': instance.eventName,
      'from': instance.from?.toIso8601String(),
      'to': instance.to?.toIso8601String(),
      'background': instance.background,
      'isAllDay': instance.isAllDay,
    };
