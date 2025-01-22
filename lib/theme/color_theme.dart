/// This is a class that handles the color theme across the app.
import 'package:flutter/material.dart';

class ColorTheme {
  // Primary colors
  static const Color darkBlue =
      Color(0xFF001F54); // Dark blue color for primary elements
  static const Color black =
      Color(0xFF000000); // Black color for backgrounds or text

  // Accent colors
  static const Color blueAccent =
      Color(0xFF007BFF); // Lighter blue for highlights and accents
  static const Color darkBlueAccent =
      Color(0xFF003B73); // Deeper blue for subtle accents

  // Text colors
  static const Color primaryText =
      Colors.white; // White for text on dark backgrounds
  static const Color secondaryText =
      Colors.white; // Light gray for secondary text

  // Gradient
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [darkBlue, black],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Shadows
  static const BoxShadow subtleShadow = BoxShadow(
    color: Colors.black38,
    offset: Offset(0, 4),
    blurRadius: 6.0,
  );

  /// Get a theme data object to apply across the app
  static ThemeData get themeData {
    return ThemeData(
      primaryColor: darkBlue,
      scaffoldBackgroundColor: black,
      hintColor: blueAccent,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: primaryText, fontSize: 24, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: secondaryText, fontSize: 16),
        bodyMedium: TextStyle(color: primaryText, fontSize: 14),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBlue,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryText),
        titleTextStyle: TextStyle(
            color: primaryText, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
