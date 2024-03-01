// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/text/text_base.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextLabel1Bold extends TextBase {
  /// TextLabel1Bold - family: Inter, weight:700, style:Normal, size: 12,

  TextLabel1Bold(
    super.text, {
    super.key,
    super.color,
    super.textAlign = null,
    super.overflow = null,
    super.padding = null,
    super.maxLines,
    super.softWrap,
    super.fontWeight = null,
  });

  /// TextLabel1Bold with red color
  TextLabel1Bold.error(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
    super.fontWeight,
  }) : super.error();

  /// TextLabel1Bold with primary color
  TextLabel1Bold.primary(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.primary(
          fontWeight: FontWeight.w400,
        );

  /// TextLabel1Bold with darkGrey_400 color
  TextLabel1Bold.grey(
    super.text, {
    super.key,
    super.textAlign = null,
    super.overflow = null,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super(
          color: ThemeColors.darkGrey_400,
          fontWeight: FontWeight.w400,
        );

  @override
  final textStyle = Un1qTextTheme.label1Bold;
}
