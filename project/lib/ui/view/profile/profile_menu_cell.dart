import 'package:flutter/material.dart';
import 'package:rfc_cc/app/utils/color_config.dart';
import 'package:rfc_cc/data/model/menu_data.dart';

// ignore: must_be_immutable
class ProfileMenuCell extends StatelessWidget {
  MenuData choice;

  ProfileMenuCell({super.key, required this.choice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  choice.icon,
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 2.0),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    choice.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorConfig.textColorWhite),
                  ),
                ),
              ),
            ]),
        Container(
          margin:
              const EdgeInsets.symmetric(horizontal: 16.0), // Vertical margin
          child: const Divider(
            color: Colors.white,
            thickness: 0.3,
          ),
        )
      ],
    );
  }
}
