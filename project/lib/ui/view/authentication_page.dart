import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rfc_cc/app/utils/constant.dart';
import 'package:rfc_cc/ui/controller/auth/auth_controller.dart';
import 'package:rfc_cc/ui/view/base_view.dart';
import 'package:rfc_cc/ui/view/empty_app_bar.dart';
import 'package:rfc_cc/ui/widget/custom_text_field.dart';

/*
  Created By Amol Gahukar 1-11-2024
*/
class LoginPage extends BaseView<AuthController> {
  const LoginPage({super.key});

  @override
  PreferredSizeWidget? appBar() {
    return EmptyAppBar();
  }

  /*
    Retrun only body
  */
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            const AssetImage("assets/images/ic_login_back.png"),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor,
                          BlendMode.srcATop,
                        )),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 300.0.h,
                      width: 150.0.w,
                      child: Image.network(Constant.loginLogo),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Text(
                'Login In',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: BorderTextField(
                  labelText: "Username",
                  hintText: "Enter valid email id as abc@gmail.com",
                  controller: TextEditingController()
                    ..text = controller.username,
                  onChanged: (value) {
                    controller.username = value.toString();
                  }),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: BorderTextField(
                  labelText: "Password",
                  hintText: "Enter Password",
                  controller: TextEditingController()
                    ..text = controller.password,
                  onChanged: (value) {
                    controller.password = value.toString();
                  },
                  obscureText: true),
            ),
            SizedBox(height: 20.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: SizedBox(
                  height: 50.0.h,
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      controller.loginV2(
                          controller.username, controller.password);
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  String titleName() {
    return "";
  }
}
