// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextSpan2Bold extends TextSpan {
  /// TextSpan2Bold - family: Inter, weight:Bold, style:Normal, size: 12,
  TextSpan2Bold(String text) : super(text: text, style: textStyle);

  /// TextSpan2Bold with red color
  TextSpan2Bold.error(String text)
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.danger,
          ),
        );

  /// TextSpan2Bold with primary color
  TextSpan2Bold.primary(String text, {FontWeight? fontWeight})
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.primary,
            fontWeight: fontWeight,
          ),
        );

  static final textStyle = Un1qTextTheme.textSpan2Bold;
}
