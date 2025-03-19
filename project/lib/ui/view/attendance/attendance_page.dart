import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rfc_cc/app/utils/color_config.dart';
import 'package:rfc_cc/ui/controller/attendance/attendance_binding.dart';
import 'package:rfc_cc/ui/view/attendance/attendance_details_page.dart';
import 'package:rfc_cc/ui/view/attendance/item_attendance_cell.dart';
import 'package:rfc_cc/ui/view/base_view.dart';
import 'package:rfc_cc/ui/view/data_not_found_page.dart';
import 'package:shimmer/shimmer.dart';
import '../../controller/attendance/attendance_controller.dart';

class AttendancePage extends BaseView<AttendanceController> {
  const AttendancePage({super.key});

  Widget showAttendanceData(BuildContext context) {
    return Obx(() {
      final attendanceDetails = controller.attendanceDetails.value;

      if (controller.isAttedanceLoading.value) {
        return ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 14.0.w),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            );
          },
        );
      }

      if (attendanceDetails == null || attendanceDetails.isEmpty) {
        return DataNotFoundPage(
          message: "Attendance will be available after added in the system.",
        );
      }

      return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 10.0.w),
          child: ListView.builder(
            itemCount: attendanceDetails.length,
            itemBuilder: (context, index) {
              final attendanceDetail = attendanceDetails[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to detail page with GetX
                  AttendancePageBinding().dependencies();
                  Get.to(() =>
                      AttendanceDetailPage(studAttDetails: attendanceDetail));
                },
                child: AttendanceCell(attendanceDetail: attendanceDetail),
              );
            },
          ));
    });
  }

  @override
  Widget buildBody(BuildContext context) {
    return Obx(() {
      var userInfo = controller.userInfo.value;
      if (userInfo != null) {
        controller.getAttendance(userInfo.regNo!);
        controller.getAttendanceCount(userInfo.idNo!);
      }

      return Container(
        color: ColorConfig.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.fromLTRB(14.0.w, 3.0.h, 14.0.w, 10.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 5.0.h),
                            child: Text(
                              "Overall Attendance",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),

                          Obx(() => Text(
                                controller.studInfo.value?.branch ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        color: ColorConfig.textColorSecondary),
                              )),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 30.0.h, right: 10.0.w),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                                Obx(() => Text(
                                    "${controller.studentPercentage.value?.percentage ?? 0} %",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        ))),
                              ],
                            ),
                          ),

                          SizedBox(height: 10.0.h), //
                          Obx(() => Container(
                                margin: EdgeInsets.symmetric(horizontal: 0.0.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: LinearProgressIndicator(
                                    value: controller.studentPercentage.value
                                                ?.percentage !=
                                            null
                                        ? double.tryParse(controller
                                                .studentPercentage
                                                .value!
                                                .percentage!)! /
                                            100
                                        : 0.0,
                                    backgroundColor: Colors.grey[200],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.lightBlue),
                                    minHeight: 7.h,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/ic_watch.png',
                      width: 140.0.w,
                      height: 140.0.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.0.h),
            Expanded(
              child: showAttendanceData(context),
            )
          ],
        ),
      );
    });
  }

  @override
  String titleName() {
    return "Attendance";
  }
}
