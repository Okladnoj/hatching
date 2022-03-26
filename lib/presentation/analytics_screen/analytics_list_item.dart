import 'package:flutter/material.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';

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
            itemsCount: widget.item.items.length,
          ),
          title: Text(
            widget.item.name,
            style: AppFonts.textMedium(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            widget.item.description,
            style: AppFonts.textMedium(fontWeight: FontWeight.w500),
          ),
          children: widget.item.items
              .cast<TestSingleItem>()
              .map((e) => SingleTestListItem(
                  item: e, onTestPressed: widget.onTestPressed))
              .toList(),
        ),
      ),
    );
  }
}
