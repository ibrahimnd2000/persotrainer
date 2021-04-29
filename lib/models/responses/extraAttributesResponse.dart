import 'package:json_annotation/json_annotation.dart';

part 'extraAttributesResponse.g.dart';

@JsonSerializable()
class ExtraAttributes {
  bool concierge;
  bool withContent;

  ExtraAttributes({this.concierge, this.withContent});

  factory ExtraAttributes.fromJson(Map<String, dynamic> json) =>
      _$ExtraAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraAttributesToJson(this);
}
