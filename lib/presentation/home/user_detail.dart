import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:registration_in_bloc/floor_database/database/app_database.dart';
import 'package:registration_in_bloc/floor_database/entity/user_entity.dart';
import 'package:registration_in_bloc/presentation/home/all_registered_users.dart';
import 'package:registration_in_bloc/repository/user_repository.dart';
import 'package:registration_in_bloc/ui/widgets/dialog.dart';
import 'package:registration_in_bloc/ui/widgets/dialog_floatingaction_button.dart';
import 'package:registration_in_bloc/presentation/auth/pages/signup.dart';
import 'package:registration_in_bloc/ui/widgets/elevated_button.dart';

import '../../ui/values/colors/colors.dart';

class Userdetails extends StatelessWidget {
  final UserEntity user; // UserEntity object

  const Userdetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final AppDatabase database = GetIt.instance<AppDatabase>();
    final UserRepository userRepository = GetIt.instance<UserRepository>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Card(
            elevation: 4, // Add shadow to the card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            margin: EdgeInsets.all(16), // Add margin around the card
            child: Padding(
              padding: EdgeInsets.all(20), // Add padding inside the card
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Make the column take only the space it needs
                children: [
                  Text(
                    'User Details',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: red,
                    ),
                  ),
                  SizedBox(height: 20),

                  // User details with icons
                  _buildDetailRow(Icons.person_outline, 'ID: ${user.id}'),
                  SizedBox(height: 10),
                  _buildDetailRow(Icons.person, 'Name: ${user.name}'),
                  SizedBox(height: 10),
                  _buildDetailRow(Icons.email, 'Email: ${user.email}'),
                  SizedBox(height: 10),
                  _buildDetailRow(Icons.phone, 'Phone: ${user.phone}'),
                  SizedBox(height: 10),
                  _buildDetailRow(
                      Icons.person_pin, 'Username: ${user.username}'),
                  SizedBox(height: 20),

                  // Custom Elevated Button
                  CustomElevatedButton(
                    title: 'All Registered Users',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllRegisteredUsers(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: DialogCustomFloatingActionButton(
          onPressed: () {
            // Show the dialog using showDialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(
                  title: 'Logout',
                  content: 'Are you sure you want to logout?',
                  onConfirm: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupPage(
                          database: database,
                          userRepository: userRepository,
                        ),
                      ),
                      (route) => false, // Removes all previous routes
                    );
                    print("button pressed");
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
          label: 'Logout',
          iconData: Icons.logout_sharp,
        ),
      ),
    );
  }
}

Widget _buildDetailRow(IconData icon, String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center, // Center the row content
    children: [
      Icon(icon, color: red), // Add an icon
      SizedBox(width: 10), // Add spacing
      Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: black,
        ),
      ),
    ],
  );
}
