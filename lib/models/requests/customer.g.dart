// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    email: json['email'] as String,
    firstName: json['firstName'] as String,
    middleName: json['middleName'] as String,
    lastName: json['lastName'] as String,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    phoneNumber: json['phoneNumber'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
    };
