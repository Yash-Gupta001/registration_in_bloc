import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rfc_cc/app/utils/color_config.dart';
import 'package:rfc_cc/ui/controller/splash/splash_binding.dart';
import 'package:rfc_cc/ui/view/splash_page.dart';

import '../controller/theme_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        Get.put<CustomeThemeController>(CustomeThemeController());
        return GetMaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.noScaling), // Prevents system scaling
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          initialBinding: SplashBinding(),
          theme: Get.find<CustomeThemeController>().themeData,
          home: SplashPage(),
        );
      },
    );
  }
}

final ThemeData customTheme = ThemeData(
    primaryColor: ColorConfig.primaryColor,
    fontFamily: 'SFUIDisplay',
    textTheme: TextTheme(
      titleSmall:
          TextStyle(color: ColorConfig.textColorPrimary, fontSize: 14.0.sp),
      titleMedium:
          TextStyle(color: ColorConfig.textColorPrimary, fontSize: 16.0.sp),
      titleLarge:
          TextStyle(color: ColorConfig.textColorPrimary, fontSize: 18.0.sp),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorConfig.primaryColor,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
      ),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all(ColorConfig.buttonBackgroundColor),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ))),
    tabBarTheme: TabBarTheme(
      labelColor: ColorConfig.primaryColor,
      dividerColor: ColorConfig.primaryColor,
      unselectedLabelColor: Colors.grey,
      indicatorColor: ColorConfig.primaryColor,
      tabAlignment: TabAlignment.start,
      labelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold, // Selected tab text font style
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal, // Unselected tab text font style
      ),
    ));
