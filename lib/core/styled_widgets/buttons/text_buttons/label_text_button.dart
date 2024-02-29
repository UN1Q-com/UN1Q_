// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/text/link_base.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class LabelTextButton extends LinkBase {
  /// LabelTextButton - family: Inter, weight:Regular, style:Normal, size: 12,

  LabelTextButton({
    required String text,
    required Function() onTap,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    EdgeInsetsGeometry? padding,
    int? maxLines,
    bool? softWrap,
    super.key,
  }) : super(
          text,
          onTap,
          color: color,
          textAlign: textAlign,
          overflow: overflow,
          padding: padding,
          maxLines: maxLines,
          softWrap: softWrap,
        );

  /// LabelTextButton with red color
  LabelTextButton.error({
    required String text,
    required Function() onTap,
    TextAlign? textAlign,
    TextOverflow? overflow,
    EdgeInsetsGeometry? padding,
    int? maxLines,
    bool? softWrap,
    super.key,
  }) : super.error(
          text,
          onTap,
          textAlign: textAlign,
          overflow: overflow,
          padding: padding,
          maxLines: maxLines,
          softWrap: softWrap,
        );

  /// LabelTextButton with primary color
  LabelTextButton.primary({
    required String text,
    required Function() onTap,
    super.key,
    TextAlign? textAlign,
    TextOverflow? overflow,
    EdgeInsetsGeometry? padding,
    int? maxLines,
    bool? softWrap,
  }) : super.primary(
          text,
          onTap,
          textAlign: textAlign,
          overflow: overflow,
          padding: padding,
          maxLines: maxLines,
          softWrap: softWrap,
        );

  @override
  final textStyle = Un1qTextTheme.label2Bold;
}
