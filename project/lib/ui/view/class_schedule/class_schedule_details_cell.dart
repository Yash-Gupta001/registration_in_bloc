import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils/color_config.dart';
import '../../../data/model/class_schedule_response.dart';

class ClassScheduleDetailsCell extends StatelessWidget {
  final ClassScheduleData classScheduleData;

  const ClassScheduleDetailsCell({
    super.key, // Use Key? instead of super.key
    required this.classScheduleData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 5.0.w, 5.0.h),
            child: Text(
              classScheduleData.key ?? "", // @string/title_course_code
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: ColorConfig.textColorPrimary),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 5.0.w, 5.0.h),
            child: Text(
              classScheduleData.value ?? "", // @{data.cCode}
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorConfig.textColorPrimary), // @dimen/sp_14
            ),
          ),
        ),
      ],
    );
  }
}
