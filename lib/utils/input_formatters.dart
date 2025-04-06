import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// Formatter that allows only valid email characters.
class EmailInputFormatter extends TextInputFormatter {
  final RegExp _regExp = RegExp(r'[a-zA-Z0-9@._\-+]');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final filtered = newValue.text.characters.where((char) => _regExp.hasMatch(char)).join();
    return TextEditingValue(
      text: filtered,
      selection: newValue.selection,
    );
  }
}

/// Formatter for digits only (e.g., phone numbers)
class DigitsOnlyFormatter extends TextInputFormatter {
  final int maxLength;

  DigitsOnlyFormatter({this.maxLength = 10});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    final limited = digitsOnly.length > maxLength ? digitsOnly.substring(0, maxLength) : digitsOnly;

    return TextEditingValue(
      text: limited,
      selection: TextSelection.collapsed(offset: limited.length),
    );
  }
}

/// Formatter for full name: allows alphabets, spaces, and dots only.
class NameInputFormatter extends TextInputFormatter {
  final RegExp _regExp = RegExp(r'[a-zA-Z\s.]');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final filtered = newValue.text.characters.where((char) => _regExp.hasMatch(char)).join();
    return TextEditingValue(
      text: filtered,
      selection: newValue.selection,
    );
  }
}

/// Formatter that removes whitespace from the beginning and end of input
class TrimWhiteSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final trimmed = newValue.text.trim();
    return TextEditingValue(
      text: trimmed,
      selection: TextSelection.collapsed(offset: trimmed.length),
    );
  }
}
