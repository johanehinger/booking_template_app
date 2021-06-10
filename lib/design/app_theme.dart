import 'package:booking_template_app/design/theme_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get themeData {
    return ThemeData(
      backgroundColor: ThemeColors.backgroundColor,
      primaryColor: ThemeColors.primaryColor,
      primarySwatch: ThemeColors.primarySwatchColor,
      dialogTheme: DialogTheme(
        backgroundColor: ThemeColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      accentColor: ThemeColors.secondaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: ThemeColors.backgroundColor,
          primary: ThemeColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: ThemeColors.contourColor,
          ),
          borderRadius: const BorderRadius.all(
            const Radius.circular(12.0),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(
            const Radius.circular(12.0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: ThemeColors.buttonColor),
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
    );
  }
}
