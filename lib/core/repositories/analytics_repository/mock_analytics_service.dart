import 'package:hatching/data/repositories/analytics_repository.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';

class MockAnalyticsService implements AnalyticsRepository {
  @override
  Future<List<AnalyticsItem>> fetchAnalytics() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      AnalyticsItem("1", "Test 1", "Test 1 desc"),
      AnalyticsItem("2", "Test 2", "Test 2 desc"),
      AnalyticsItem("3", "Test 3", "Test 3 desc"),
      AnalyticsItem("4", "Test 4", "Test 4 desc"),
    ];
  }

  @override
  Future<AnalyticsItem> fetchAnalyticsDetails(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    return AnalyticsItem(id, "Test 1", "Test 1 desc");
  }

  @override
  Future<void> sendAnalytics(AnalyticsItem report) async {
    return;
  }
}
