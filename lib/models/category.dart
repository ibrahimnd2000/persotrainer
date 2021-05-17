import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  String title;
  String desc;
  bool includeProductsWithSimilarTags;
  List<String> tags;

  Category(
      {this.title, this.desc, this.includeProductsWithSimilarTags, this.tags});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
