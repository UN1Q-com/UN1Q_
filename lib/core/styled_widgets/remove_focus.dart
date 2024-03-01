// Flutter imports:
import 'package:flutter/material.dart';

class RemoveFocus extends StatelessWidget {
  final Widget child;
  const RemoveFocus({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}
