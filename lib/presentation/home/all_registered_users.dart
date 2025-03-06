import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:registration_in_bloc/floor_database/database/app_database.dart';
import 'package:registration_in_bloc/floor_database/entity/user_entity.dart';
import 'package:registration_in_bloc/ui/values/colors/colors.dart';
import 'package:registration_in_bloc/ui/widgets/app_bar.dart';

class AllRegisteredUsers extends StatelessWidget {
  const AllRegisteredUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final dao = GetIt.instance<AppDatabase>().usereDao;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'All Users',
          leading: true,
        ),
        body: Container(
          color: black, // Light background color
          child: FutureBuilder<List<UserEntity>>(
            future: dao.findAllEmployees(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No users found'));
              } else {
                final users = snapshot.data!;
                return Scrollbar(
                  child: ListView.separated(
                    padding: EdgeInsets.all(16), 
                    itemCount: users.length,
                    separatorBuilder: (context, index) => Divider(
                      color: black,
                      thickness: 1,
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Card(
                        elevation: 2, // Add shadow to the card
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16), // Add padding inside the card
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person, color: red), // Add an icon
                                  SizedBox(width: 8), // Add spacing
                                  Text(
                                    'Username: ${user.name}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8), // Add spacing
                              Text(
                                'ID: ${user.id}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: black,
                                ),
                              ),
                              SizedBox(height: 4), // Add spacing
                              Text(
                                'Email: ${user.email}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: black,
                                ),
                              ),
                              SizedBox(height: 4), // Add spacing
                              Text(
                                'Phone: ${user.phone}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: black,
                                ),
                              ),
                              SizedBox(height: 4), // Add spacing
                              Text(
                                'Password: ${user.password}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}