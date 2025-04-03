import 'package:doctor_panel/core/theme/app_bar_theme.dart';
import 'package:doctor_panel/core/theme/bottom_nav_bar_theme.dart';
import 'package:doctor_panel/core/theme/bottom_sheet_theme.dart';
import 'package:doctor_panel/core/theme/date_picker_theme.dart';
import 'package:doctor_panel/core/theme/radio_theme.dart';
import 'package:doctor_panel/core/theme/text_theme.dart';
import 'package:doctor_panel/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

import 'checkbox_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'SourceSerif4',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyTextTheme.lightTextTheme,
    bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: MyCheckboxTheme.lightCheckboxTheme,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    bottomNavigationBarTheme: MyBottomNavBarTheme.lightBottomNavBarTheme,
    datePickerTheme: MyDatePickerTheme.lightDatePickerTheme,
    radioTheme: MyRadioTheme.lightRadioTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'SourceSerif4',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyTextTheme.darkTextTheme,
    bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: MyCheckboxTheme.darkCheckboxTheme,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    bottomNavigationBarTheme: MyBottomNavBarTheme.darkBottomNavBarTheme,
    datePickerTheme: MyDatePickerTheme.darkDatePickerTheme,
    radioTheme: MyRadioTheme.darkRadioTheme,
  );
}
