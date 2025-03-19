import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rfc_cc/ui/controller/attendance/attendance_binding.dart';
import 'package:rfc_cc/ui/controller/home/home_controller.dart';
import 'package:rfc_cc/ui/controller/mark_attendance/mark_attendance_binding.dart';
import 'package:rfc_cc/ui/controller/register_course/register_course_binding.dart';
import 'package:rfc_cc/ui/view/attendance/attendance_page.dart';
import 'package:rfc_cc/ui/view/base_view.dart';
import 'package:rfc_cc/ui/view/common_app_bar.dart';
import 'package:rfc_cc/ui/view/hall_ticket/hall_ticket_page.dart';
import 'package:rfc_cc/ui/view/home/menu_cell.dart';
import 'package:rfc_cc/ui/view/mark_attendance/mark_attendance_page.dart';
import 'package:rfc_cc/ui/view/register_course/register_course_page.dart';

import '../../controller/class_schedule/class_schedule_binding.dart';
import '../class_schedule/class_schedule_page.dart';

/*
  Home page for Student Faculty and Admin
*/

class HomePage extends BaseView<HomeController> {
  const HomePage({super.key});
  Widget mainScreen() {
    controller.getUserInfo();
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
            child: CarouselSlider(
              items: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Image.asset('assets/images/ic_banner_one.png',
                      fit: BoxFit.fill),
                ),
              ],
              options: CarouselOptions(
                  autoPlay: true, height: 200.0, viewportFraction: 1.0),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 10.0.w, vertical: 10.0.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.w),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0.w, vertical: 10.0.h),
                    child: Obx(() {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 2.0.w, // Space between columns
                          mainAxisSpacing: 2.0.h, // Space between rows
                          childAspectRatio: 0.8.w,
                        ),
                        itemCount: controller.menuData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                navigateToPage(index);
                              },
                              child:
                                  MenuCell(choice: controller.menuData[index]));
                        },
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void navigateToPage(int index) {
    var menuData = controller.menuData[index];
    if (menuData.title == "Attendance") {
      AttendancePageBinding().dependencies();
      Get.to(() => const AttendancePage());
    } else if (menuData.title == "Schedule") {
      ClassSchedulePageBinding().dependencies();
      Get.to(() => ClassSchedulePage());
    } else if (menuData.title == "Course") {
      RegisterCourseBinding().dependencies();
      Get.to(() => const RegisterCoursePage());
    } else if (menuData.title == "Mark Attendance") {
      MarkAttendanceBinding().dependencies();
      Get.to(() => const MarkAttendancePage());
    } else if (menuData.title == "Hall Ticket") {
      // MarkAttendanceBinding().dependencies();
      Get.to(() => const HallTicketPage());
    }

    // navigation here

    // if (choices[index].title == "Attendance") {
    //   AttendancePageBinding().dependencies();
    //   Get.to(const AttendancePage());
    // } else if (choices[index].title ==
    //     "Course") {
    //   // RegisteredCoursePageBinding()
    //   //     .dependencies();
    //   // Get.to(const RegisteredCoursePage());
    //   TestAiBinding().dependencies();
    //   Get.to(const TestAiPages());
    // } else if (choices[index].title ==
    //     "Schedule") {
    //   ClassSchedulePageBinding().dependencies();
    //   Get.to(ClassSchedulePage());
    // } else if (choices[index].title ==
    //     "Result") {
    //   TestAiBindingOne().dependencies();
    //   Get.to(TestAiPagesOne());
    // } else {
    //   ShowSnackBar(
    //           message: choices[index].title)
    //       .showMessageV2();
    // }
  }

  @override
  PreferredSizeWidget? appBar() {
    return CommonAppBar(
        title: Obx(() {
          final userName = controller.userInfo.value?.userName ?? "";
          return Text(
            "Hi, $userName",
            style: const TextStyle(color: Colors.white),
          );
        }),
        showBackButton: false);
  }

  @override
  Widget buildBody(BuildContext context) {
    return mainScreen();
  }

  @override
  String titleName() {
    return "";
  }

  @override
  bool showBackButton() {
    return false;
  }
}
