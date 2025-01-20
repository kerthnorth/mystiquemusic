import 'package:flutter/material.dart';
import 'package:mystiquemusic/screens/homescreen.dart';
import 'package:mystiquemusic/theme/color_theme.dart';
import 'package:mystiquemusic/theme/splash_screen.dart';
// Importing the SplashScreen class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mystique Music',
      theme: ColorTheme
          .themeData, // Using the ColorTheme class for consistent theming
      home: const SplashScreen(), // Setting SplashScreen as the initial screen
    );
  }
}
