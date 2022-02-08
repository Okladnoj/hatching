import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatching/core/blocs/app_bloc/app_bloc.dart';
import 'package:hatching/core/logger/logger.dart';
import 'package:hatching/domain/app_screen_type/app_screen_type.dart';
import 'package:hatching/presentation/analytics_screen/analytics_screen.dart';
import 'package:hatching/presentation/settings_screen/settings_screen.dart';
import 'package:hatching/presentation/tests_screen/tests_screen.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildBodyContent(),
            buildFloatingSearchBar(context),
          ],
        ),
      ),
    );
  }

  Column _buildBodyContent() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 70),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  if (state is AppStateScreen) {
                    if (state.screenType == AppScreenType.tests) {
                      return const TestsScreen();
                    } else if (state.screenType == AppScreenType.analytics) {
                      return const AnalyticsScreen();
                    } else if (state.screenType == AppScreenType.settings) {
                      return const SettingsScreen();
                    }
                    return Center(child: Text(state.screenType.toString()));
                  }
                  return Center(
                    child: Text(state.toString()),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is AppStateScreen) {
          return NavigationBar(
            selectedIndex: state.appScreenIndex,
            onDestinationSelected: (value) => _onScreenChange(value, context),
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.fact_check_outlined),
                label: "tests".tr(),
              ),
              NavigationDestination(
                icon: const Icon(Icons.insights_outlined),
                label: "analytics".tr(),
              ),
              NavigationDestination(
                icon: const Icon(Icons.settings_outlined),
                label: "settings".tr(),
              ),
            ],
          );
        }
        return Text(state.toString());
      },
    );
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'search'.tr(),
      elevation: 0,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 300),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 100),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      backdropColor: Colors.transparent,
      borderRadius: BorderRadius.circular(15),
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: Colors.accents.map((color) {
              return Container(height: 112, color: color);
            }).toList(),
          ),
        );
      },
    );
  }

  void _onScreenChange(int screen, BuildContext context) {
    BlocProvider.of<AppBloc>(context).add(
      AppSwitchToScreen(AppScreenExtension.fromIndex(screen)),
    );
    Logger.m(screen.toString());
  }
}
