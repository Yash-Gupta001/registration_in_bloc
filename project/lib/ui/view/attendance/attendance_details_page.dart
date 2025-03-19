import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rfc_cc/ui/controller/attendance/attendance_controller.dart';
import 'package:rfc_cc/ui/view/attendance/subject_wise_att_cell.dart';
import 'package:rfc_cc/ui/view/base_view.dart';
import 'package:rfc_cc/ui/view/data_not_found_page.dart';
import 'package:shimmer/shimmer.dart';

import '../../../app/utils/color_config.dart';
import '../../../data/model/attendance_details.dart';

class AttendanceDetailPage extends BaseView<AttendanceController> {
  final AttendanceDetails studAttDetails;
  const AttendanceDetailPage({super.key, required this.studAttDetails});

  @override
  Widget buildBody(BuildContext context) {
    var userInfo = controller.userInfo.value;
    if (userInfo != null) {
      controller.getAttendanceDetail(userInfo.regNo!, studAttDetails.courseNo,
          userInfo.sessionNo.toString());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
          child: subjectDetailsView(context),
        ),
        getAttendanceHeader(context),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
            child: subjectAttendanceDetails(context),
          ),
        ),
      ],
    );
  }

  Widget subjectDetailsView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Obx(() {
                return Text(
                  controller.userInfo.value!.userName!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorConfig.textColorPrimary,
                      fontWeight: FontWeight.w700),
                );
              }),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Semester Name : ${controller.userInfo.value!.semesterName!}",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorConfig.textColorPrimary),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Subject Name : ${studAttDetails.courseName ?? ""}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorConfig.textColorPrimary,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget getAttendanceHeader(BuildContext context) {
    return Container(
      color: ColorConfig.primaryColor, // Replace with your colorPrimary
      padding: EdgeInsets.symmetric(vertical: 12.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Sr No',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorConfig.textColorWhite,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Date',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorConfig.textColorWhite,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                'Slot No',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorConfig.textColorWhite,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Status',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorConfig.textColorWhite,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget subjectAttendanceDetails(BuildContext context) {
    return Obx(() {
      final attBySubject = controller.attendanceBySubjectList;

      if (controller.isAttSubLoading.value) {
        return ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 60,
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

      if (attBySubject.isEmpty) {
        return DataNotFoundPage(
          message:
              "Attendance Details will be available after attendance mark in the system.",
        );
      }

      return ListView.builder(
        itemCount: attBySubject.length,
        itemBuilder: (context, index) {
          final attendanceBySubject = attBySubject[index];
          return GestureDetector(
            child: SubjectWieseAttCell(
                attendanceBySubject: attendanceBySubject, index: index),
          );
        },
      );
    });
  }

  @override
  String titleName() {
    return "Attendance Details";
  }
}
