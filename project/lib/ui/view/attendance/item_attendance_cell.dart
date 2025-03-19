import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rfc_cc/app/utils/color_config.dart';
import '../../../../data/model/attendance_details.dart';

class AttendanceCell extends StatelessWidget {
  final AttendanceDetails attendanceDetail;
  const AttendanceCell({super.key, required this.attendanceDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 2.0.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(vertical: 0.0.h, horizontal: 1.0.w),
        child: Column(
          children: [
            ListTile(
              title: Text(
                attendanceDetail.courseName ?? "",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorConfig.textColorPrimary,
                    fontWeight: FontWeight.w700),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "",
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  Text("${attendanceDetail.percentage} % ",
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.0.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: attendanceDetail.percentage! / 100,
                        backgroundColor: Colors.grey[200],
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.green),
                        minHeight: 6.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0.h),
                  // Horizontal orientation for Total, Present, and Absent
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Total: ${attendanceDetail.totalClass}',
                              style: Theme.of(context).textTheme.titleSmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Present: ${attendanceDetail.present}',
                              style: Theme.of(context).textTheme.titleSmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Absent: ${attendanceDetail.absent}',
                              style: Theme.of(context).textTheme.titleSmall,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/ic_arrow_right.png', // Assuming ic_watch is your image asset
                          width: 24.0, // Equivalent to dp_140
                          height: 24.0, // Equivalent to dp_140
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
