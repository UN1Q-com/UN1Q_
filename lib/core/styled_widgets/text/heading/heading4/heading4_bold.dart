// Flutter imports:
import 'package:un1que_new/core/styled_widgets/text/text_base.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextHeading4Bold extends TextBase {
  /// TextHeading4Bold - family: Inter, weight:Bold, style:Normal, size: 24

  TextHeading4Bold(
    super.text, {
    super.key,
    super.color,
    super.textAlign = null,
    super.overflow = null,
    super.padding = null,
    super.maxLines,
    super.softWrap,
    super.fontWeight = null,
    super.fontSize,
  });

  /// TextHeading4Bold with red color
  TextHeading4Bold.error(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
    super.fontWeight,
    super.fontSize,
  }) : super.error();

  /// TextHeading4Bold with primary color
  TextHeading4Bold.primary(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
    super.fontWeight,
    super.fontSize,
  }) : super.primary();

  @override
  final textStyle = Un1qTextTheme.heading4Bold;
}
