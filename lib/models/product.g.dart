// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    name: json['name'] as String,
    desc: json['desc'] as String,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    price: json['price'] as int,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'desc': instance.desc,
      'tags': instance.tags,
      'price': instance.price,
    };
