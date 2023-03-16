import 'package:flutter/material.dart';

class TextThemeDark {
  TextThemeDark._init();
  static TextThemeDark? _instance;
  static TextThemeDark? get instance {
    _instance ??= TextThemeDark._init();
    return _instance;
  }

  final TextStyle headline1 = const TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );
  final TextStyle headline2 = const TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );
  final TextStyle headline3 = const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  );
  final TextStyle headline4 = const TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  final TextStyle headline5 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  final TextStyle overline = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
}
