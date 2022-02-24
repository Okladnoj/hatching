import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:hatching/data/repositories/analytics_repository.dart';
import 'package:hatching/domain/drawing/point.dart';

part 'drawing_state.dart';

class DrawingCubit extends Cubit<DrawingState> {
  AnalyticsRepository repository = Get.find<AnalyticsRepository>();

  DrawingCubit() : super(DrawingInitial());

  void endDrawing(List<FigurePoint> points) {
    emit(DrawingEnded());
  }

  void restartTest() {
    emit(DrawingInitial());
  }

  void confirmTest() {
    emit(DrawingConfirmed());
  }

  void cancelTest() {
    emit(DrawingCanceled());
  }
}
