// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextInputStyleGenerator {
  static InputDecorationTheme get outlinedInputDecorationStyle {
    return InputDecorationTheme(
      fillColor: ThemeColors.grey_50,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ThemeColors.secondary,
        ),
      ),
      filled: true,
      hintStyle: Un1qTextTheme.body2Regular,
    );
  }
}
