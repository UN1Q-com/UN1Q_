// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextSpan1Bold extends TextSpan {
  /// TextSpan1Bold - family: Inter, weight:Bold, style:Normal, size: 12,
  TextSpan1Bold(String text) : super(text: text, style: textStyle);

  /// TextSpan1Bold with red color
  TextSpan1Bold.error(String text)
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.danger,
          ),
        );

  /// TextSpan1Bold with primary color
  TextSpan1Bold.primary(String text, {FontWeight? fontWeight})
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.primary,
            fontWeight: fontWeight,
          ),
        );

  static final textStyle = Un1qTextTheme.textSpan1Bold;
}
