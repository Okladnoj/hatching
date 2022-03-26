import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:hatching/data/repositories/analytics_repository.dart';
import 'package:hatching/domain/analytics_component/analytics_component.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';
import 'package:hatching/domain/drawing/point.dart';

part 'drawing_state.dart';

class DrawingCubit extends Cubit<DrawingState> {
  DrawingCubit() : super(DrawingInitial());

  AnalyticsRepository repository = Get.find<AnalyticsRepository>();
  AnalyticsComponent analytics = AnalyticsComponent();

  void endDrawing(List<FigurePoint> points) {
    emit(DrawingEnded());
  }

  void restartTest() {
    emit(DrawingInitial());
  }

  void confirmTest() async {
    final item = analytics.performAnalytics();

    await repository.sendAnalytics(item);
    emit(DrawingConfirmed(item));
  }

  void cancelTest() {
    emit(DrawingCanceled());
  }
}
