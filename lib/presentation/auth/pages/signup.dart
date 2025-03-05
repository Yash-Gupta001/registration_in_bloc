import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_in_bloc/bloc/register/register_bloc.dart';
import 'package:registration_in_bloc/bloc/register/register_event.dart';
import 'package:registration_in_bloc/bloc/register/register_state.dart';
import 'package:registration_in_bloc/floor_database/database/app_database.dart';
import 'package:registration_in_bloc/floor_database/entity/user_entity.dart';
import 'package:registration_in_bloc/presentation/auth/pages/signin.dart';
import 'package:registration_in_bloc/repository/user_repository.dart';
import 'package:registration_in_bloc/ui/widgets/app_bar.dart';
import 'package:registration_in_bloc/ui/widgets/elevated_button.dart';
import 'package:registration_in_bloc/ui/widgets/floatingaction_button.dart';

class SignupPage extends StatelessWidget {
  final AppDatabase database;
  final UserRepository userRepository;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignupPage({super.key, required this.database, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(userRepository: userRepository),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              appBar: CustomAppbar(title: 'Register', leading: false),
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Center(
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

                            // // Check if all fields are filled
                            if (name.isEmpty || email.isEmpty || phone.isEmpty || username.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please fill all fields')),
                              );
                              return;
                            }

                            // Create a new UserEntity instance
                            final newUser = UserEntity(
                              name: name,
                              email: email,
                              phone: phone,
                              username: username,
                              password: password,
                            );

                            // Dispatch RegisterButtonPressed event
                            context.read<RegisterBloc>().add(RegisterButtonPressed(user: newUser));
                          },
                        ),
                        // Listen to the state to show loading, success, or failure
                        BlocListener<RegisterBloc, RegisterState>(
                          listener: (context, state) {
                            if (state is RegisterLoading) {
                              // Show loading indicator
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Registering...')),
                              );
                            } else if (state is RegisterSuccess) {
                              // On success, navigate to the SignIn page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SigninPage(
                                    database: database,
                                    userRepository: userRepository,
                                  ),
                                ),
                              );
                            } else if (state is RegisterFailure) {
                              // Show error message if registration fails
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error: ${state.error}')),
                              );
                            }
                          },
                          child: Container(), // Empty child as we're using it for state listening only
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton: CustomFloatingActionButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SigninPage(
                        database: database,
                        userRepository: userRepository,
                      ),
                    ),
                    (route) => false,
                  );
                },
                label: 'Login',
                iconData: Icons.login_sharp,
              ),
            ),
          );
        },
      ),
    );
  }
}