// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/utils/date_input_formatter.dart';
import 'package:un1que_new/core/utils/toast/toast.dart';

import 'form_fields/text_input_field/primary/primary_text_input_field.dart';

// Project imports:

class CustomDateInput extends StatefulWidget {
  const CustomDateInput({
    required this.date,
    required this.controller,
    required this.dateString,
    required this.onDateChanged,
    required this.onDateStringChanged,
    super.key,
  });
  final DateTime? date;
  final TextEditingController controller;
  final String dateString;
  final void Function(DateTime value) onDateChanged;
  final void Function(String value) onDateStringChanged;

  @override
  State<CustomDateInput> createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  final _now = DateTime.now();

  final _maxDate = DateTime.now().add(const Duration(days: 365));

  @override
  Widget build(BuildContext context) {
    return PrimaryTextInputField(
      controller: widget.controller,
      buttonPadding: ThemeButtonPadding.md,
      hintText: "DD / MM / YYYY",
      keyboardType: TextInputType.datetime,
      inputFormatters: [DateInputFormatter()],
      suffixIcon: IconButton(
        onPressed: () async {
          DateTime startDate = widget.date ?? _now;
          if (startDate.isBefore(_now) || startDate.isAfter(_maxDate)) {
            startDate = _now;
            ToastUtil.error(
              "value out of range",
            );
          }

          final datePicker = await showDatePicker(
            context: context,
            initialDate: startDate,
            firstDate: _now,
            lastDate: _maxDate,
          );
          if (datePicker != null) widget.onDateChanged(datePicker);
        },
        icon: const Icon(
          Icons.calendar_month_outlined,
          color: ThemeColors.primary,
        ),
      ),
      onChanged: widget.onDateStringChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Value required"; //context.l10n.valueIsRequired(text);
        }

        if (widget.date == null) {
          return "value is invalid"; //context.l10n.valueIsInvalid(text);
        }
        if (widget.date!.isBefore(_now) || widget.date!.isAfter(_maxDate)) {
          return "value out of range"; //context.l10n.valueIsOutOfRange(text);
        }
        return null;
      },
    );
  }
}
