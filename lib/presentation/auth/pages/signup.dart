import 'package:flutter/material.dart';
import 'package:registration_in_bloc/floor_database/database/app_database.dart';
import 'package:registration_in_bloc/repository/user_repository.dart'; 
import 'package:registration_in_bloc/presentation/auth/pages/signin.dart';
import 'package:registration_in_bloc/ui/widgets/app_bar.dart';
import 'package:registration_in_bloc/ui/widgets/floatingaction_button.dart';
import '../../../floor_database/entity/user_entity.dart';
import '../../../ui/widgets/elevated_button.dart';

class SignupPage extends StatelessWidget {
  final AppDatabase database; // AppDatabase instance
  final UserRepository userRepository; // UserRepository instance

  // Controllers for each TextField
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Accept AppDatabase and UserRepository
  SignupPage({super.key, required this.database, required this.userRepository}); 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(title: 'Register', leading: false),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Name TextField
                TextField(
                  controller: nameController,
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
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),

                // Phone TextField
                TextField(
                  controller: phoneController,
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

                // Register Button
                CustomElevatedButton(
                  title: 'Register',
                  onPressed: () async {
                    // Gather the values from the TextControllers
                    String name = nameController.text;
                    String email = emailController.text;
                    String phone = phoneController.text;
                    String username = usernameController.text;
                    String password = passwordController.text;

                    // Check if all fields are filled
                    if (name.isEmpty || email.isEmpty || phone.isEmpty || username.isEmpty || password.isEmpty) {
                      // Show an error message if any field is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill all fields')),
                      );
                      return;
                    }

                    // Create a UserEntity instance
                    final newUser = UserEntity(
                      name: name,
                      email: email,
                      phone: phone,
                      username: username,
                      password: password,
                    );

                    // Insert the user into the database using UserDao
                    try {
                      // Ensure you access UserDao correctly from database
                      final userDao = database.usereDao;
                      await userDao.insertUser(newUser);

                      // Navigate to SigninPage after successful registration
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SigninPage(database: database, userRepository: userRepository,)),
                      );
                    } catch (e) {
                      print("Error inserting user: $e");
                      // Show a SnackBar with an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error registering user: $e')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SigninPage(database: database, userRepository: userRepository)),
            (route) => false,
          );
        },
        label: 'Already have an account? Login',
        iconData: Icons.login_sharp,
      ),
      ),
    );
  }
}
