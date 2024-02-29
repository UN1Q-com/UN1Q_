// Flutter imports:
import 'package:flutter/material.dart';

extension ColorX on Color {
  Color darken(double percent) {
    assert(percent >= 0 && percent <= 1);
    final f = 1 - percent;
    return Color.fromARGB(
        alpha, (red * f).round(), (green * f).round(), (blue * f).round());
  }
}
