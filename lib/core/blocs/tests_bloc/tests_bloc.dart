import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:hatching/data/repositories/test_repository.dart';
import 'package:hatching/domain/test_item/test_item.dart';

part 'tests_event.dart';

part 'tests_state.dart';

class TestsBloc extends Bloc<TestsEvent, TestsState> {
  final BaseTestsRepository _repository = Get.find<BaseTestsRepository>();

  final List<BaseTestItem> _tests = [];

  TestsBloc() : super(TestsLoading()) {
    on<TestsLoad>(_onTestsLoad);
    on<TestsOpen>(_onTestsOpen);
  }

  FutureOr<void> _onTestsLoad(event, emit) async {
    emit(TestsLoading());
    var result = await _repository.fetchItems();
    _tests.clear();
    _tests.addAll(result);
    emit(TestsLoaded(result));
  }

  FutureOr<void> _onTestsOpen(TestsOpen event, emit) async {
    emit(TestsLoading());
    var result = await _repository.fetchTestDetailsById(event.test.id);
    emit(TestsLoadedSingle(result));
    emit(TestsLoaded(_tests));
  }
}
