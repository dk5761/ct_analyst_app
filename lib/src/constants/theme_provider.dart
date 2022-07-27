import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// THEME PROVIDERS

// THEMES
// light
final _theme = ThemeData(
  primaryColor: Colors.deepPurple,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.deepPurple,
      shape: const StadiumBorder(),
    ),
  ),
  textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      headline2: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      )),
);

final _customTheme = CustomThemeData(
  imageSize: 150,
);

//dark
final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    elevatedButtonTheme: _theme.elevatedButtonTheme,
    textTheme: _theme.textTheme.apply(
      displayColor: Colors.white,
      bodyColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(95, 126, 125, 125)))));

final _customDarkTheme = CustomThemeData();

// EXTENSIONS AND CLASSES

class CustomThemeData {
  final double imageSize;

  CustomThemeData({
    this.imageSize = 100,
  });
}

extension CustomTheme on ThemeData {
  CustomThemeData get custom =>
      brightness == Brightness.dark ? _customDarkTheme : _customTheme;
}

// THEME PROVIDERS
final theme = Provider((ref) => _theme);
final darkTheme = Provider((ref) => _darkTheme);
