import 'package:flutter/material.dart';
import 'package:rfc_cc/app/utils/color_config.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConfig.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}
