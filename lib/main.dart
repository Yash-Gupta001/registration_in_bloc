import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:registration_in_bloc/floor_database/database/app_database.dart';
import 'package:registration_in_bloc/presentation/auth/pages/signup.dart';
import 'package:registration_in_bloc/repository/user_repository.dart';

import 'service locator/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await setup(); // Ensure dependencies are set up
    runApp(const MyApp());
  } catch (e) {
    // Handle the error in case setup fails
    runApp(const MyApp(isError: true));
  }
}

class MyApp extends StatelessWidget {
  final bool isError;

  const MyApp({super.key, this.isError = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isError
          ? Scaffold(body: 
          Center(
            child: Text(
              "Failed to load app, please try again later."
              )))
          : SignupPage(
              database: GetIt.instance<AppDatabase>(),
              userRepository: GetIt.instance<UserRepository>(),
            ),
    );
  }
}
