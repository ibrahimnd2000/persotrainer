import 'package:json_annotation/json_annotation.dart';

part 'partiesResponse.g.dart';

@JsonSerializable()
class Parties {
  bool agreed;
  String customer;
  String role;

  Parties({this.agreed, this.customer, this.role});

  factory Parties.fromJson(Map<String, dynamic> json) =>
      _$PartiesFromJson(json);

  Map<String, dynamic> toJson() => _$PartiesToJson(this);
}
