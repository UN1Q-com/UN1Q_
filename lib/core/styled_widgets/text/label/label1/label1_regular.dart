// Flutter imports:
import 'package:un1que_new/core/styled_widgets/text/text_base.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextLabel1Regular extends TextBase {
  /// TextLabel1Regular - family: Inter, weight:Regular, style:Normal, size: 12,

  TextLabel1Regular(
    super.text, {
    super.key,
    super.color,
    super.textAlign = null,
    super.overflow = null,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  });

  /// TextLabel1Regular with red color
  TextLabel1Regular.error(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.error();

  /// TextLabel1Regular with primary color
  TextLabel1Regular.primary(
    super.text, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.primary();

  /// TextLabel1Regular with darkGrey_400 color
  TextLabel1Regular.grey(
    super.text, {
    super.key,
    super.textAlign = null,
    super.overflow = null,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super(
          color: ThemeColors.darkGrey_400,
        );

  @override
  final textStyle = Un1qTextTheme.label1Regular;
}
