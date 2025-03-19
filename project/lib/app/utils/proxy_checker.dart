import 'package:flutter/services.dart';

class ProxyChecker {
  static const MethodChannel _channel = MethodChannel('proxy_checker');

  static Future<bool> isProxySet() async {
    try {
      final bool result = await _channel.invokeMethod('isProxySet');
      return result;
    } on PlatformException catch (e) {
      print("Failed to check proxy: ${e.message}");
      return false;
    }
  }
}
