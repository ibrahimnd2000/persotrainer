// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactionStatusResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    accepted: json['accepted'] as bool,
    acceptedReturned: json['acceptedReturned'] as bool,
    received: json['received'] as bool,
    receivedReturned: json['receivedReturned'] as bool,
    rejected: json['rejected'] as bool,
    rejectedReturned: json['rejectedReturned'] as bool,
    shipped: json['shipped'] as bool,
    shippedReturned: json['shippedReturned'] as bool,
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'accepted': instance.accepted,
      'acceptedReturned': instance.acceptedReturned,
      'received': instance.received,
      'receivedReturned': instance.receivedReturned,
      'rejected': instance.rejected,
      'rejectedReturned': instance.rejectedReturned,
      'shipped': instance.shipped,
      'shippedReturned': instance.shippedReturned,
    };
