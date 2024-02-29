// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/buttons/filled_buttons/filled_button_base.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

class FilledPrimaryButton extends FilledButtonBase {
  const FilledPrimaryButton({
    required super.child,
    super.onPress,
    super.disabled,
    super.loading,
    super.padding,
    super.color = ThemeColors.secondary,
    super.textColor = ThemeColors.black,
    super.key,
  });

  FilledPrimaryButton.text({
    required super.label,
    Function()? super.onPress,
    super.disabled,
    super.loading,
    super.padding,
    super.width,
    double super.height,
    super.color = ThemeColors.secondary,
    super.textColor = ThemeColors.black,
    super.key,
  }) : super.text();

  FilledPrimaryButton.icon({
    required IconData super.icon,
    Function()? super.onPress,
    super.disabled,
    super.loading,
    super.padding,
    super.width,
    double super.height,
    super.iconColor = ThemeColors.primary,
    super.color = ThemeColors.secondary,
    super.textColor = ThemeColors.black,
    super.key,
  }) : super.icon(
          disabledColor: iconColor.withOpacity(0.2),
        );
}
