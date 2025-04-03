import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MyBottomNavBarTheme {
  static BottomNavigationBarThemeData lightBottomNavBarTheme = const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: primaryDarkBlueColor,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(color: primaryDarkBlueColor, fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(color: Colors.grey),
  );

  static BottomNavigationBarThemeData darkBottomNavBarTheme = const BottomNavigationBarThemeData(
    backgroundColor: Colors.black87,
    selectedItemColor: primaryDarkBlueColor,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(color: primaryDarkBlueColor, fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(color: Colors.grey),
  );
}
