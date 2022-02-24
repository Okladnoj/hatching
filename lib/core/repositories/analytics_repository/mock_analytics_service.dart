import 'package:hatching/data/repositories/analytics_repository.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';

class MockAnalyticsService implements AnalyticsRepository {
  @override
  Future<List<AnalyticsReport>> fetchAnalytics() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      AnalyticsReport("1"),
      AnalyticsReport("2"),
      AnalyticsReport("3"),
      AnalyticsReport("4"),
    ];
  }

  @override
  Future<AnalyticsReport> fetchAnalyticsDetails(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    return AnalyticsReport(id);
  }

  @override
  Future<void> sendAnalytics(AnalyticsReport report) async {
    return;
  }
}
