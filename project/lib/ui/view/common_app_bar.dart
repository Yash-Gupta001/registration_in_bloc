import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rfc_cc/ui/controller/profile/profile_binding.dart';

import 'profile/profile_page.dart';

// ignore: must_be_immutable
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  bool showBackButton;
  CommonAppBar({super.key, required this.title, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: DefaultTextStyle(
        style: Theme.of(context).appBarTheme.titleTextStyle!,
        child: title, // Apply default text style to the title widget
      ),
      elevation: 0,
      centerTitle: false,
      iconTheme: const IconThemeData(color: Colors.white),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: showBackButton,
      actions: [
        GestureDetector(
          onTap: () {
            ProfileBinding().dependencies();
            Get.to(() => const ProfilePage());
          },
          child: Padding(
            padding: EdgeInsets.only(right: 16.0.w),
            child: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/profile_photo.png",
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
