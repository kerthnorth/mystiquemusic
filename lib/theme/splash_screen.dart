import 'package:flutter/material.dart';
import 'package:mystiquemusic/screens/homescreen.dart';
import 'color_theme.dart'; // Importing the ColorTheme class

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: ColorTheme
              .backgroundGradient, // Using the gradient from ColorTheme
        ),
        child: Center(
          child: Image.asset(
            'lib/assets/mystiquemusic.png',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
