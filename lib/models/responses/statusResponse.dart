import 'package:json_annotation/json_annotation.dart';

part 'statusResponse.g.dart';

@JsonSerializable()
class Status {
  bool secured;

  Status({this.secured});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
