import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/utils/color_config.dart';

/// Created by Amol Gahukar 13-12-2024
/// This custom filled button is used in all over project
/// If want to change tyhe button background color and text color just pass the param.
// ignore: must_be_immutable
class CustomeFilledButton extends StatelessWidget {
  String buttonText;
  String buttonTextId;
  Color textColor;
  Color backgroundColor;
  Color foregroundColor;
  bool isLoading;
  Function() onPressed;
  String Function({required String labelId, required String defaultLable})
      setLabel;

  CustomeFilledButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.setLabel,
      required this.buttonTextId,
      Color? backgroundColor,
      this.isLoading = false,
      this.foregroundColor = Colors.white,
      this.textColor = Colors.white})
      : backgroundColor = backgroundColor ?? ColorConfig.primaryColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: Theme.of(context).filledButtonTheme.style!.copyWith(
            backgroundColor: WidgetStateProperty.all(backgroundColor),
            foregroundColor: WidgetStateProperty.all(foregroundColor),
          ),
      onPressed: () {
        isLoading ? null : onPressed();
      },
      child: isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 20,
                    width: 20,
                    padding: const EdgeInsets.all(0.0),
                    child: const CircularProgressIndicator(
                      color: ColorConfig.whiteColor,
                    )),
                SizedBox(width: 10.h),
                Text(setLabel(labelId: buttonTextId, defaultLable: "Loading.."),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: textColor),
                    overflow: TextOverflow.ellipsis)
              ],
            )
          : Text(setLabel(labelId: buttonTextId, defaultLable: buttonText),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: textColor)),
    );
  }
}
