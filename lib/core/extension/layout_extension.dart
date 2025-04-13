import 'package:flutter/cupertino.dart';

extension ScreenType on BoxConstraints {
  bool get isWideScreen => maxWidth >= 900;
}
