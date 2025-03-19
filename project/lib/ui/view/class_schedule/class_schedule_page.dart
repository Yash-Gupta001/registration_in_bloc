import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rfc_cc/app/utils/color_config.dart';
import 'package:rfc_cc/ui/controller/class_schedule/class_schedule_controller.dart';
import 'package:rfc_cc/ui/view/base_view.dart';
import 'package:rfc_cc/ui/view/class_schedule/class_schedule_cell.dart';
import 'package:rfc_cc/ui/view/data_not_found_page.dart';

import '../../../data/model/class_schedule_response.dart';
import 'class_schedule_shimmer.dart';

class ClassSchedulePage extends BaseView<ClassScheduleController> {
  ClassSchedulePage({super.key});

  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget buildBody(BuildContext context) {
    return DefaultTabController(
      length: days.length,
      //initialIndex: controller.currentDayIndex.value,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: Get.width,
              color: ColorConfig.backgroundColor,
              child: Obx(() {
                if (controller.isClassScheduleLoading.value) {
                  return ClassScheduleShimmer.buildTabBarShimmer();
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      padding: EdgeInsets.zero,
                      tabs: days
                          .map((tab) => Tab(
                                child: Text(
                                  tab,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ))
                          .toList(),
                    )),
                  ],
                );
              }),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (controller.isClassScheduleLoading.value) {
                  return ClassScheduleShimmer.buildScheduleListShimmer();
                }
                if ((controller.classScheduleResponse).isEmpty) {
                  return Center(
                    child: Text(
                      "No classes scheduled for this week.",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  );
                }
                return TabBarView(
                  children: days.map((day) {
                    final scheduleLists = controller.classScheduleResponse
                        .where((schedule) =>
                            schedule.day?.toLowerCase() == day.toLowerCase())
                        .map((schedule) => schedule.classScheduleList)
                        .expand((e) => e ?? [])
                        .toList();
                    return showClassSchedule(context, scheduleLists);
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  String titleName() {
    return "Class Schedule";
  }

  Widget showClassSchedule(BuildContext context, List<dynamic> scheduleLists) {
    if (scheduleLists.isEmpty) {
      return DataNotFoundPage(
        message:
            "Selected day class schedule will be available after added in the system.",
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.0.w, vertical: 10.0.h),
      child: ListView.builder(
        itemCount: scheduleLists.length,
        itemBuilder: (context, index) {
          final classScheduleList = scheduleLists[index] as ClassScheduleList;
          return GestureDetector(
            onTap: () {
              // Handle tap action if needed
            },
            child: ClassScheduleCell(
              classScheduleList: classScheduleList,
              classScheduleDataList:
                  classScheduleList.classScheduleDataList ?? [],
            ),
          );
        },
      ),
    );
  }
}
