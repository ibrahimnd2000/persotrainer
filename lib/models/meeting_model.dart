import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meeting_model.g.dart';

@JsonSerializable()
class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  String background;
  bool isAllDay;

  factory Meeting.fromJson(Map<String, dynamic> json) =>
      _$MeetingFromJson(json);

  Map<String, dynamic> toJson() => _$MeetingToJson(this);
}
