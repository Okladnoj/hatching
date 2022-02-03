import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatching/core/logger/logger.dart';
import 'package:hatching/utils/resourses.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
        onTap: (value) => Logger.m(value.toString()),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(ProjectIcons.testsIcon),
            label: "tests".tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(ProjectIcons.analyticsIcon),
            label: "analytics".tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(ProjectIcons.settingsIcon),
            label: "settings".tr(),
          ),
        ],
      ),
    );
  }
}
