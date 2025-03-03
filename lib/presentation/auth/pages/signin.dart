import 'package:flutter/material.dart';
import 'package:registration_in_bloc/ui/widgets/app_bar.dart';
import 'package:registration_in_bloc/ui/widgets/elevated_button.dart';
import '../../home/user_detail.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'Login',
          leading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'This is the Signin Page',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              // Add other widgets here

              CustomElevatedButton(
                title: 'Login',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Userdetails()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
