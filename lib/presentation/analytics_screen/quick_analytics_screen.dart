import 'package:flutter/material.dart';

class QuickAnalyticsWidget extends StatelessWidget {
  const QuickAnalyticsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
            child: child,
          )
        ],
      ),
    );
  }
}
