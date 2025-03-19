import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:rfc_cc/app/utils/color_config.dart';
import 'package:rfc_cc/ui/view/base_view.dart';
import '../../../app/utils/string_config.dart';
import '../../controller/mark_attendance/mark_attendance_controller.dart';

class MarkAttendancePage extends BaseView<MarkAttendanceController> {
  const MarkAttendancePage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.w),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConfig.lblSelectCorseType,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorConfig.textColorSecondary,
                  ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                _buildRadioTile(context, StringConfig.lblCoreElective, 1),
                _buildRadioTile(context, StringConfig.lblOpenGlobalElective, 2),
              ],
            )
          ],
        ),
      ),
    ));
  }

  Widget _buildRadioTile(
    BuildContext context,
    String title,
    int value,
  ) {
    return Expanded(child: Obx(() {
      return RadioListTile<String>(
        title: Transform.translate(
          offset: const Offset(-12, 0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: ColorConfig.textColorSecondary, fontSize: 13.sp),
          ),
        ),
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: value.toString(),
        groupValue: controller.selectedStatus.value,
        activeColor: ColorConfig.primaryColor,
        contentPadding: EdgeInsets.zero,
        onChanged: (value) {
          controller.selectedStatus.value = value!;
        },
      );
    }));
  }

  @override
  String titleName() {
    return StringConfig.titleMarkAttendance;
  }
}
