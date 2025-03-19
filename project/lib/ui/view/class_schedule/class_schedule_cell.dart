import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rfc_cc/ui/view/class_schedule/class_schedule_details_cell.dart';

import '../../../app/utils/color_config.dart';
import '../../../data/model/class_schedule_response.dart';

class ClassScheduleCell extends StatelessWidget {
  final ClassScheduleList classScheduleList;
  final List<ClassScheduleData> classScheduleDataList;

  const ClassScheduleCell({
    super.key,
    required this.classScheduleList,
    required this.classScheduleDataList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 2.0.h),
      margin: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 10.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15.0.w, 15.0.h, 1.0.w, 5.0.h),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    // Use Container to control width and alignment
                    alignment: Alignment.centerLeft,
                    // Align text to the left
                    child: Text(
                      classScheduleList.lectureName ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorConfig.textColorPrimary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0.0.w, 0),
                    child: Text(
                      classScheduleList.lectureTime ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorConfig.textColorPrimary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0.w, 0.0.h, 1.0.w, 15.0.h),
            child: Column(
              children: classScheduleDataList.map((classScheduleData) {
                return GestureDetector(
                  onTap: () {
                    // Handle tap action if needed
                  },
                  child: ClassScheduleDetailsCell(
                      classScheduleData: classScheduleData),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
