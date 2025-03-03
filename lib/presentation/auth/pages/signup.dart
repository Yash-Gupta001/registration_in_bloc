import 'package:flutter/material.dart';
import 'package:registration_in_bloc/presentation/auth/pages/signin.dart';
import 'package:registration_in_bloc/ui/widgets/app_bar.dart'; 
import '../../../ui/widgets/elevated_button.dart'; 

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  // Controllers for each TextField
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'Register', 
          leading: false
        ), 
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Name TextField
                TextField(
                  controller: nameController,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 10),

                // Email TextField
                TextField(
                  controller: emailController,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress, // Email keyboard
                ),
                SizedBox(height: 10),

                // Phone TextField
                TextField(
                  controller: phoneController,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                ), 
                SizedBox(height: 10),

                // Username TextField
                TextField(
                  controller: usernameController,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                ), 
                SizedBox(height: 10),

                // Password TextField
                TextField(
                  controller: passwordController,
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ), 
                SizedBox(height: 10),

                SizedBox(height: 30),
                CustomElevatedButton(
                  title: 'Register', 
                  onPressed: () {
                    // You can gather the values here and pass them to your logic
                    String name = nameController.text;
                    String email = emailController.text;
                    String phone = phoneController.text;
                    String username = usernameController.text;
                    String password = passwordController.text;

                    // For now, navigate to SigninPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
