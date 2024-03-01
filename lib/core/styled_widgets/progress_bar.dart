// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

class ProgressBar extends StatelessWidget {
  const ProgressBar({required this.index, required this.total, super.key});
  final int index;
  final int total;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (int i = 0; i < total; i++) {
      children.add(
        Expanded(
          child: Container(
            color:
                i < index ? ThemeColors.lightGreen : ThemeColors.darkGrey_100,
            height: 6,
          ),
        ),
      );
      if (i < index) children.add(const SizedBox(width: 2));
    }

    return Container(
      color: ThemeColors.darkGrey_100,
      child: Row(children: children),
    );
  }
}
