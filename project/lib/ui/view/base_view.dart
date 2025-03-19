import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rfc_cc/ui/controller/base_controller.dart';
import 'package:rfc_cc/ui/view/common_app_bar.dart';

import '../../app/utils/color_config.dart';

abstract class BaseView<C extends BaseController> extends GetView<C> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: controller,
        builder: (_) {
          return Scaffold(
            backgroundColor: ColorConfig.backgroundColor,
            appBar: appBar(),
            body: SafeArea(
              child: buildBody(context),
            ),
            bottomNavigationBar: bottomNavigation(context),
          );
        });
  }

  PreferredSizeWidget? appBar() {
    return CommonAppBar(
        title: Text(
          titleName(),
          style: const TextStyle(color: Colors.white),
        ),
        showBackButton: showBackButton());
  }

  bool showBackButton() {
    return true;
  }

  bool isAppBarVisible() {
    return true;
  }

  bool showNavigationBar() {
    return false;
  }

  String titleName();

  Widget? bottomNavigation(BuildContext context) {
    if (showNavigationBar()) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), // Top left corner rounded
            topRight: Radius.circular(16.r), // Top right corner rounded
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.r,
              offset: Offset(0, -2.r), // Shadow positioned above
            ),
          ],
        ),
        child: Obx(() {
          return Theme(
            data: Theme.of(context).copyWith(
              // Complete remove ripple
              // splashFactory: NoSplash.splashFactory, // Disables ripple effect
              highlightColor: Colors.transparent, // Removes highlight color
              // splashColor: Colors.transparent, //// Removes highlight effect
            ),
            child: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: (index) => controller.currentIndex(index),
              backgroundColor: ColorConfig.whiteColor,
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: _buildCustomIcon(Icons.home, "Home", 0, context),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _buildCustomIcon(Icons.person, "Profile", 1, context),
                  label: '',
                ),
              ],
            ),
          );
        }),
      );
    } else {
      return null;
    }
  }

  Widget _buildCustomIcon(
      IconData iconData, String label, int index, BuildContext context) {
    final bool isSelected = controller.currentIndex.value == index;

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
        ),
        child: Padding(
            padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 6.0.h, bottom: 6.0.h, left: 3.0.w, right: 3.0.w),
                  child: Icon(
                    iconData,
                    color: isSelected
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    size: 25.0.sp,
                  ),
                ),
                if (label.isNotEmpty)
                  Flexible(
                    child: Padding(
                        padding: EdgeInsets.only(right: 5.0.w, top: 6.0.h),
                        child: Text(
                          label,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: isSelected
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                  ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                  ),
              ],
            )));
  }

  // Abstract method to build the body of the screen.
  Widget buildBody(BuildContext context);
}
