import 'package:persotrainer/models/requests/extra_attributes.dart';
import 'package:persotrainer/models/requests/schedule.dart';

import 'package:json_annotation/json_annotation.dart';

part 'items.g.dart';

@JsonSerializable()
class Items {
  String title;
  String description;
  String type;
  int inspectionPeriod;
  int quantity;
  ExtraAttributes extraAttributes;
  List<Schedule> schedule;

  Items(
      {this.title,
      this.description,
      this.type,
      this.inspectionPeriod,
      this.quantity,
      this.extraAttributes,
      this.schedule});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
