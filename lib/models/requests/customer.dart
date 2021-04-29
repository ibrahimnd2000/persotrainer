import 'package:json_annotation/json_annotation.dart';
import 'package:persotrainer/models/requests/address.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  String email;
  String firstName;
  String middleName;
  String lastName;
  Address address;
  String phoneNumber;

  Customer(
      {this.email,
      this.firstName,
      this.middleName,
      this.lastName,
      this.address,
      this.phoneNumber});

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
