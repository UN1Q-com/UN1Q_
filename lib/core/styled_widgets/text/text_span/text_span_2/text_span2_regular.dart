// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextSpan2Regular extends TextSpan {
  /// TextSpan2Regular - family: Inter, weight:Regular, style:Normal, size: 12,
  TextSpan2Regular(String text) : super(text: text, style: textStyle);

  /// TextSpan2Regular with red color
  TextSpan2Regular.error(String text)
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.danger,
          ),
        );

  /// TextSpan2Regular with primary color
  TextSpan2Regular.primary(String text, {FontWeight? fontWeight})
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.primary,
            fontWeight: fontWeight,
          ),
        );

  static final textStyle = Un1qTextTheme.textSpan2Regular;
}
