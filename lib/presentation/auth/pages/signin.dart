import 'package:flutter/material.dart';
import 'package:registration_in_bloc/floor_database/database/app_database.dart';
import 'package:registration_in_bloc/presentation/home/user_detail.dart';
import 'package:registration_in_bloc/repository/user_repository.dart';
import 'package:registration_in_bloc/ui/widgets/app_bar.dart';
import 'package:registration_in_bloc/ui/widgets/elevated_button.dart';
import 'package:registration_in_bloc/floor_database/dao/userdao.dart'; // UserDao

class SigninPage extends StatelessWidget {
  final AppDatabase database; // AppDatabase instance
  final UserRepository userRepository; // UserRepository instance

  // Controllers for each TextField
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Accept AppDatabase and UserRepository
  SigninPage({super.key, required this.database, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(title: 'Sign In', leading: false),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Username TextField
                TextField(
                  controller: usernameController,
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
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 30),

                // Login Button
                CustomElevatedButton(
                  title: 'Login',


                  onPressed: () async {
                    String username = usernameController.text;
                    String password = passwordController.text;

                    // Check if all fields are filled
                    if (username.isEmpty || password.isEmpty) {
                      // Show error message if any field is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill all fields')),
                      );
                      return;
                    }

                    // Check if the user exists in the database
                    final UserDao userDao = database.usereDao;
                    final user = await userDao.findUserByusername(username);

                    if (user != null && user.password == password) {
                      // If user is found and password matches, navigate to Userdetails
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Userdetails(user: user), // Pass user to Userdetails
                        ),
                      );
                    } else {
                      // Show error if user not found or password is incorrect
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid username or password')),
                      );
                    }
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
