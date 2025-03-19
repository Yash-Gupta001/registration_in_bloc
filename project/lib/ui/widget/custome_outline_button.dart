// core/ui/widget/custome_outline_button.dart
import 'package:flutter/material.dart';

import '../../app/utils/color_config.dart';

/// Created by Amol Gahukar 13-12-2024
/// This custom filled button is used in all over project
/// If want to change tyhe button background color and text color just pass the param.
// ignore: must_be_immutable
class CustomeOutlineButton extends StatelessWidget {
  final String buttonText;
  final String buttonTextId;
  final Color textColor;
  final Color borderColor;
  final Function() onPressed;
  final String Function({required String labelId, required String defaultLable})
      setLabel;
  final IconData? icon; // Optional icon

  CustomeOutlineButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.setLabel,
    required this.buttonTextId,
    this.icon, // Accept an optional icon
    Color? borderColor,
    Color? textColor,
  })  : borderColor = borderColor ?? ColorConfig.primaryColor,
        textColor = textColor ?? ColorConfig.primaryColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
        side: WidgetStateProperty.resolveWith<BorderSide>(
          (Set<WidgetState> states) {
            return BorderSide(
              color: borderColor, // Dynamic border color
              width: 2,
            );
          },
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min, // Adjust size based on content
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: textColor,
              size: 18, // Adjust size as needed
            ),
            const SizedBox(width: 8), // Spacing between icon and text
          ],
          Text(
            setLabel(labelId: buttonTextId, defaultLable: buttonText),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
