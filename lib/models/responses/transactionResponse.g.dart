// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactionResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) {
  return TransactionResponse(
    creationDate: json['creationDate'] as String,
    currency: json['currency'] as String,
    description: json['description'] as String,
    id: json['id'] as int,
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    parties: (json['parties'] as List)
        ?.map((e) =>
            e == null ? null : Parties.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TransactionResponseToJson(
        TransactionResponse instance) =>
    <String, dynamic>{
      'creationDate': instance.creationDate,
      'currency': instance.currency,
      'description': instance.description,
      'id': instance.id,
      'items': instance.items,
      'parties': instance.parties,
    };
