import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';
import 'package:hatching/utils/fonts.dart';

class QuickAnalyticsWidget extends StatelessWidget {
  final AnalyticsItem analytics;

  const QuickAnalyticsWidget({Key? key, required this.analytics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("results".tr(), style: AppFonts.title1()),
        ...List.generate(
            5,
            (index) => const Chip(
                  label: Text("abcd"),
                  avatar: Icon(Icons.analytics),
                ))
      ],
    );
  }
}

class QuickAnalyticsDecorator extends StatelessWidget {
  final QuickAnalyticsWidget child;

  const QuickAnalyticsDecorator({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Wrap(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
            child: child,
          )
        ],
      ),
    );
  }
}
