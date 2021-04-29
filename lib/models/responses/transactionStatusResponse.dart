import 'package:json_annotation/json_annotation.dart';

part 'transactionStatusResponse.g.dart';

@JsonSerializable()
class Status {
  bool accepted;
  bool acceptedReturned;
  bool received;
  bool receivedReturned;
  bool rejected;
  bool rejectedReturned;
  bool shipped;
  bool shippedReturned;

  Status(
      {this.accepted,
      this.acceptedReturned,
      this.received,
      this.receivedReturned,
      this.rejected,
      this.rejectedReturned,
      this.shipped,
      this.shippedReturned});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
