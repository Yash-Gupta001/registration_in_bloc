import 'package:flutter/material.dart';

import '../values/colors/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double elevation;
  final double height;
  final TextStyle? textStyle;

  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor = black,
    this.elevation = 4.0,
    this.height = 50.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.88;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: elevation,
        minimumSize: Size(width, height), 
      ),
      child: Text(
        title,
        style: textStyle ??
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: white,
            ),
      ),
    );
  }
}
