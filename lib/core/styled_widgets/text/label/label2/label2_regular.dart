// Flutter imports:
import 'package:un1que_new/core/styled_widgets/text/text_base.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextLabel2Regular extends TextBase {
  /// TextLabel2Regular - family: Inter, weight:Regular, style:Normal, size: 12,

  TextLabel2Regular(
    super.text, {
    super.key,
    super.color,
    super.textAlign = null,
    super.overflow = null,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  });

  /// TextLabel2Regular with red color
  TextLabel2Regular.error(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.error();

  /// TextLabel2Regular with primary color
  TextLabel2Regular.primary(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.primary();

  /// TextLabel1Regular with darkGrey_400 color
  TextLabel2Regular.grey(
    super.text, {
    super.fontSize,
    super.fontWeight,
    super.maxLines,
    super.overflow,
    super.padding = null,
    super.softWrap,
    super.textAlign,
    super.key,
  }) : super.grey();

  @override
  final textStyle = Un1qTextTheme.label2Regular;
}
