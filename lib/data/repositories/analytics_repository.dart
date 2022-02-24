import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';

abstract class AnalyticsRepository {
  Future<void> sendAnalytics(AnalyticsReport report);

  Future<List<AnalyticsReport>> fetchAnalytics();

  Future<AnalyticsReport> fetchAnalyticsDetails(String id);
}
