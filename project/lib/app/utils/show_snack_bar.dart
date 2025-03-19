import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef CallbackFunction = void Function(ScaffoldMessengerState value);

/*
  Created By Amol Gahukar 22-11-2024
*/
class ShowSnackBar {
  late CallbackFunction onClick;
  final String message;
  ShowSnackBar({required this.message});

  void showMessageWithAction({required Null Function(dynamic value) onClick}) {
    final scaffold = ScaffoldMessenger.of(Get.context!);
    scaffold.showSnackBar(
      SnackBar(
          content: Text(message),
          action:
              SnackBarAction(label: 'OK', onPressed: () => onClick(scaffold))),
    );
  }

  void showMessage() {
    final scaffold = ScaffoldMessenger.of(Get.context!);
    scaffold.showSnackBar(SnackBar(content: Text(message)));
  }
}
