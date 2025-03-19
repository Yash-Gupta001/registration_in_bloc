import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/model/register_courses_response.dart';
import '../../../app/utils/color_config.dart';

class RegisteredCourseCell extends StatelessWidget {
  final RegisterCourseDetail registerCourseDetail;

  const RegisteredCourseCell({super.key, required this.registerCourseDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.0.w, 1.0.h, 5.0.w, 1.0.h),
      margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 2.0.h),
      decoration: BoxDecoration(
        color: ColorConfig.whiteColor,
        borderRadius: BorderRadius.circular(8.0.sp),
        border: Border.all(
          color: ColorConfig.whiteColor,
          width: 1.0.sp,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Semester',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorConfig.textColorSecondary),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    registerCourseDetail.semesterName ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorConfig.textColorPrimary),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0.h),

            // Second row (Course Code)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Course Code',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorConfig.textColorSecondary),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    registerCourseDetail.ccode ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorConfig.textColorPrimary),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0.h),

            // Third row (Course Name)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Course',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorConfig.textColorSecondary),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    registerCourseDetail.courseName ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorConfig.textColorPrimary),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0.h),

            // Fourth row (Course Type)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Course Type',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorConfig.textColorSecondary),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    registerCourseDetail.subName ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorConfig.textColorPrimary),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0.h),

            // Fifth row (Register by Student)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Register by Student',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorConfig.textColorSecondary),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    registerCourseDetail.register == '1' ? 'Yes' : 'No',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorConfig.textColorPrimary),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0.h),

            // Sixth row (Approve by Faculty)
            Visibility(
              visible: registerCourseDetail.accepted == '1',
              // Assuming 1 means Yes
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      'Approve by Faculty',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorConfig.textColorSecondary),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      registerCourseDetail.accepted == '1' ? 'Yes' : 'No',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorConfig.textColorPrimary),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
