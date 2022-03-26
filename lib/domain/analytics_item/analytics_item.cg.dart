import 'package:json_annotation/json_annotation.dart';

part 'analytics_item.cg.g.dart';

@JsonSerializable()
class AnalyticsItem {
  @JsonKey()
  final String id;
  @JsonKey()
  final String name;
  @JsonKey()
  final String description;

  AnalyticsItem(this.id, this.name, this.description);
}
