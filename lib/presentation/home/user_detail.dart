import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:registration_in_bloc/floor_database/database/app_database.dart';
import 'package:registration_in_bloc/floor_database/entity/user_entity.dart'; 
import 'package:registration_in_bloc/repository/user_repository.dart';
import 'package:registration_in_bloc/ui/widgets/app_bar.dart'; 
import 'package:registration_in_bloc/ui/widgets/floatingaction_button.dart'; 
import 'package:registration_in_bloc/presentation/auth/pages/signup.dart'; 

class Userdetails extends StatelessWidget {
  final UserEntity user; // Accepting the UserEntity object

  const Userdetails({super.key, required this.user}); 

  @override
  Widget build(BuildContext context) {
     final AppDatabase database = GetIt.instance<AppDatabase>();
    final UserRepository userRepository = GetIt.instance<UserRepository>();
    return Scaffold(
      appBar: CustomAppbar(
        title: 'User Details',
        leading: false,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID: ${user.id}",
               style: TextStyle(
                fontSize: 20
                )),

            Text(
              "Name: ${user.name}",
               style: TextStyle(
                fontSize: 20
                )),

            Text(
              "Email: ${user.email}",
               style: TextStyle(
                fontSize: 20
               )),

            Text(
              "Phone: ${user.phone}",
               style: TextStyle(
                fontSize: 20
               )),

            Text(
              "Username: ${user.username}",
               style: TextStyle(
                fontSize: 20
                )),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignupPage(database: database, userRepository: userRepository)),
            (route) => false,
          );
        },
        label: 'Logout',
        iconData: Icons.logout_sharp,
      ),
    );
  }
}