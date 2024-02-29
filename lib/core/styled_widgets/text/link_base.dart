// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

/// An URL link TextSpan that contain an URL link that can be used as a
/// working URL link text when using it in a [Text.rich] or lower
/// level [RichText] widget.
abstract class LinkBase extends StatelessWidget {
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
  final Function() onTap;

  const LinkBase(
    this.text,
    this.onTap, {
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
    return InkWell(
      onTap: onTap,
      child: Text(
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
      ),
    );
  }

  const LinkBase.error(
    this.text,
    this.onTap, {
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

  const LinkBase.primary(
    this.text,
    this.onTap, {
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
}
