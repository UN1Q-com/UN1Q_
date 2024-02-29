// Flutter imports:
import 'package:un1que_new/core/styled_widgets/buttons/icon_buttons/icon_button_base.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

class StyledIconButton extends IconButtonBase {
  const StyledIconButton({
    required super.icon,
    required super.color,
    super.onPress,
    super.disabled,
    super.iconColor = ThemeColors.primary,
    super.loading,
    super.padding,
    super.key,
  });
}
