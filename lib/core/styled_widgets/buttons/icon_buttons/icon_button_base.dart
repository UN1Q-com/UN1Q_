// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/buttons/styles/button_styles.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

abstract class IconButtonBase extends StatelessWidget {
  final void Function()? onPress;
  final IconData icon;
  final bool disabled;
  final bool loading;
  final EdgeInsets padding;
  final double? width;
  final double? height;

  ButtonStyle get style {
    return ButtonStyleGenerator.buttonStyle(
      backgroundColor: color,
      disabledBackgroundColor: disabledColor,
      disabledTextColor: disabledIconColor,
      textColor: iconColor,
    );
  }

  final Color color;
  Color get disabledColor => color.withOpacity(0.1);
  final Color iconColor;
  Color get disabledIconColor => iconColor.withOpacity(0.1);
  Color get overlayIconColor => const Color(0XFF00E0CE);

  BorderRadius? get borderRadius {
    return BorderRadius.circular(ThemeBorderRadius.md);
  }

  const IconButtonBase({
    required this.icon,
    required this.iconColor,
    required this.color,
    super.key,
    this.onPress,
    this.disabled = false,
    this.loading = false,
    this.padding = const EdgeInsets.all(0),
    this.width = double.infinity,
    this.height = ThemeButtonHeight.md,
  });

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Padding(
            padding: EdgeInsets.all(ThemeSpacing.sm1),
            child: CircularProgressIndicator(),
          )
        : IconButton(
            icon: Icon(icon, color: disabled ? disabledIconColor : iconColor),
            color: disabled ? disabledColor : color,
            style: style,
            onPressed: disabled
                ? null
                : () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    onPress?.call();
                  },
          );
  }
}
