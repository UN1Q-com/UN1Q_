// Flutter imports:
import 'package:un1que_new/core/styled_widgets/text/link_base.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class Link1Label extends LinkBase {
  /// Link1Label - family: Inter, weight:Regular, style:Normal, size: 12,

  Link1Label(
    super.text,
    super.onTap, {
    super.key,
    super.color,
    super.textAlign = null,
    super.overflow = null,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  });

  /// Link1Label with red color
  Link1Label.error(
    super.text,
    super.onTap, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.error();

  /// Link1Label with primary color
  Link1Label.primary(
    super.text,
    super.onTap, {
    super.key,
    super.textAlign,
    super.overflow,
    super.padding = null,
    super.maxLines,
    super.softWrap,
  }) : super.primary();

  @override
  final textStyle = Un1qTextTheme.label2Regular;
}
