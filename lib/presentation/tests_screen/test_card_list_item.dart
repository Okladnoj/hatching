import 'package:flutter/material.dart';
import 'package:hatching/domain/test_item/test_item.dart';
import 'package:hatching/presentation/tests_screen/test_list_item.dart';

class TestCardItem extends StatefulWidget {
  final TestMultipleItems item;
  final Function(TestSingleItem test) onTestPressed;

  const TestCardItem(
      {Key? key, required this.item, required this.onTestPressed})
      : super(key: key);

  @override
  _TestCardItemState createState() => _TestCardItemState();
}

class _TestCardItemState extends State<TestCardItem> {
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
            style: Theme.of(context).textTheme.subtitle2,
          ),
          subtitle: Text(
            widget.item.description,
            style: Theme.of(context).textTheme.subtitle1,
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

class TestCardTrailing extends StatefulWidget {
  final bool expanded;
  final int itemsCount;

  const TestCardTrailing({
    Key? key,
    required this.expanded,
    required this.itemsCount,
  }) : super(key: key);

  @override
  _TestCardTrailingState createState() => _TestCardTrailingState();
}

class _TestCardTrailingState extends State<TestCardTrailing> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 25,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xffceefe6),
            ),
            child: Center(
                child: Text(
              widget.itemsCount.toString(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: const Color(0xff4e6e66)),
            )),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              width: 25,
              height: 25,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 24,
                width: 24,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: _buildIcon(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Icon _buildIcon() {
    if (widget.expanded) {
      return Icon(
        Icons.keyboard_arrow_up_outlined,
        color: Colors.black45,
        key: UniqueKey(),
      );
    } else {
      return Icon(
        Icons.keyboard_arrow_right_outlined,
        color: Colors.black45,
        key: UniqueKey(),
      );
    }
  }
}
