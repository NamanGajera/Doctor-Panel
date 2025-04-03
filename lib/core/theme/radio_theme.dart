import 'package:doctor_panel/core/constants/colors.dart';
import 'package:flutter/material.dart';

class MyRadioTheme {
  static RadioThemeData lightRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return primaryBlueColor;
      }
      return Colors.grey;
    }),
  );

  static RadioThemeData darkRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return primaryBlueColor;
      }
      return Colors.white70;
    }),
  );
}
