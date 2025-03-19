import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfc_cc/ui/view/empty_app_bar.dart';
import '../controller/auth/auth_binding.dart';
import '../controller/splash/splash_controller.dart';
import 'authentication_page.dart';
import 'base_view.dart';

/*
  Created By Amol Gahukar 15-11-2024
*/
// ignore: must_be_immutable
class SplashPage extends BaseView<SplashController> {
  SplashPage({super.key});
  Timer? timer;

  // void _getAppId() async {
  //   // PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   // const String flavor = String.fromEnvironment('FLAVOR');
  //   // print("Flavor NAME $flavor");
  //   // print(
  //   //     "Package NAME ${packageInfo.packageName}"); // This is the Application ID
  //   // print("welcomeLabel ${StringConfig.getLabel("welcomeLabel")}");
  // }

  void startTimer() {
    timer?.cancel();

    // Start a new timer that ticks every second
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (controller.secondsRemaining.value > 0) {
        controller.secondsRemaining.value--;
      } else {
        timer.cancel(); // Stop the timer when it reaches 0
        AuthBinding().dependencies();
        Get.off(const LoginPage());
      }
    });
  }

  @override
  Widget buildBody(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        startTimer();
        return Container(
          color: Theme.of(context).primaryColor,
          child: const Center(
            child: SizedBox(
              height: 300.0,
              width: 150.0,
              //child: Image.network(Constant.splashLogo),
            ),
          ),
        );
      },
    );
  }

  @override
  String titleName() {
    return "";
  }

  @override
  PreferredSizeWidget? appBar() {
    return EmptyAppBar();
  }
}
