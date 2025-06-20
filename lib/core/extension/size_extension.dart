import 'package:flutter/material.dart';

extension SizeExtensions on num {
  /// Scales the value as width based on device width.
  double get w {
    final double screenWidth = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .width;
    return (this * screenWidth) /
        410; // Replace 410 with your base design width
  }

  /// Scales the value as height based on device height.
  double get h {
    final double screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    return (this * screenHeight) /
        840; // Replace 820 with your base design height
  }

  /// Scales the value as a font size based on device width.
  double get sp {
    final double screenWidth = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .width;
    return (this * screenWidth) / 410; // Adjust for font scaling
  }

  /// Scales the value as height based on device height.
  double get screenHeight {
    final double screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .height;
    return (this * screenHeight); // Replace 820 with your base design height
  }

  /// Scales the value as height based on device height.
  double get screenWidth {
    final double screenHeight = MediaQueryData.fromView(
            WidgetsBinding.instance.platformDispatcher.views.first)
        .size
        .width;
    return (this * screenHeight); // Replace 820 with your base design height
  }
}
