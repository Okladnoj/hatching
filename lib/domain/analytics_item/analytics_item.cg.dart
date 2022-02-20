import 'package:json_annotation/json_annotation.dart';

part 'analytics_item.cg.g.dart';

@JsonSerializable()
class AnalyticsReport {
  @JsonKey()
  final String id;

  AnalyticsReport(this.id);
}
