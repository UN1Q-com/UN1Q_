// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:un1que_new/core/styled_widgets/form_fields/dropdown/styles/input_decoration_style_generator.dart';
import 'package:un1que_new/core/styled_widgets/form_fields/field_labels/primary/primary_field_label.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/text_theme.dart';

// Project imports:

class TextInputBase extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool autoFocus;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry padding;
  final bool showRequired;
  final bool enabled;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final Color? cursorColor;
  final double? width;
  final double? height;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final void Function()? onEditingComplete;
  final int? maxLength;
  final String? counterText;
  final String? tooltipMessage;
  final int? minLines;
  final int? maxLines;
  final EdgeInsets? buttonPadding;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  const TextInputBase({
    this.suffixIcon,
    this.suffixIconConstraints,
    this.label,
    this.controller,
    this.hintText,
    this.validator,
    this.obscureText,
    this.autoFocus = false,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.padding = const EdgeInsets.only(top: ThemeSpacing.xs),
    this.showRequired = false,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.cursorColor = ThemeColors.darkGrey_700,
    this.width = double.infinity,
    this.height = ThemeButtonHeight.sm,
    this.onChanged,
    this.onEditingComplete,
    this.counterText = '',
    this.maxLength,
    this.tooltipMessage,
    this.minLines,
    this.maxLines,
    this.buttonPadding = ThemeButtonPadding.sm,
    this.textStyle,
    this.hintStyle,
    super.key,
  });

  TextStyle get _hintStyle {
    return Un1qTextTheme.body2Regular.copyWith(
      color: ThemeColors.darkGrey_300,
    );
  }

  InputDecorationTheme get decorationStyle {
    return TextInputStyleGenerator.outlinedInputDecorationStyle;
  }

  TextStyle get defaultTextStyle {
    return Un1qTextTheme.body2Regular.copyWith(
      color: ThemeColors.darkGrey_900,
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
    return Theme(
      data: ThemeData(
        inputDecorationTheme: decorationStyle,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: ThemeColors.primary,
            ),
      ),
      child: SizedBox(
        width: width,
        child: PrimaryFieldLabel(
          label: label,
          showRequired: showRequired,
          child: Padding(
            padding: label == null
                ? const EdgeInsets.only(top: ThemeSpacing.zero)
                : padding,
            child: SizedBox(
              height: height,
              child: Opacity(
                opacity: enabled ? 1 : 0.5,
                child: TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  maxLength: maxLength,
                  style: textStyle ?? defaultTextStyle,
                  decoration: InputDecoration(
                    suffixIconConstraints: suffixIconConstraints,
                    hintStyle: hintStyle ?? _hintStyle,
                    hintText: hintText,
                    counterText: counterText,
                    suffixIcon: suffixIcon,
                    border: border,
                    contentPadding: buttonPadding,
                  ),
                  onEditingComplete: onEditingComplete,
                  obscureText: obscureText ?? false,
                  validator: validator,
                  autofocus: autoFocus,
                  initialValue: initialValue,
                  keyboardType: keyboardType,
                  enabled: enabled,
                  textAlign: textAlign!,
                  cursorColor: cursorColor,
                  minLines: minLines,
                  maxLines: maxLines,
                  onChanged: onChanged?.call,
                  inputFormatters: inputFormatters,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
