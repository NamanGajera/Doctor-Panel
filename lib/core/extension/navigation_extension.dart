// import 'package:flutter/material.dart';
//
// extension NavigationExtensions on BuildContext {
//   // Navigate to a new page
//   Future<T?> push<T>(Widget page) {
//     return Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
//   }
//
//   // Replace current page with a new one
//   Future<T?> pushReplacement<T, TO>(Widget page) {
//     return Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => page));
//   }
//
//   // Pop the current page
//   void pop<T>([T? result]) {
//     Navigator.of(this).pop(result);
//   }
//
//   // Pop until a condition is met
//   void popUntil(bool Function(Route<dynamic>) predicate) {
//     Navigator.of(this).popUntil(predicate);
//   }
//
//   // Push and remove until a condition is met
//   Future<T?> pushAndRemoveUntil<T>(Widget page, bool Function(Route<dynamic>) predicate) {
//     return Navigator.of(this).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), predicate);
//   }
// }