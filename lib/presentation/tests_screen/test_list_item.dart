import 'package:flutter/material.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';

class SingleTestListItem extends StatelessWidget {
  final TestSingleItem item;
  final Function(TestSingleItem test) onTestPressed;

  const SingleTestListItem({
    Key? key,
    required this.item,
    required this.onTestPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () => onTestPressed(item),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    item.imageUrl,
                    height: 60,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        item.name,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        item.description,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _buildTrailingIcon()
          ],
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
