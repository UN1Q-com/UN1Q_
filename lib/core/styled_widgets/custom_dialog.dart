// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

class CustomDialog extends StatelessWidget {
  const CustomDialog({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Dialog(
        surfaceTintColor: ThemeColors.transparent,
        child: Padding(
          padding: ScreenPadding.horizontal,
          child: SingleChildScrollView(child: child),
        ),
      ),
    );
  }
}
