// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    title: json['title'] as String,
    desc: json['desc'] as String,
    includeProductsWithSimilarTags:
        json['includeProductsWithSimilarTags'] as bool,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'title': instance.title,
      'desc': instance.desc,
      'includeProductsWithSimilarTags': instance.includeProductsWithSimilarTags,
      'tags': instance.tags,
    };
