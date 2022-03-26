import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';
import 'package:hatching/domain/drawing/point.dart';

class AnalyticsComponent {
  final List<FigurePoint> _initial = [];
  final List<FigurePoint> _target = [];

  void init(List<FigurePoint> initial, List<FigurePoint> target) {
    _initial
      ..clear()
      ..addAll(initial);
    _target
      ..clear()
      ..addAll(target);
  }

  AnalyticsItem performAnalytics() {
    return AnalyticsItem("1");
  }
}
