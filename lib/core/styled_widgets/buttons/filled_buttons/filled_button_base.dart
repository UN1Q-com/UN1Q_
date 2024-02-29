// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/buttons/styles/button_styles.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

abstract class FilledButtonBase extends StatelessWidget {
  final void Function()? onPress;
  final Widget child;
  final bool disabled;
  final bool loading;
  final EdgeInsets padding;
  final double? width;
  final double? height;
  final Color color;
  final Color textColor;

  ButtonStyle get style {
    return ButtonStyleGenerator.buttonStyle(
      backgroundColor: color,
      disabledBackgroundColor: disabledColor,
      disabledTextColor: disabledTextColor,
      textColor: textColor,
    );
  }

  Color get disabledColor => color.withOpacity(0.2);
  Color get disabledTextColor => textColor.withOpacity(0.2);
  Color get overlayTextColor => const Color(0XFF00E0CE);

  BorderRadius? get borderRadius {
    return BorderRadius.circular(ThemeBorderRadius.md);
  }

  const FilledButtonBase({
    required this.child,
    required this.color,
    required this.textColor,
    super.key,
    this.onPress,
    this.disabled = false,
    this.loading = false,
    this.padding = const EdgeInsets.all(0),
    this.width = double.infinity,
    this.height = ThemeButtonHeight.md,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: width,
        height: height,
        child: TextButton(
          style: style,
          onPressed: (disabled || loading)
              ? null
              : () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  onPress?.call();
                },
          child: loading ? const CircularProgressIndicator.adaptive() : child,
        ),
      ),
    );
  }

  FilledButtonBase.text({
    required this.color,
    required this.textColor,
    required String label,
    super.key,
    this.onPress,
    this.disabled = false,
    this.loading = false,
    this.padding = const EdgeInsets.all(0),
    this.width = double.infinity,
    this.height = ThemeButtonHeight.md,
    TextStyle? textStyle,
  }) : child = FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: padding,
            child: Text(
              label,
              style: textStyle == null
                  ? TextStyle(color: textColor)
                  : textStyle.copyWith(color: textColor),
            ),
          ),
        );

  FilledButtonBase.icon({
    required this.color,
    required this.textColor,
    required Color disabledColor,
    required IconData? icon,
    super.key,
    this.onPress,
    this.disabled = false,
    this.loading = false,
    this.padding = const EdgeInsets.all(0),
    String? text,
    IconData? suffix,
    Color iconColor = ThemeColors.white,
    this.width = double.infinity,
    this.height = ThemeButtonHeight.md,
    double separatorWidth = ThemeSpacing.xs,
    MainAxisAlignment? alignment,
  }) : child = Row(
          mainAxisAlignment: alignment ?? MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: (disabled || loading || onPress == null)
                  ? disabledColor
                  : iconColor,
            ),
            if (text != null) SizedBox(width: separatorWidth),
            if (text != null) Text(text),
            if (suffix != null)
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    suffix,
                    color: (disabled || loading || onPress == null)
                        ? disabledColor
                        : iconColor,
                  ),
                ),
              ),
          ],
        );
}
