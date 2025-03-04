import 'package:flutter/material.dart';

import '../values/colors/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label; 
  final IconData iconData; 
  final Color backgroundColor;
  final Color foregroundColor;
  final double elevation;

  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.label, 
    required this.iconData, 
    this.backgroundColor = black,
    this.foregroundColor = white,
    this.elevation = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      icon: Icon(iconData), 
      label: Padding(
        padding: const EdgeInsets.all(8.0), 
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,  
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis, 
          maxLines: 1, 
        ),
      ),
    );
  }
}
