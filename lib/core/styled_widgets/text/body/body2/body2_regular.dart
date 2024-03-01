// Flutter imports:
import 'package:un1que_new/core/styled_widgets/text/text_base.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

class TextBody2Regular extends TextBase {
  /// TextBody2Regular - family: Inter, weight:Regular, style:Normal, size: 16

  TextBody2Regular(
    super.text, {
    super.key,
    super.color,
    super.textAlign = null,
    super.overflow = null,
    super.padding = null,
    super.maxLines,
    super.softWrap,
    super.fontStyle,
  });

  /// TextBody2Regular with red color
  TextBody2Regular.error(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.error();

  /// TextBody2Regular with primary color
  TextBody2Regular.primary(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.primary();

  @override
  final textStyle = Un1qTextTheme.body2Regular;
}
