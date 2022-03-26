import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';

abstract class AnalyticsRepository {
  Future<void> sendAnalytics(AnalyticsItem report);

  Future<List<AnalyticsItem>> fetchAnalytics();

  Future<AnalyticsItem> fetchAnalyticsDetails(String id);
}
