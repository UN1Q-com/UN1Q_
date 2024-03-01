// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

abstract class FieldLabelBase extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final String? label;
  final bool showRequired;

  const FieldLabelBase({
    required this.child,
    required this.label,
    this.enabled = true,
    this.showRequired = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (label?.isEmpty ?? true) return child;

    final hasLabel = label?.isEmpty ?? true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (hasLabel) Container(),
            if (!hasLabel)
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      style: labelStyle,
                      text: label,
                    ),
                    if (showRequired) TextSpan(text: '*', style: astericsStyle),
                  ],
                ),
              ),
          ],
        ),
        child
      ],
    );
  }

  TextStyle get labelStyle {
    return Un1qTextTheme.body2Regular.copyWith(
      color: ThemeColors.darkGrey_900,
    );
  }

  TextStyle get astericsStyle {
    return Un1qTextTheme.body2Regular.copyWith(color: ThemeColors.danger);
  }
}
