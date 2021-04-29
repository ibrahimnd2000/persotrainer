import 'package:flutter/material.dart';
import 'package:persotrainer/models/meeting_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return const Color(0xFF0F8644);
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}
