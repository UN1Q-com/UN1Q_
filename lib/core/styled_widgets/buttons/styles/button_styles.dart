// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/helpers/color_helpers.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class ButtonStyleGenerator {
  static ButtonStyle outlineButtonStyle({
    required Color color,
    required Color borderColor,
    required Color textColor,
    required Color disabledBorderColor,
    required Color disabledColor,
    BorderRadius? borderRadius,
    Color? disabledTextColor,
  }) {
    borderRadius ??= BorderRadius.circular(ThemeBorderRadius.md);

    return ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith((states) {
        return Un1qTextTheme.buttonBody2Bold;
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledColor;
        }
        return color;
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledTextColor;
        }
        return textColor;
      }),
      side: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return BorderSide(color: disabledBorderColor);
        }
        return BorderSide(color: borderColor);
      }),
      splashFactory: InkSplash.splashFactory,
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    );
  }

  static ButtonStyle buttonStyle({
    required Color backgroundColor,
    required Color disabledBackgroundColor,
    required Color textColor,
    Color? disabledTextColor,
    BorderRadius? borderRadius,
  }) {
    return ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith((states) {
        return Un1qTextTheme.buttonBody2Bold;
      }),
      enableFeedback: true,
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledBackgroundColor;
        }
        return backgroundColor;
      }),
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.pressed)
              ? ColorHelpers.darken(backgroundColor)
              : null;
        },
      ),
      splashFactory: InkSplash.splashFactory,
      foregroundColor: MaterialStateProperty.all(textColor),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeBorderRadius.md),
        ),
      ),
    );
  }
}
