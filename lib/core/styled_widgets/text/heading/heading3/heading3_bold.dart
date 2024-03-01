// Flutter imports:
import 'package:un1que_new/core/styled_widgets/text/text_base.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextHeading3Bold extends TextBase {
  /// TextHeading3Bold - family: Inter, weight:Bold, style:Normal, size: 28

  TextHeading3Bold(
    super.text, {
    super.key,
    super.color,
    super.textAlign = null,
    super.overflow = null,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  });

  /// TextHeading3Bold with red color
  TextHeading3Bold.error(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.error();

  /// TextHeading3Bold with primary color
  TextHeading3Bold.primary(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.primary();

  @override
  final textStyle = Un1qTextTheme.heading3Bold;
}
