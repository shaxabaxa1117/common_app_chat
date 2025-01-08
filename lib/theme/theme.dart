import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFB0E3E6),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(

  ),
  colorScheme:const ColorScheme.light(
    primary: Color(0xFFB0E3E6), // Основной цвет
    secondary: Color(0xFF99FF99), // Акцентный цвет
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFFB0E3E6),
  scaffoldBackgroundColor: Color(0xFF121212),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF121212),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(

  ),
  colorScheme:const ColorScheme.dark(
    primary: Color(0xFFB0E3E6), // Основной цвет
    secondary: Color(0xFF99FF99), // Акцентный цвет
  ),
);
