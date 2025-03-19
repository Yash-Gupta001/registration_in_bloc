import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rfc_cc/ui/controller/home/home_binding.dart';
import 'package:rfc_cc/ui/controller/profile/profile_binding.dart';
import 'package:rfc_cc/ui/view/base_view.dart';
import 'package:rfc_cc/ui/view/empty_app_bar.dart';
import 'package:rfc_cc/ui/view/home/home_page.dart';
import 'package:rfc_cc/ui/view/profile/profile_page.dart';
import '../controller/main_page/main_page_controller.dart';

class MainPage extends BaseView<MainPageController> {
  const MainPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Obx(() {
      switch (controller.currentIndex.value) {
        case 0:
          HomeBinding().dependencies();
          return const HomePage();
        case 1:
          ProfileBinding().dependencies();
          return const ProfilePage();
        default:
          HomeBinding().dependencies();
          return const HomePage();
      }
    });
  }

  @override
  String titleName() {
    return "";
  }

  @override
  PreferredSizeWidget? appBar() {
    return EmptyAppBar();
  }

  @override
  bool showNavigationBar() {
    return true;
  }
}
