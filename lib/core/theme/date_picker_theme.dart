import 'package:flutter/material.dart';

class MyDatePickerTheme {

  static DatePickerThemeData lightDatePickerTheme = const DatePickerThemeData(
    backgroundColor: Colors.white,
    dayStyle: TextStyle(color: Colors.black),
  );

  static DatePickerThemeData darkDatePickerTheme = const DatePickerThemeData(
    backgroundColor: Colors.black,
    dayStyle: TextStyle(color: Colors.white),
  );
}
