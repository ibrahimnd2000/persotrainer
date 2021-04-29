import 'package:persotrainer/models/responses/transactionStatusResponse.dart';
import 'package:persotrainer/models/responses/extraAttributesResponse.dart';
import 'package:persotrainer/models/responses/feesResponse.dart';
import 'package:persotrainer/models/responses/scheduleResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'itemResponse.g.dart';

@JsonSerializable()
class Items {
  String description;
  ExtraAttributes extraAttributes;
  List<Fees> fees;
  int id;
  int inspectionPeriod;
  int quantity;
  List<Schedule> schedule;
  Status status;
  String title;
  String type;

  Items(
      {this.description,
      this.extraAttributes,
      this.fees,
      this.id,
      this.inspectionPeriod,
      this.quantity,
      this.schedule,
      this.status,
      this.title,
      this.type});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
