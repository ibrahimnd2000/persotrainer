import 'package:json_annotation/json_annotation.dart';

part 'extra_attributes.g.dart';

@JsonSerializable()
class ExtraAttributes {
  bool withContent;

  ExtraAttributes({this.withContent});

  factory ExtraAttributes.fromJson(Map<String, dynamic> json) =>
      _$ExtraAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraAttributesToJson(this);
}
