import 'package:persotrainer/models/responses/itemResponse.dart';
import 'package:persotrainer/models/responses/partiesResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transactionResponse.g.dart';

@JsonSerializable()
class TransactionResponse {
  String creationDate;
  String currency;
  String description;
  int id;
  List<Items> items;
  List<Parties> parties;

  TransactionResponse(
      {this.creationDate,
      this.currency,
      this.description,
      this.id,
      this.items,
      this.parties});

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);
}
