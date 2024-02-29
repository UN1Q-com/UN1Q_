// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

class Un1qTextTheme {
  Un1qTextTheme();

  static TextStyle get headlineBold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 34,
      );

  static TextStyle get heading1Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      );

  static TextStyle get heading2Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      );

  static TextStyle get heading3Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      );

  static TextStyle get heading4Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );

  static TextStyle get heading5Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );

  static TextStyle get heading6Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );

  static TextStyle get body1Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );

  static TextStyle get body1Regular => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );

  static TextStyle get body2Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );

  static TextStyle get body2Regular => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  static TextStyle get body2Danger => GoogleFonts.inter(
        color: ThemeColors.danger,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  static TextStyle get label1Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.w700,
        fontSize: 17,
      );

  static TextStyle get label1Regular => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.w400,
        fontSize: 17,
      );

  static TextStyle get label2Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      );

  static TextStyle get label2Regular => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  static TextStyle get textSpan1Regular => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );

  static TextStyle get textSpan1Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );

  static TextStyle get textSpan2Regular => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  static TextStyle get textSpan2Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );

  static TextStyle get buttonBody2Bold => GoogleFonts.inter(
        color: ThemeColors.primary,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      );
}
