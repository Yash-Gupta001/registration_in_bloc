import 'package:flutter/material.dart';
import 'package:rfc_cc/app/utils/color_config.dart';
import 'package:rfc_cc/data/model/student_info_response.dart';

// ignore: must_be_immutable
class ProfileDetailsCell extends StatelessWidget {
  StudentData studentData;

  ProfileDetailsCell({super.key, required this.studentData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  studentData.key!,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorConfig.textColorSecondary),
                ),
              ),
            )),
        Flexible(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                studentData.value!,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleMedium!,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
