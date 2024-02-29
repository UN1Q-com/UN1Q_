// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/text/body/body1/body1_regular.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

class RadioButton extends StatelessWidget {
  const RadioButton({
    required this.groupValue,
    required this.onChanged,
    required this.value,
    this.enabled = true,
    this.subtitle,
    this.subtitleWidget,
    this.title,
    this.titleWidget,
    super.key,
  }) : assert(title != null ||
            subtitle != null ||
            titleWidget != null ||
            subtitleWidget != null);
  final bool enabled;
  final String groupValue;
  final void Function(String?) onChanged;
  final String? subtitle;
  final Widget? subtitleWidget;
  final String? title;
  final Widget? titleWidget;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: InkWell(
        onTap: enabled ? () => onChanged(value) : null,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: (subtitle == null && subtitleWidget == null) ||
                    (title == null && subtitleWidget == null)
                ? 0
                : ThemeSpacing.sm,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: subtitle == null && subtitleWidget == null
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: <Widget>[
              Transform.translate(
                offset: Offset(
                  0,
                  subtitle == null && subtitleWidget == null ? 0 : -12,
                ),
                child: Radio<String>(
                  value: value,
                  activeColor: ThemeColors.secondary,
                  groupValue: groupValue,
                  onChanged: enabled ? onChanged : null,
                ),
              ),
              const SizedBox(width: ThemeSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      TextBody1Regular.primary(
                        title!,
                        fontWeight: FontWeight.w600,
                      ),
                    if (titleWidget != null) titleWidget!,
                    if (subtitleWidget != null) subtitleWidget!,
                    if (subtitle != null) TextBody1Regular.primary(subtitle!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
