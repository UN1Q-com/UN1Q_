// Flutter imports:
import 'package:flutter/material.dart';
import 'package:un1que_new/core/theme/constants.dart';
import 'package:un1que_new/core/theme/helpers/rect_slider_thumb.dart';

// Project imports:

class AppThemeConstants {
  factory AppThemeConstants() => _instance;
  AppThemeConstants._();

  static final AppThemeConstants _instance = AppThemeConstants._();

  static ThemeData lightTheme() {
    return ThemeData.light(useMaterial3: true).copyWith(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: ThemeColors.grey_50,
      ),
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) {
            if (!states.contains(MaterialState.selected)) {
              return Colors.transparent;
            }
            return ThemeColors.secondary_200;
          },
        ),
        side: MaterialStateBorderSide.resolveWith(
          (_) => const BorderSide(width: 2, color: ThemeColors.secondary_200),
        ),
      ),
      colorScheme: const ColorScheme.light(
        primary: ThemeColors.primary,
        onPrimary: ThemeColors.white,
        secondary: Colors.black,
        onSurface: ThemeColors.primary,
        error: ThemeColors.danger,
      ),
      primaryColor: ThemeColors.primary,
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (_) => ThemeColors.secondary_200,
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: ThemeColors.darkGrey_300,
        inactiveTrackColor: ThemeColors.darkGrey_300,
        trackHeight: 2,
        thumbColor: ThemeColors.primary,
        overlayColor: ThemeColors.primary.withOpacity(0.2),
        valueIndicatorColor: ThemeColors.primary,
        trackShape: const RectangularSliderTrackShape(),
        thumbShape: const RectSliderThumb(),
        valueIndicatorShape: const RectangularSliderValueIndicatorShape(),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark(useMaterial3: true).copyWith(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: ThemeColors.grey_50,
      ),
      brightness: Brightness.dark,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) {
            if (!states.contains(MaterialState.selected)) {
              return Colors.transparent;
            }
            return ThemeColors.secondary_200;
          },
        ),
        side: MaterialStateBorderSide.resolveWith(
          (_) => const BorderSide(width: 2, color: ThemeColors.secondary_200),
        ),
      ),
      colorScheme: const ColorScheme.light(
        primary: ThemeColors.primary,
        onPrimary: ThemeColors.white,
        secondary: Colors.black,
        onSurface: ThemeColors.primary,
        error: ThemeColors.danger,
      ),
      primaryColor: ThemeColors.primary,
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (_) => ThemeColors.secondary_200,
        ),
      ),
      scaffoldBackgroundColor: ThemeColors.white,
      sliderTheme: SliderThemeData(
        activeTrackColor: ThemeColors.darkGrey_300,
        inactiveTrackColor: ThemeColors.darkGrey_300,
        trackHeight: 2,
        thumbColor: ThemeColors.primary,
        overlayColor: ThemeColors.primary.withOpacity(0.2),
        valueIndicatorColor: ThemeColors.primary,
        trackShape: const RectangularSliderTrackShape(),
        thumbShape: const RectSliderThumb(),
        valueIndicatorShape: const RectangularSliderValueIndicatorShape(),
      ),
    );
  }
}
