// Flutter imports:
import 'package:un1que_new/core/styled_widgets/text/text_base.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextHeading5Bold extends TextBase {
  /// TextHeading5Bold - family: Inter, weight:Bold, style:Normal, size: 20

  TextHeading5Bold(
    super.text, {
    super.key,
    super.color,
    super.textAlign = null,
    super.overflow = null,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  });

  /// TextHeading5Bold with red color
  TextHeading5Bold.error(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.error();

  /// TextHeading5Bold with primary color
  TextHeading5Bold.primary(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.fontWeight,
    super.maxLines,
    super.softWrap,
  }) : super.primary();

  @override
  final textStyle = Un1qTextTheme.heading5Bold;
}
