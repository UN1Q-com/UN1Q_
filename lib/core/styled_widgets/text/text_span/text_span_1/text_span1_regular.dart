// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextSpan1Regular extends TextSpan {
  /// TextSpan1Regular - family: Inter, weight:Regular, style:Normal, size: 12,
  TextSpan1Regular(String text, {Color? color})
      : super(
          style: textStyle.copyWith(color: color),
          text: text,
        );

  /// TextSpan1Regular with red color
  TextSpan1Regular.error(String text)
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.danger,
          ),
        );

  /// TextSpan1Regular with primary color
  TextSpan1Regular.primary(String text, {FontWeight? fontWeight})
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.primary,
            fontWeight: fontWeight,
          ),
        );

  static final textStyle = Un1qTextTheme.textSpan1Regular;
}
