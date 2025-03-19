import 'package:rfc_cc/app/utils/color_config.dart';

/*
  Created By Amol Gahukar 22-11-2024
*/
class Common {
  static const String flavor = String.fromEnvironment('FLAVOR');

  static const String primaryColor = String.fromEnvironment('FLAVOR');

  static dynamic getColor(String colorName) {
    return ColorConfig.flavorConfig[flavor]![colorName];
  }
}
