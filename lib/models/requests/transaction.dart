import 'package:persotrainer/models/requests/items.dart';
import 'package:persotrainer/models/requests/parties.dart';

import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  List<Parties> parties;
  String currency;
  String description;
  List<Items> items;

  Transaction({this.parties, this.currency, this.description, this.items});

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
