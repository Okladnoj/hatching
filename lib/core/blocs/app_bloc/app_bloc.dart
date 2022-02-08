import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hatching/domain/app_screen_type/app_screen_type.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppStateScreen(AppScreenType.tests)) {
    on<AppSwitchToScreen>(onAppSwitchScreen);
  }

  FutureOr<void> onAppSwitchScreen(event, emit) {
    AppScreenType screenType = event.type;
    emit(AppStateScreen(screenType));
  }
}
