// Flutter imports:
import 'package:un1que_new/core/styled_widgets/form_fields/text_input_field/base/text_input_base.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';
// Project imports:

class PrimaryHeaderTextInputField extends TextInputBase {
  PrimaryHeaderTextInputField({
    super.key,
    super.label,
    super.showRequired,
    super.validator,
    super.obscureText,
    super.suffixIcon,
    super.suffixIconConstraints,
    super.hintText,
    super.initialValue,
    super.maxLines = 1,
    super.minLines = 1,
    super.keyboardType,
    super.width = null,
    void Function(String)? super.onChanged,
    super.height = null,
    super.buttonPadding = null,
    super.inputFormatters,
    super.controller,
  }) : super(
          hintStyle: Un1qTextTheme.heading4Bold.copyWith(
            color: ThemeColors.darkGrey_300,
          ),
          textStyle: Un1qTextTheme.heading4Bold,
        );
}
