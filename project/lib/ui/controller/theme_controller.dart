// core/controller/theme_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rfc_cc/app/utils/color_config.dart';
import 'package:rfc_cc/app/utils/share_prefrance.dart';
import 'package:rfc_cc/ui/controller/base_controller.dart';

class CustomeThemeController extends BaseController {
  var isDefaultTheme = true.obs;
  var dynamicPrimaryColor = ColorConfig.primaryColor.obs;

  Rx<ThemeData> defaultTheme = ThemeData().obs;

  ThemeData get themeData => defaultTheme.value;

  @override
  void onInit() {
    isDefaultTheme.value = !isDefaultTheme.value;
    initilizeTheme();
    super.onInit();
  }

  updateTheme() {
    StorageService service = Get.find<StorageService>();
    Color primaryColor = ColorConfig.getColorFromHex(service.getString("")) ??
        ColorConfig.primaryColor;
    defaultTheme.value =
        defaultTheme.value.copyWith(primaryColor: primaryColor);
    Get.changeTheme(defaultTheme.value);
  }

  initilizeTheme() {
    defaultTheme.value = ThemeData(
        primaryColor: ColorConfig.primaryColor,
        primaryColorDark: Colors.white,
        fontFamily: 'InterDisplay',
        textTheme: TextTheme(
          titleSmall: TextStyle(
              color: ColorConfig.textColorPrimary,
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w400),
          titleMedium: TextStyle(
              color: ColorConfig.textColorPrimary,
              fontSize: 16.0.sp,
              fontWeight: FontWeight.w400),
          titleLarge: TextStyle(
              color: ColorConfig.textColorPrimary,
              fontSize: 18.0.sp,
              fontWeight: FontWeight.w400),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: ColorConfig.primaryColor,
          titleTextStyle: TextStyle(
            color: ColorConfig.textColorPrimary,
            fontSize: 20.sp,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(ColorConfig.buttonBackgroundColor),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ))),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: ColorConfig.cancelButtonBorderColor,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.r), // Smaller corner radius
            ),
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: ColorConfig.primaryColor,
          // dividerColor: ColorConfig.primaryColor,
          unselectedLabelColor: ColorConfig.textColorSecondary,
          indicatorColor: ColorConfig.primaryColor,
          labelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold, // Selected tab text font style
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal, // Unselected tab text font style
          ),
        ));
  }
}
