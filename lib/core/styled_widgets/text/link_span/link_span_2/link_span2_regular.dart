// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/text/link_span_base.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class LinkSpan2Regular extends LinkTextSpan {
  /// LinkSpan2Regular - family: Inter, weight:FontWeight.w600, style:Normal,
  /// size: 14,
  LinkSpan2Regular({
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

  /// LinkSpan2Regular with red color
  LinkSpan2Regular.error({required super.onTap, required super.text})
      : super(
          style: textStyle.copyWith(color: ThemeColors.danger),
        );

  /// LinkSpan2Regular with primary color
  LinkSpan2Regular.primary({required super.onTap, required super.text})
      : super(
          style: textStyle.copyWith(color: ThemeColors.primary),
        );

  static final textStyle = Un1qTextTheme.textSpan2Regular;
}
