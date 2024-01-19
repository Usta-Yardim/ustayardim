import 'package:flutter/material.dart';

ThemeData mainThemeData = ThemeData(
  primaryColor: Colors.brown,
  backgroundColor: Colors.white,
  useMaterial3: true,
  dividerTheme: DividerThemeData(color: Colors.brown),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Color(0xff393e41),
    unselectedItemColor: Colors.grey.withOpacity(0.7),
  ),
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
  ),
  primaryTextTheme: TextTheme(
    titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
    titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.brown),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.brown),
    bodySmall: TextStyle(fontSize: 14, color: Colors.brown),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
);
