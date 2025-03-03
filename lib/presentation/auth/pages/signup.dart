import 'package:flutter/material.dart';
import 'package:registration_in_bloc/presentation/auth/pages/signin.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('this is SignupPage page'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SigninPage()),
        );
      },
      child: Text("login"),
      ),
    );
  }
}
