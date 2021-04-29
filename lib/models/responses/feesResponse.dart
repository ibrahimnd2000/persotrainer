import 'package:json_annotation/json_annotation.dart';

part 'feesResponse.g.dart';

@JsonSerializable()
class Fees {
  String amount;
  String payerCustomer;
  String type;

  Fees({this.amount, this.payerCustomer, this.type});

  factory Fees.fromJson(Map<String, dynamic> json) => _$FeesFromJson(json);

  Map<String, dynamic> toJson() => _$FeesToJson(this);
}
