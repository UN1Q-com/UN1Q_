// Flutter imports:
import 'package:flutter/services.dart';

/// Formats input to HH:MM format.
class ShortTimeInputFormatter extends TextInputFormatter {
  ShortTimeInputFormatter();
  final delimiter = ':';
  final regex = RegExp(r'^\d$');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;
    final length = text.length;
    final lastChar = text[length - 1];

    if (lastChar != delimiter && !regex.hasMatch(lastChar)) return oldValue;
    if (length <= 2) return newValue;
    if (oldValue.text.length > length) {
      if (lastChar == delimiter) {
        return newValue.copyWith(
          text: text.substring(0, length - 1),
          selection: TextSelection.collapsed(offset: length - 1),
        );
      }
    }
    if (text.length > 2 && length < 6) {
      final clean = text.replaceAll(delimiter, '');
      final value = '${clean.substring(0, 2)}$delimiter${clean.substring(2)}';
      return newValue.copyWith(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    }
    return oldValue;
  }
}
