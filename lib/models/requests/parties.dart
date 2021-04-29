import 'package:json_annotation/json_annotation.dart';

part 'parties.g.dart';

@JsonSerializable()
class Parties {
  String role;
  String customer;

  Parties({this.role, this.customer});

  factory Parties.fromJson(Map<String, dynamic> json) =>
      _$PartiesFromJson(json);

  Map<String, dynamic> toJson() => _$PartiesToJson(this);
}
