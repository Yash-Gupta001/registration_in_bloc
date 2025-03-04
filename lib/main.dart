import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:registration_in_bloc/floor_database/database/app_database.dart';
import 'package:registration_in_bloc/presentation/auth/pages/signup.dart';
import 'package:registration_in_bloc/repository/user_repository.dart';
import 'service locator/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // Initialize dependencies from service locator
    await setup();
    runApp(const MyApp()); 
  } catch (e) {
    print('Failed to initialize app: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(
        database: GetIt.instance<AppDatabase>(),
        userRepository: GetIt.instance<UserRepository>(),
      ),
    );
  }
}