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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'User Details',
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: red),
              ),
              SizedBox(height: 20),

              Text("ID: ${user.id}", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),

              Text("Name: ${user.name}", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),

              Text("Email: ${user.email}", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),

              Text("Phone: ${user.phone}", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),

              Text("Username: ${user.username}",
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),

              // Text("password: ${user.password}",
              // style: TextStyle(fontSize: 20)),

              CustomElevatedButton(title: 'all registered users', onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AllRegisteredUsers()
                  ));

              })
            ],
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
