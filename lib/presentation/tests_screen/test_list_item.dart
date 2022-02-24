import 'package:flutter/material.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';
import 'package:hatching/utils/fonts.dart';
import 'package:hatching/utils/resourses.dart';
import 'package:lottie/lottie.dart';

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
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return SizedBox(
                          height: 60,
                          width: 60,
                          child: Lottie.asset(AppAnimations.loading),
                        );
                      }
                    },
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
                        style: AppFonts.textMedium(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        item.description,
                        style: AppFonts.textMedium(fontWeight: FontWeight.w500),
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
