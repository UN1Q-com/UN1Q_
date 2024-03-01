// Flutter imports:
import 'package:un1que_new/core/styled_widgets/form_fields/dropdown/base/dropdown_base.dart';

// Project imports:

// Project imports:

class PrimaryDropdownField<T> extends DropdownBase<T> {
  const PrimaryDropdownField({
    required super.items,
    super.selectedItem,
    super.key,
    super.label,
    super.showRequired,
    super.suffixIcon,
    super.hintText,
    super.width = null,
    super.onChanged,
    super.height = null,
    super.buttonPadding = null,
    super.itemAsString,
    super.validator,
    super.showFloatingLabel,
  });
}
