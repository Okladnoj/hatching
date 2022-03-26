import 'package:hatching/data/repositories/analytics_repository.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';

class MockAnalyticsService implements AnalyticsRepository {
  @override
  Future<List<AnalyticsItem>> fetchAnalytics() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      AnalyticsItem("1"),
      AnalyticsItem("2"),
      AnalyticsItem("3"),
      AnalyticsItem("4"),
    ];
  }

  @override
  Future<AnalyticsItem> fetchAnalyticsDetails(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    return AnalyticsItem(id);
  }

  @override
  Future<void> sendAnalytics(AnalyticsItem report) async {
    return;
  }
}
