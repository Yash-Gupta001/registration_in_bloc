import 'package:flutter/material.dart';
import 'package:rfc_cc/app/utils/color_config.dart';
import 'package:rfc_cc/ui/controller/profile/profile_controller.dart';
import 'package:rfc_cc/ui/view/base_view.dart';
import '../../../data/model/student_info_response.dart';
import 'profile_details_cell.dart';

class ProfileDetailsPage extends BaseView<ProfileController> {
  final List<StudentData> studentData;
  final String from;

  const ProfileDetailsPage(
      {super.key, required this.studentData, required this.from});

  @override
  Widget buildBody(BuildContext context) {
    if (from == "PERSONAL_INFO" || from == "CONTACT_INFO") {
      var titleName = "";
      if (from == "PERSONAL_INFO") {
        titleName = "Personal Details";
      } else {
        titleName = "Contact Details";
      }

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Expanded(
              child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            titleName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          )),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8.0), // Vertical margin
                        child: Divider(
                          color: ColorConfig.primaryColor,
                          thickness: 0.5,
                        ),
                      ),
                      showPersonalInfo(context),
                    ],
                  )),
            ),
          ),
        ],
      );
    } else if (from == "POSTEL_INFO") {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10, bottom: 10),
            child: Expanded(
              child: Card(
                elevation: 2,
                color: Colors.white,
                child: showPostelInfo(context),
              ),
            ),
          ),
        ],
      );
    } else {
      return const Center(
        child: Text("No Information Available"),
      );
    }
  }

  Widget showPersonalInfo(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0, // Space between columns
        mainAxisSpacing: 5.0, // Space between rows
        childAspectRatio: 3,
      ),
      itemCount: studentData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {},
            child: ProfileDetailsCell(studentData: studentData[index]));
      },
    );
  }

  Widget showContactInfo(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0, // Space between columns
        mainAxisSpacing: 5.0, // Space between rows
        childAspectRatio: 3,
      ),
      itemCount: studentData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {},
            child: ProfileDetailsCell(studentData: studentData[index]));
      },
    );
  }

  Widget showPostelInfo(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0, // Space between columns
        mainAxisSpacing: 5.0, // Space between rows
        childAspectRatio: 3,
      ),
      itemCount: studentData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {},
            child: ProfileDetailsCell(studentData: studentData[index]));
      },
    );
  }

  @override
  String titleName() {
    return "Profile Details";
  }
}
