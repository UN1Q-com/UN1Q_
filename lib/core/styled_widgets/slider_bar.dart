// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/styled_widgets/form_fields/field_labels/primary/primary_field_label.dart';
import 'package:un1que_new/core/styled_widgets/text/body/body1/body1_regular.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

class SliderBar extends StatefulWidget {
  const SliderBar({
    required this.divisions,
    required this.onChanged,
    required this.value,
    this.label,
    this.min = 1,
    this.start = 1,
    super.key,
  });
  final int divisions;
  final String? label;
  final double min;
  final void Function(double) onChanged;
  final int start;
  final double value;

  @override
  State<SliderBar> createState() => _SliderBarState();
}

class _SliderBarState extends State<SliderBar> {
  @override
  Widget build(BuildContext context) {
    final val = widget.value - widget.start + 1;

    return PrimaryFieldLabel(
      label: widget.label,
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
                        widget.divisions,
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
              Slider(
                  min: widget.min,
                  max: widget.divisions.toDouble(),
                  value: val < widget.min ? widget.min : val,
                  divisions: widget.divisions - 1,
                  label: widget.value.round().toString(),
                  onChanged: widget.onChanged),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: ThemeSpacing.md,
              right: ThemeSpacing.sm,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                widget.divisions,
                (i) {
                  return SizedBox(
                    width: 18,
                    child: TextBody1Regular(
                      '${i + widget.start}',
                      color: ThemeColors.darkGrey_500,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
