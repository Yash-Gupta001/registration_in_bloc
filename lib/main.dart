import 'package:flutter/material.dart';
import 'package:registration_in_bloc/presentation/auth/pages/signup.dart';
import 'service locator/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize dependency injection from service locator
    await setup();
    runApp(const MyApp());
  } catch (e) {
    // ignore: avoid_print
    print('Failed to initialize app: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
      
    );
  }
}
