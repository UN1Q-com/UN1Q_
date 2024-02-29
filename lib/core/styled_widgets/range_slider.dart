// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/form_fields/field_labels/primary/primary_field_label.dart';
import 'package:un1que_new/core/styled_widgets/text/body/body1/body1_regular.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

class RangeSliderBar extends StatelessWidget {
  const RangeSliderBar({
    required this.divisions,
    required this.end,
    required this.onChanged,
    required this.start,
    this.label,
    this.min = 1,
    super.key,
  });
  final int divisions;
  final double end;
  final String? label;
  final double min;
  final void Function(RangeValues) onChanged;
  final double start;

  @override
  Widget build(BuildContext context) {
    return PrimaryFieldLabel(
      label: label,
      child: Column(
        children: [
          Stack(
            children: [
              Transform.translate(
                offset: const Offset(0, 15),
                child: SizedBox(
                  height: ThemeSpacing.md,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        divisions,
                        (i) {
                          return const VerticalDivider(
                            color: ThemeColors.darkGrey_300,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              RangeSlider(
                min: min,
                values: RangeValues(start, end),
                divisions: divisions - 1,
                labels: RangeLabels(
                  start.round().toString(),
                  end.round().toString(),
                ),
                onChanged: onChanged,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: ThemeSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                divisions,
                (i) => TextBody1Regular(
                  '${i + 1}',
                  color: ThemeColors.darkGrey_500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
