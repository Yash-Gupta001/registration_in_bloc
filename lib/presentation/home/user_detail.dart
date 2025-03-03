import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:registration_in_bloc/ui/widgets/app_bar.dart';
import '../../ui/widgets/floatingaction_button.dart';
import '../auth/pages/signup.dart';

class Userdetails extends StatelessWidget {
  const Userdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'User Details',
        leading: false,
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('press again to exit'),
        ),
        child: Center(
          child: Text('User details'),
        ),
      ),

      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignupPage()),
            (route) => false,
          );
        },
        
        label: 'Logout',
        iconData: Icons.logout_sharp,
      ),
    );
  }
}
