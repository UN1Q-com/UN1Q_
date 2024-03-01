// Flutter imports:
import 'package:flutter/material.dart';

class ThemeColors {
  static const transparent = Colors.transparent;
  static const background = Color(0XFFE1E1E1);
  static const secondary = Color(0XFF00F2DE);
  static const secondary_200 = Color(0XFF00E5D3);
  static const pastelPrimary = Color(0XFFE7FDFC);
  static const pastelSecondary = Color(0XFFE5FFFD);
  static const primary = Color(0XFF233745);
  static const success = Color(0XFF52C355);
  static const warning = Color(0XFFFFE000);
  static const danger = Color(0XFFF03E3E);
  static const magenta = Color(0XFFF92F6E);
  static const supplementary = Color(0XFFFFAC00);
  static const pastel = Color(0XFFFCF3DE);
  static const pastel_50 = Color(0XFFF1FDFD);
  static const white = Color(0XFFFFFFFF);
  static const lightGreen = Color(0XFFACF73A);
  static const lightGrey = Color(0XFFEBEBEB);
  static const grey = Color(0XFFEAEAEA);
  static const grey_50 = Color(0XFFF8FAFC);
  static const grey_75 = Color(0XFFF1F5F9);
  static const darkGrey_100 = Color(0XFFE2E9EE);
  static const darkGrey_300 = Color(0XFFB8C7D2);
  static const darkGrey_400 = Color(0XFF748999);
  static const darkGrey_500 = Color(0XFF3E5667);
  static const darkGrey_600 = Color(0XFF233745);
  static const darkGrey_700 = Color(0XFF1C2D39);
  static const darkGrey_800 = Color(0XFF12202B);
  static const darkGrey_900 = Color(0XFF0C1720);
  static const darkGrey_1000 = Color(0XFF0A141B);
  static const greyPlaceholder = Color(0XFFDFDFDF);
  static const black = Color(0XFF000000);
  static const pastelPurple = Color(0XFFEAE4F6);
  static const pastelGreen = Color(0XFFF7FFE5);
  static const pastelOrange = Color(0XFFFCF3DE);
  static const pastelRed = Color(0XFFFEE5EE);
  static const supplementaryMagenta = Color(0XFFFEF6F8);
}

class ThemeSpacing {
  static const double zero = 0.0;
  static const double xxxs = 2.0;
  static const double xxs = 4.0;
  static const double xs = 10.0;
  static const double sm = 12.0;
  static const double sm1 = 15.0;
  static const double md = 20.0;
  static const double md1 = 24.0;
  static const double lg = 40.0;
  static const double xlg = 60.0;
  static const double xxlg = 100.0;
  static const double xxxlg = 250.0;
}

class ThemeBorderRadius {
  static const xs = 4.0;
  static const sm = 6.0;
  static const md = 8.0;
  static const lg = 8.0;
  static const xlg = 16.0;
  static const xxlg = 30.0;
}

class ThemeButtonHeight {
  static const xs = 28.0;
  static const sm = 44.0;
  static const md = 48.0;
  static const lg = 62.0;
  static const xlg = 92.0;
}

class ThemeButtonPadding {
  static const sm = EdgeInsets.symmetric(
    vertical: 13.0,
    horizontal: 15.5,
  );
  static const md = EdgeInsets.symmetric(
    vertical: 30,
    horizontal: 15.5,
  );
}

class ScreenPadding {
  static const horizontal = EdgeInsets.symmetric(horizontal: 35);
  static const horizontalSmall = EdgeInsets.symmetric(horizontal: 15);
  static const vertical = EdgeInsets.symmetric(vertical: 20);
}

class ThemeButtonWidth {
  static const xs = 80.0;
  static const sm = 146.0;
  static const md = 303.0;
}

class ThemeDropdownHeight {
  static double height(int itemsCount) =>
      itemsCount > 4 ? maxHeight * 4 : itemsCount * maxHeight;
  static const maxHeight = 52.0;
}
