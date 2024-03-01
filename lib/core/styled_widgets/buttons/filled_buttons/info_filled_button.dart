// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

import 'filled_button_base.dart';

class FilledInfoButton extends FilledButtonBase {
  const FilledInfoButton({
    required super.child,
    super.onPress,
    super.disabled,
    super.loading,
    super.padding,
    super.color = ThemeColors.supplementary,
    super.textColor = ThemeColors.supplementary,
    super.key,
  });

  FilledInfoButton.text({
    required super.label,
    Function()? super.onPress,
    super.disabled,
    super.loading,
    super.padding,
    super.height = null,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    super.color = ThemeColors.pastel,
    Color backgroundColor = ThemeColors.transparent,
    super.textColor = ThemeColors.supplementary,
    super.key,
  }) : super.text(
          width: null,
          textStyle: textStyle.copyWith(
            color: color,
            fontStyle: fontStyle,
            fontWeight: fontWeight,
            backgroundColor: backgroundColor,
          ),
        );

  static final textStyle = Un1qTextTheme.label2Regular;
}
