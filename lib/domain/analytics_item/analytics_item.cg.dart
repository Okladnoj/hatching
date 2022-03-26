import 'package:json_annotation/json_annotation.dart';

part 'analytics_item.cg.g.dart';

@JsonSerializable()
class AnalyticsItem {
  @JsonKey()
  final String id;

  AnalyticsItem(this.id);
}
