import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rfc_cc/app/utils/color_config.dart';
import '../../../../data/model/attendance_detail_by_subject.dart';

// ignore: must_be_immutable
class SubjectWieseAttCell extends StatelessWidget {
  final AttendanceBySubject attendanceBySubject;

  int index;

  SubjectWieseAttCell(
      {super.key, required this.attendanceBySubject, required this.index});

  Widget _buildAttendanceStatusIndicator() {
    if (attendanceBySubject.attStatus == "1" ||
        attendanceBySubject.attStatus == "2") {
      return Image.asset(
        'assets/images/ic_correct.png',
        width: 15.0.w,
        height: 15.0.h,
        fit: BoxFit.contain,
      );
    } else {
      return Image.asset(
        'assets/images/ic_wrong.png',
        width: 15.0.w,
        height: 15.0.h,
        fit: BoxFit.contain,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0.w, 1.0.h, 5.0.w, 0.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 2.0.h),
                  child: Text(
                    (index + 1).toString(),
                    // Replace with dynamic text if needed
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorConfig.textColorPrimary),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 2.0.h),
                  child: Text(
                    attendanceBySubject.attDate ?? "",
                    // Replace with dynamic text if needed
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 2.0.h),
                  child: Text(
                    attendanceBySubject.period ?? "",
                    // Replace with dynamic text if needed
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      attendanceBySubject.attStatus == null
                          ? "-"
                          : (attendanceBySubject.attStatus == "1"
                              ? "Present"
                              : (attendanceBySubject.attStatus == "2"
                                  ? "Exempted"
                                  : "Absent")),
                      // Replace with dynamic text if needed
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(width: 4.0.w),
                    _buildAttendanceStatusIndicator(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
