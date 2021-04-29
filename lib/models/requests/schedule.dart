import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable()
class Schedule {
  int amount;
  String payerCustomer;
  String beneficiaryCustomer;

  Schedule({this.amount, this.payerCustomer, this.beneficiaryCustomer});

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
