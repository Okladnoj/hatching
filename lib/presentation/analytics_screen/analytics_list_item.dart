import 'package:flutter/material.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';
import 'package:hatching/presentation/tests_screen/test_list_item.dart';
import 'package:hatching/presentation/tests_screen/test_list_trailing.dart';
import 'package:hatching/utils/fonts.dart';

class AnalyticsListItem extends StatefulWidget {
  final AnalyticsItem item;

  const AnalyticsListItem({Key? key, required this.item}) : super(key: key);

  @override
  State<AnalyticsListItem> createState() => _AnalyticsListItemState();
}

class _AnalyticsListItemState extends State<AnalyticsListItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ExpansionTile(
          childrenPadding: const EdgeInsets.only(left: 10),
          backgroundColor: Colors.grey[200],
          onExpansionChanged: (expanded) =>
              setState(() => _expanded = expanded),
          trailing: TestCardTrailing(
            expanded: _expanded,
            itemsCount: 0,
          ),
          title: Text(
            widget.item.name,
            style: AppFonts.textMedium(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            widget.item.description,
            style: AppFonts.textMedium(fontWeight: FontWeight.w500),
          ),
          children: const [AnalyticsListItemContent()],
        ),
      ),
    );
  }

  ClipRRect _buildTrailingIcon() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: const Material(
        color: Colors.black12,
        child: InkWell(
          child: Icon(
            Icons.chevron_right,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}

class AnalyticsListItemContent extends StatelessWidget {
  const AnalyticsListItemContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
