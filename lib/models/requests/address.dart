import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  String line1;
  String line2;
  String city;
  String state;
  String country;
  String postCode;

  Address(
      {this.line1,
        this.line2,
        this.city,
        this.state,
        this.country,
        this.postCode});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}