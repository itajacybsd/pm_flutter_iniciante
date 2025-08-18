import 'package:flutter/material.dart';

//! LIGHTTHEME

final lightTheme = ThemeData(
  primaryColor: Colors.deepPurple,
  useMaterial3: false,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepPurple,
    // titleTextStyle: TextStyle(color: Colors.blue),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
    titleMedium: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
);

//! DARKTHEME

final darkTheme = ThemeData.dark(
  useMaterial3: false,
).copyWith(
  primaryColor: Colors.deepPurple,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepPurple,
    // titleTextStyle: TextStyle(color: Colors.blue),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
    titleMedium: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
);
