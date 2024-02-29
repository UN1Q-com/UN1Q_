// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/text/body/body1/body1_bold.dart';
import 'package:un1que_new/core/styled_widgets/text/body/body2/body2_regular.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

class CheckboxButton extends StatelessWidget {
  const CheckboxButton({
    required this.onChanged,
    required this.value,
    this.alignment = MainAxisAlignment.center,
    this.subtitle,
    this.title,
    super.key,
  }) : assert(title != null || subtitle != null);
  final MainAxisAlignment alignment;
  final void Function(bool?) onChanged;
  final String? subtitle;
  final String? title;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: subtitle == null || title == null
            ? EdgeInsets.zero
            : const EdgeInsets.only(
                bottom: ThemeSpacing.xxs,
                top: ThemeSpacing.xs,
              ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: alignment,
          crossAxisAlignment: subtitle == null || title == null
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: <Widget>[
            Transform.translate(
              offset: Offset(0, subtitle == null || title == null ? 0 : -12),
              child: Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ThemeBorderRadius.xs),
                ),
                value: value,
                onChanged: onChanged,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) TextBody1Bold.primary(title!),
                  if (subtitle != null)
                    TextBody2Regular.primary(
                      subtitle!,
                      softWrap: true,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
