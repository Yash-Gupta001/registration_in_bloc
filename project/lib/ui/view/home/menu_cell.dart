import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rfc_cc/data/model/menu_data.dart';

// ignore: must_be_immutable
class MenuCell extends StatelessWidget {
  MenuData choice;

  MenuCell({super.key, required this.choice});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                choice.icon,
                width: 30.0.w,
                height: 30.0.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 2.0.h),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Text(
                    choice.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 10.0.sp,
                        ),
                  ),
                ),
              ),
            ]));
  }
}
