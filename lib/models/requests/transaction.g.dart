// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    parties: (json['parties'] as List)
        ?.map((e) =>
            e == null ? null : Parties.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    currency: json['currency'] as String,
    description: json['description'] as String,
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'parties': instance.parties,
      'currency': instance.currency,
      'description': instance.description,
      'items': instance.items,
    };
