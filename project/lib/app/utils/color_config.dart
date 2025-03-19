import 'package:flutter/material.dart';

/*
  ColorConfig use for flavor wise color in project
  Created By Amol Gahukar 15-11-2024
*/
class ColorConfig {
  static const String flavor = String.fromEnvironment('FLAVOR');

  static Color primaryColor = ColorConfig.flavorConfig[flavor]!['primaryColor'];
  static Color backgroundColor =
      ColorConfig.flavorConfig[flavor]!['backgroundColor'];
  static Color textColorPrimary =
      ColorConfig.flavorConfig[flavor]!['textColorPrimary'];
  static Color buttonBackgroundColor =
      ColorConfig.flavorConfig[flavor]!['buttonBackgroundColor'];
  static Color textColorWhite =
      ColorConfig.flavorConfig[flavor]!['textColorWhite'];
  static Color profilePageBackground =
      ColorConfig.flavorConfig[flavor]!['profilePageBackground'];
  static Color textColorSecondary =
      ColorConfig.flavorConfig[flavor]!['textColorSecondary'];
  static const Color redColor = Colors.red;
  static const Color whiteColor = Colors.white;
  static Color cancelButtonBorderColor = Colors.red;

  static void init() {
    primaryColor = flavorConfig[flavor]!['primaryColor'];
  }

  static Map<String, Map<String, dynamic>> flavorConfig = {
    'rfccc': {
      'primaryColor': Color(0xFF0000FF),
      'backgroundColor': Color(0xFFF6F6F6), // Blue for dev flavor
      'textColorPrimary': getColorFromHex("#333333"),
      'textColorSecondary': getColorFromHex("#D9333333"),
      'buttonBackgroundColor': Colors.blue,
      'textColorWhite': Colors.white,
      'profilePageBackground': const Color(0xFF009D4E),
    },
    'hits': {
      'primaryColor': Color(0xFFF6891F),
      'backgroundColor': Color(0xFFF6F6F6), // Blue for dev flavor
      'textColorPrimary': getColorFromHex("#333333"),
      'textColorSecondary': getColorFromHex("#D9333333"),
      'buttonBackgroundColor': Colors.blue,
      'textColorWhite': Colors.white,
      'profilePageBackground':
          const Color(0xFF009D4E), // Red for production flavor
    },
    'pu': {
      'primaryColor': Color(0xFF00609A),
      'backgroundColor': Color(0xFFF6F6F6), // Blue for dev flavor
      'textColorPrimary': getColorFromHex("#333333"),
      'textColorSecondary': getColorFromHex("#D9333333"),
      'buttonBackgroundColor': Colors.blue,
      'textColorWhite': Colors.white,
      'profilePageBackground':
          const Color(0xFF009D4E), // Red for production flavor
    },
  };

  static getColorFromHex(String? hexColor) {
    try {
      final buffer = StringBuffer();
      if (hexColor?.length == 6 || hexColor?.length == 7) buffer.write('ff');
      buffer.write(hexColor?.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return null;
    }
  }
}
