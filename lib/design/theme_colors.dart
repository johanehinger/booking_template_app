import 'package:flutter/material.dart';

const Map<int, Color> color = {
  50: Color.fromRGBO(42, 67, 46, .1),
  100: Color.fromRGBO(42, 67, 46, .2),
  200: Color.fromRGBO(42, 67, 46, .3),
  300: Color.fromRGBO(42, 67, 46, .4),
  400: Color.fromRGBO(42, 67, 46, .5),
  500: Color.fromRGBO(42, 67, 46, .6),
  600: Color.fromRGBO(42, 67, 46, .7),
  700: Color.fromRGBO(42, 67, 46, .8),
  800: Color.fromRGBO(42, 67, 46, .9),
  900: Color.fromRGBO(42, 67, 46, 1),
};

class ThemeColors {
  static const backgroundColor = Color(0xfff2f2f2);
  static const textColor = Color(0xff000000);

  //* Recomendetion: Set primarySwatchColor and primaryColor to the same color.
  static const primarySwatchColor = MaterialColor(0xff6BAA75, color);
  static const primaryColor = Color(0xff6BAA75);
  static const secondaryColor = Color(0xffE4B363);

  static const buttonColor = Color(0xffE4B363);
  static const contourColor = Color(0xff919AA1);
}
