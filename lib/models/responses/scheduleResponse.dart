import 'package:persotrainer/models/responses/statusResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scheduleResponse.g.dart';

@JsonSerializable()
class Schedule {
  String amount;
  String beneficiaryCustomer;
  String payerCustomer;
  Status status;

  Schedule(
      {this.amount, this.beneficiaryCustomer, this.payerCustomer, this.status});

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
