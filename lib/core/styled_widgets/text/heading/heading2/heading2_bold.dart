// Flutter imports:
import 'package:un1que_new/core/styled_widgets/text/text_base.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextHeading2Bold extends TextBase {
  /// TextHeading2Bold - family: Inter, weight:Bold, style:Normal, size: 32

  TextHeading2Bold(
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

  /// TextHeading2Bold with red color
  TextHeading2Bold.error(
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

  /// TextHeading2Bold with primary color
  TextHeading2Bold.primary(
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
  final textStyle = Un1qTextTheme.heading2Bold;
}
