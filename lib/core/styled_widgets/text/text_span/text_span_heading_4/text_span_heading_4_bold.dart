// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextSpanHeading4Bold extends TextSpan {
  /// TextSpanHeading4Bold - family: Inter, weight:Bold, style:Normal, size: 12,
  TextSpanHeading4Bold(String text) : super(text: text, style: textStyle);

  /// TextSpanHeading4Bold with red color
  TextSpanHeading4Bold.error(String text)
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.danger,
          ),
        );

  /// TextSpanHeading4Bold with primary color
  TextSpanHeading4Bold.primary(String text, {FontWeight? fontWeight})
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.primary,
            fontWeight: fontWeight,
          ),
        );

  static final textStyle = Un1qTextTheme.heading4Bold;
}
