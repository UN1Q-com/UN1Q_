// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/text/link_span_base.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

import '../../../../theme/constants.dart';

// Project imports:

class LinkSpan1Bold extends LinkTextSpan {
  /// LinkSpan1Bold - family: Inter, weight:FontWeight.w600, style:Normal,
  /// size: 14,
  LinkSpan1Bold({
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

  /// LinkSpan1Bold with red color
  LinkSpan1Bold.error({required super.onTap, required super.text})
      : super(
          style: textStyle.copyWith(color: ThemeColors.danger),
        );

  /// LinkSpan1Bold with primary color
  LinkSpan1Bold.primary({required super.onTap, required super.text})
      : super(
          style: textStyle.copyWith(color: ThemeColors.primary),
        );

  static final textStyle = Un1qTextTheme.textSpan1Bold;
}
