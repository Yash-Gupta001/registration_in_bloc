import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_in_bloc/floor_database/database/app_database.dart';
import 'package:registration_in_bloc/presentation/home/user_detail.dart';
import 'package:registration_in_bloc/repository/user_repository.dart';
import 'package:registration_in_bloc/ui/widgets/app_bar.dart';
import 'package:registration_in_bloc/ui/widgets/elevated_button.dart';
import 'package:registration_in_bloc/bloc/login/login_bloc.dart';
import 'package:registration_in_bloc/bloc/login/login_event.dart';
import 'package:registration_in_bloc/bloc/login/login_state.dart';

class SigninPage extends StatelessWidget {
  final AppDatabase database;
  final UserRepository userRepository;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SigninPage({super.key, required this.database, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Create and provide the LoginBloc
      create: (context) => LoginBloc(userRepository: userRepository),
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppbar(title: 'Sign In', leading: false),
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

                    // BlocConsumer to handle states
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error)),
                          );
                        }
                        if (state is LoginSuccess) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Userdetails(user: state.user),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return CircularProgressIndicator();
                        }

                        return CustomElevatedButton(
                          title: 'Login',
                          onPressed: () {
                            String username = usernameController.text;
                            String password = passwordController.text;

                            // Validate input fields
                            if (username.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please fill all fields')),
                              );
                              return;
                            }
                            // Dispatch the LoginButtonPressed event
                            context.read<LoginBloc>().add(
                                  LoginButtonPressed(
                                    username: username,
                                    password: password,
                                  ),
                                );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}