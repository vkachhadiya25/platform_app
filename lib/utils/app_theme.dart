import 'package:flutter/material.dart';

ThemeData isLight = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white
  ),
);

ThemeData isDark = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black
  ),
  brightness: Brightness.dark
);