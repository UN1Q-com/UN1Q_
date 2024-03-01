// Flutter imports:
import 'package:un1que_new/core/styled_widgets/form_fields/text_input_field/base/text_input_base.dart';

// Project imports:

class PrimaryTextInputField extends TextInputBase {
  const PrimaryTextInputField({
    super.key,
    super.label,
    super.showRequired,
    super.validator,
    super.obscureText,
    super.suffixIcon,
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
    super.enabled,
  });
}
