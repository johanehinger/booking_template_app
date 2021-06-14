import 'package:booking_template_app/design/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

class AppTheme {
  DayBarStyle get dayBarStyle {
    return DayBarStyle(
      color: ThemeColors.secondaryColor,
    );
  }

  ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: ThemeColors.backgroundColor,
      backgroundColor: ThemeColors.backgroundColor,
      primaryColor: ThemeColors.primaryColor,
      accentColor: ThemeColors.secondaryColor,
      dialogTheme: DialogTheme(
        backgroundColor: ThemeColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // onPrimary: ThemeColors.backgroundColor,
          primary: ThemeColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        // prefixStyle: TextStyle(color: ThemeColors.secondaryColor),
        hintStyle: TextStyle(color: ThemeColors.contourColor),
        labelStyle: TextStyle(color: ThemeColors.contourColor),
        counterStyle: TextStyle(color: Colors.yellow),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: ThemeColors.buttonColor,
          ),
          borderRadius: const BorderRadius.all(
            const Radius.circular(0.0),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.none,
            color: ThemeColors.contourColor,
          ),
          borderRadius: const BorderRadius.all(
            const Radius.circular(0.0),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(
            const Radius.circular(0.0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: ThemeColors.buttonColor,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ThemeColors.secondaryColor,
        backgroundColor: ThemeColors.primaryColor,
      ),
      dividerTheme: DividerThemeData(
          color: ThemeColors.primaryColor,
          endIndent: 12.0,
          indent: 12.0,
          thickness: 2.0),
      appBarTheme: AppBarTheme(color: ThemeColors.primaryColor),
      cardTheme: CardTheme(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(0.0),
          ),
          // side: BorderSide(style: BorderStyle.solid),
        ),
      ),
      // iconTheme: IconThemeData(color: ThemeColors.secondaryColor),
      // accentIconTheme: IconThemeData(color: ThemeColors.primaryColor),
      // primaryIconTheme: IconThemeData(color: ThemeColors.buttonColor),
    );
  }
}
