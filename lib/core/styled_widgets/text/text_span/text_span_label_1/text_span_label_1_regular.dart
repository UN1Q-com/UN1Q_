// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextSpanLabel1Regular extends TextSpan {
  /// TextSpanLabel1Regular - family: Inter, weight:Regular, style:Normal,
  /// size: 12,
  TextSpanLabel1Regular(String text)
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.darkGrey_400,
          ),
        );

  /// TextSpanLabel1Regular with red color
  TextSpanLabel1Regular.error(String text)
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.danger,
          ),
        );

  /// TextSpanLabel1Regular with primary color
  TextSpanLabel1Regular.primary(String text)
      : super(
          text: text,
          style: textStyle.copyWith(
            color: ThemeColors.primary,
          ),
        );

  static final textStyle = Un1qTextTheme.label2Regular;
}
