import 'package:flutter/material.dart';
import 'package:registration_in_bloc/ui/colors/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final double elevation;
  final bool leading; // true or false for back button in appbar

  const CustomAppbar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.black,
    this.elevation = 4.0,
    required this.leading, 
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double appBarHeight = screenHeight * 0.08;

    return AppBar(
      leading: leading
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null, // This will ensure no leading widget appears if 'leading' is false
      backgroundColor: backgroundColor,
      elevation: elevation,
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
      toolbarHeight: appBarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
