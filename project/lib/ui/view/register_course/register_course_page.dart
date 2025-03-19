import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rfc_cc/ui/controller/register_course/register_course_controller.dart';
import 'package:rfc_cc/ui/view/base_view.dart';
import 'package:rfc_cc/ui/view/register_course/registered_course_cell.dart';
import 'package:shimmer/shimmer.dart';

import '../../../app/utils/color_config.dart';
import '../data_not_found_page.dart';

class RegisterCoursePage extends BaseView<RegisterCourseController> {
  const RegisterCoursePage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConfig.whiteColor,
            borderRadius: BorderRadius.circular(8.0.sp),
            border: Border.all(
              color: ColorConfig.whiteColor,
              width: 1.0.sp,
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.userInfo.value?.userName ??
                        "", // Replace with your header text
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorConfig.textColorPrimary,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0.h),
                  Text(
                    controller.userInfo.value?.degreeName ??
                        "", // Replace with your header text
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorConfig.textColorPrimary),
                  ),
                  SizedBox(height: 5.0.h),
                  Text(
                    controller.userInfo.value?.branchName ??
                        "", // Replace with your header text
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorConfig.textColorPrimary),
                  ),
                  SizedBox(height: 5.0.h),
                  Text(
                    controller.userInfo.value?.currentSessionName ??
                        "", // Replace with your header text
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorConfig.textColorPrimary),
                  ),
                  SizedBox(height: 5.0.h),
                ],
              );
            }),
          ),
        ),
        Expanded(child: showRegisterCourseData(context)),
      ],
    );
  }

  @override
  String titleName() {
    return "Registered Course";
  }

  Widget showRegisterCourseData(BuildContext context) {
    return Obx(() {
      if (controller.isRegisterCourseLoading.value) {
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

      if (controller.registerCourseDetailList.isEmpty) {
        return DataNotFoundPage(
          message:
              "Register Courses will be available after register in the system.",
        );
      } else {
        return ListView.builder(
          itemCount: controller.registerCourseDetailList.length,
          itemBuilder: (context, index) {
            final registerCourseDetail =
                controller.registerCourseDetailList[index];
            return GestureDetector(
              onTap: () {
                // Navigate to detail page or perform action on tap
              },
              child: RegisteredCourseCell(
                  registerCourseDetail: registerCourseDetail),
            );
          },
        );
      }
    });
  }
}
