// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/text/link_span_base.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class LinkSpan2Bold extends LinkTextSpan {
  /// LinkSpan2Bold - family: Inter, weight:FontWeight.w600, style:Normal,
  /// size: 14,
  LinkSpan2Bold({
    required super.onTap,
    required super.text,
    Color? color,
    FontWeight? fontWeight,
  }) : super(
          style: textStyle.copyWith(
            fontWeight: fontWeight,
            color: color,
          ),
        );

  /// LinkSpan2Bold with red color
  LinkSpan2Bold.error({required super.onTap, required super.text})
      : super(
          style: textStyle.copyWith(color: ThemeColors.danger),
        );

  /// LinkSpan2Bold with primary color
  LinkSpan2Bold.primary({required super.onTap, required super.text})
      : super(
          style: textStyle.copyWith(color: ThemeColors.primary),
        );

  static final textStyle = Un1qTextTheme.textSpan2Bold;
}
