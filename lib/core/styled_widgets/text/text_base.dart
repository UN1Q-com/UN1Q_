// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

abstract class TextBase extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final FontStyle? fontStyle;
  final double? fontSize;

  const TextBase(
    this.text, {
    super.key,
    this.color,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.softWrap,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.w400,
    this.padding = const EdgeInsets.all(0),
    this.fontStyle,
    this.fontSize,
  });

  abstract final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle.copyWith(
        color: color,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  const TextBase.error(
    this.text, {
    super.key,
    this.padding = const EdgeInsets.all(0),
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.fontWeight,
    this.fontSize,
  })  : color = ThemeColors.danger,
        fontStyle = FontStyle.normal;

  const TextBase.primary(
    this.text, {
    super.key,
    this.padding = const EdgeInsets.all(0),
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.fontWeight,
    this.fontSize,
  })  : color = ThemeColors.primary,
        fontStyle = FontStyle.normal;

  const TextBase.grey(
    this.text, {
    super.key,
    this.padding = const EdgeInsets.all(0),
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.fontWeight,
    this.fontSize,
  })  : color = ThemeColors.darkGrey_300,
        fontStyle = FontStyle.normal;
}
