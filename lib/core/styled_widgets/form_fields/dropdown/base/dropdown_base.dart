// Flutter imports:
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/form_fields/dropdown/styles/input_decoration_style_generator.dart';
import 'package:un1que_new/core/styled_widgets/form_fields/field_labels/primary/primary_field_label.dart';
import 'package:un1que_new/core/styled_widgets/text/body/body2/body2_bold.dart';
import 'package:un1que_new/core/styled_widgets/text/body/body2/body2_regular.dart';
import 'package:un1que_new/core/styled_widgets/text/label/label2/label2_regular.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Package imports:;

// Project imports:

class DropdownBase<T> extends StatefulWidget {
  final String? label;
  final String? hintText;
  final AutovalidateMode? autoValidateMode;
  final EdgeInsetsGeometry padding;
  final bool showRequired;
  final bool enabled;
  final double? width;
  final double? height;
  final void Function(T?)? onChanged;
  final Widget? suffixIcon;
  final String? helpText;
  final String? counterText;
  final String? tooltipMessage;
  final bool? isCapital;
  final EdgeInsets? buttonPadding;
  final TextStyle? textStyle;
  final List<T> items;
  final T? selectedItem;
  final String Function(T)? itemAsString;
  final String? Function(T?)? validator;
  final bool showFloatingLabel;

  const DropdownBase({
    required this.items,
    this.selectedItem,
    this.suffixIcon,
    this.label,
    this.hintText,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.padding = const EdgeInsets.only(top: ThemeSpacing.xs),
    this.showRequired = false,
    this.enabled = true,
    this.width = double.infinity,
    this.height = ThemeButtonHeight.sm,
    this.onChanged,
    this.helpText,
    this.counterText = '',
    this.tooltipMessage,
    this.isCapital = false,
    this.buttonPadding = ThemeButtonPadding.sm,
    this.textStyle,
    this.itemAsString,
    this.validator,
    this.showFloatingLabel = false,
    super.key,
  }) : assert(T == String || itemAsString != null);

  @override
  State<DropdownBase<T>> createState() => _DropdownBaseState<T>();
}

class _DropdownBaseState<T> extends State<DropdownBase<T>> {
  bool validatorCalled = false;

  TextStyle get hintStyle {
    return Un1qTextTheme.body2Regular.copyWith(
      color: ThemeColors.darkGrey_300,
    );
  }

  InputDecorationTheme get decorationStyle {
    return TextInputStyleGenerator.outlinedInputDecorationStyle;
  }

  TextStyle get defaultTextStyle {
    return Un1qTextTheme.body2Regular.copyWith(
      color: ThemeColors.darkGrey_700,
      fontWeight: FontWeight.w500,
    );
  }

  InputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(ThemeBorderRadius.sm),
      borderSide: BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryFieldLabel(
      label: widget.label,
      showRequired: widget.showRequired,
      child: Padding(
        padding: widget.label == null
            ? const EdgeInsets.only(top: ThemeSpacing.zero)
            : widget.padding,
        child: SizedBox(
          height: validatorCalled || widget.showFloatingLabel
              ? null
              : ThemeButtonHeight.sm,
          width: widget.width,
          child: DropdownSearch<T>(
            dropdownButtonProps: const DropdownButtonProps(
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                label: widget.hintText == null ||
                        (!widget.showFloatingLabel &&
                            (widget.hintText == null ||
                                widget.selectedItem != null))
                    ? null
                    : TextLabel2Regular.grey(
                        widget.hintText!,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                border: InputBorder.none,
                fillColor: ThemeColors.grey_50,
                filled: true,
                floatingLabelBehavior: widget.showFloatingLabel
                    ? null
                    : FloatingLabelBehavior.never,
              ),
            ),
            popupProps: PopupProps.menu(
              menuProps: const MenuProps(),
              containerBuilder: (context, popupWidget) {
                return Container(
                  color: ThemeColors.grey_50,
                  child: popupWidget,
                );
              },
              itemBuilder: (context, item, isSelected) {
                final itemString = item is String
                    ? item
                    : widget.itemAsString != null
                        ? widget.itemAsString!(item)
                        : item.toString();
                final lastItem = item == widget.items.last;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      if (isSelected) TextBody2Bold.primary(itemString),
                      if (!isSelected) TextBody2Regular.primary(itemString),
                      const SizedBox(height: 16),
                      if (!lastItem)
                        const Divider(
                          color: ThemeColors.darkGrey_100,
                          height: 0,
                        ),
                    ],
                  ),
                );
              },
              constraints: BoxConstraints(
                maxHeight: ThemeDropdownHeight.height(widget.items.length),
              ),
              showSelectedItems: true,
            ),
            items: widget.items,
            onChanged: widget.onChanged,
            selectedItem: widget.selectedItem,
            itemAsString: widget.itemAsString,
            compareFn: (item1, item2) => item1 == item2,
            validator: (value) {
              setState(() {
                validatorCalled = true;
              });
              if (widget.validator != null) return widget.validator!(value);
              return null;
            },
          ),
        ),
      ),
    );
  }
}
