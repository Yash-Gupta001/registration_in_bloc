import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rfc_cc/app/utils/color_config.dart';
import 'package:rfc_cc/ui/controller/profile/profile_binding.dart';
import 'package:rfc_cc/ui/controller/profile/profile_controller.dart';
import 'package:rfc_cc/ui/view/base_view.dart';
import 'package:rfc_cc/ui/view/profile/profile_details_page.dart';
import 'package:rfc_cc/ui/view/profile/profile_menu_cell.dart';

import '../../../app/utils/constant.dart';
import '../authentication_page.dart';

class ProfilePage extends BaseView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    controller.getUserInfo();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage("assets/images/profile_background.png"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              ColorConfig.profilePageBackground,
              BlendMode.srcATop,
            )),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 10.0.w, right: 10.0.w, top: 30.0.h, bottom: 10.0.h),
            child: Center(
              child: SizedBox(
                height: 100.0.h,
                width: 150.0.w,
                child: Image.network(Constant.loginLogo),
              ),
            ),
          ),
          ClipOval(
            child: Image.asset(
              "assets/images/profile_photo.png",
              width: 80.0.w,
              height: 80.0.h,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: 2.0.w, right: 2.0.w, top: 2.0.h, bottom: 2.0.h),
              child: Obx(() {
                return Text(
                  controller.studentResponse.value?.studentName ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorConfig.textColorWhite),
                );
              })),
          Padding(
            padding: const EdgeInsets.only(
                left: 2.0, right: 2.0, top: 2.0, bottom: 2.0),
            child: Obx(() {
              return Text(
                controller.studentResponse.value?.emailID ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorConfig.textColorWhite),
              );
            }),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0.w), // Vertical margin
            child: const Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16.0.w, right: 16.0.w, top: 2.0.h, bottom: 2.0.h),
                    child: Text(
                      "Reg No",
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorConfig.textColorWhite),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16.0.w, right: 2.0.w, top: 2.0.h, bottom: 2.0.h),
                    child: Obx(() {
                      return Text(
                        controller.studentResponse.value?.regNo ?? "",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: ColorConfig.textColorWhite),
                      );
                    }),
                  )
                ],
              )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 2.0.w,
                          right: 16.0.w,
                          top: 2.0.h,
                          bottom: 2.0.h),
                      child: Text(
                        "Phone No",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: ColorConfig.textColorWhite),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 2.0.w,
                          right: 16.0.w,
                          top: 2.0.h,
                          bottom: 2.0.h),
                      child: Obx(() {
                        return Text(
                          controller.studentResponse.value?.mobileNo ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: ColorConfig.textColorWhite),
                        );
                      }),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16.0.w, right: 16.0.w, top: 2.0.h, bottom: 2.0.h),
                    child: Text(
                      "Course",
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorConfig.textColorWhite),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16.0.w, right: 2.0.w, top: 2.0.h, bottom: 2.0.h),
                    child: Obx(() {
                      return Text(
                        controller.studentResponse.value?.course ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: ColorConfig.textColorWhite),
                      );
                    }),
                  )
                ],
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0.w), // Vertical margin
            child: const Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: controller.getMenu().length,
            itemBuilder: (context, index) {
              final menuDetails = controller.getMenu()[index];
              return GestureDetector(
                onTap: () {
                  if (controller.getMenu()[index].title == "Personal Details") {
                    var personalDetaile =
                        controller.studentResponse.value!.studentInfo ?? [];
                    if (personalDetaile.isNotEmpty) {
                      ProfileBinding().dependencies();
                      Get.to(() => ProfileDetailsPage(
                            studentData: personalDetaile,
                            from: "PERSONAL_INFO",
                          ));
                    }
                  } else if (controller.getMenu()[index].title ==
                      "Contact Details") {
                    var contactDetails =
                        controller.studentResponse.value!.contactInfo ?? [];
                    if (contactDetails.isNotEmpty) {
                      ProfileBinding().dependencies();
                      Get.to(() => ProfileDetailsPage(
                            studentData: contactDetails,
                            from: "CONTACT_INFO",
                          ));
                    }
                  } else if (controller.getMenu()[index].title ==
                      "Postel Details") {
                    var postalInfo =
                        controller.studentResponse.value!.postalInfo ?? [];
                    if (postalInfo.isNotEmpty) {
                      ProfileBinding().dependencies();
                      Get.to(() => ProfileDetailsPage(
                            studentData: postalInfo,
                            from: "POSTEL_INFO",
                          ));
                    }
                  }
                },
                child: ProfileMenuCell(choice: menuDetails),
              );
            },
          ),
          const SizedBox(height: 5.0),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          "assets/images/ic_back.png",
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          print('Image clicked!');
                        },
                        child: Image.asset(
                          "assets/images/ic_change_password.png",
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          print('Image clicked!');
                        },
                        child: Image.asset(
                          "assets/images/ic_share.png",
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          print('Image clicked!');
                        },
                        child: Image.asset(
                          "assets/images/ic_rate.png",
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Get.off(const LoginPage());
                        },
                        child: Image.asset(
                          "assets/images/ic_log_out.png",
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  ]))
        ],
      ),
    );
  }

  @override
  String titleName() {
    return "";
  }

  @override
  PreferredSizeWidget? appBar() {
    return null;
  }
}
