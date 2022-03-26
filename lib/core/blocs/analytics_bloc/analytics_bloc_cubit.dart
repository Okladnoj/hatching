import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:hatching/data/repositories/analytics_repository.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';

part 'analytics_bloc_state.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  AnalyticsCubit() : super(AnalyticsLoading());

  AnalyticsRepository repository = Get.find<AnalyticsRepository>();

  void loadItems() async {
    emit(AnalyticsLoading());
    try {
      final items = await repository.fetchAnalytics();
      emit(AnalyticsLoaded(items));
    } catch (e) {
      emit(AnalyticsFailure(e.toString()));
    }
  }
}
