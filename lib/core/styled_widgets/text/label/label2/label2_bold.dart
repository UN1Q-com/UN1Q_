// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/text/text_base.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextLabel2Bold extends TextBase {
  /// TextLabel2Bold - family: Inter, weight:700, style:Normal, size: 12,

  TextLabel2Bold(
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

  /// TextLabel2Bold with red color
  TextLabel2Bold.error(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
    super.fontWeight,
  }) : super.error();

  /// TextLabel2Bold with primary color
  TextLabel2Bold.primary(
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

  @override
  final textStyle = Un1qTextTheme.label2Bold;
}
