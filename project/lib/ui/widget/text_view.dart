import 'package:flutter/material.dart';

/*
  Created By Amol Gahukar 22-11-2024
*/
class TextView extends StatelessWidget {
  final String title;

  const TextView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
