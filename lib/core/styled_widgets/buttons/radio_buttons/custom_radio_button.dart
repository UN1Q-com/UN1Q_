// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/text/body/body1/body1_regular.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.value,
    super.key,
  });
  final String groupValue;
  final void Function(String?) onChanged;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: ThemeButtonHeight.md,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: groupValue == value
              ? ThemeColors.darkGrey_600
              : ThemeColors.grey_50,
          borderRadius: BorderRadius.circular(ThemeBorderRadius.sm),
        ),
        child: Center(
          child: TextBody1Regular(
            title,
            color:
                groupValue == value ? ThemeColors.white : ThemeColors.primary,
          ),
        ),
      ),
    );
  }
}
