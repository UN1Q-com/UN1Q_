// Flutter imports:
import 'package:un1que_new/core/styled_widgets/text/text_base.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextHeading6Bold extends TextBase {
  /// TextHeading6Bold - family: Inter, weight:Bold, style:Normal, size: 16

  TextHeading6Bold(
    super.text, {
    super.key,
    super.color,
    super.textAlign = null,
    super.overflow = null,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  });

  /// TextHeading6Bold with red color
  TextHeading6Bold.error(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.error();

  /// TextHeading6Bold with primary color
  TextHeading6Bold.primary(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.primary();

  @override
  final textStyle = Un1qTextTheme.heading6Bold;
}
