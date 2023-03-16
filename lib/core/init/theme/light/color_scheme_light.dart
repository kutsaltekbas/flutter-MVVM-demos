import 'package:flutter/material.dart';

class ColorSchemaLight {
  static final ColorSchemaLight _instance = ColorSchemaLight._init();

  static ColorSchemaLight get instance => _instance;
  ColorSchemaLight._init();

  final Color grey = const Color.fromARGB(255, 218, 215, 205);
  final Color lightLimeGreen = const Color.fromARGB(255, 163, 177, 138);
  final Color mediumGreen = const Color.fromARGB(255, 88, 129, 87);
  final Color mDarkGreen = const Color.fromARGB(255, 58, 90, 64);
  final Color darkGreen = const Color.fromARGB(255, 52, 78, 65);
  final Color accentGreen = const Color(0xFF1dd3b0);
  final Color facebook = const Color(0xFF4267B2);
 

}
