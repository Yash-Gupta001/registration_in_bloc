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
          title: 'All users', 
          leading: true
          ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FutureBuilder<List<UserEntity>>(
                  future: dao.findAllEmployees(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text('No users found');
                    } else {
                      final users = snapshot.data!;
                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return ListTile(
                            title: Text(
                              'username: ${user.name}',
                              style: TextStyle(
                                fontSize: 20,
                                color: red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              ' email: ${user.email}\n phone: ${user.phone}\n password: ${user.password}',
                              style: TextStyle(
                                fontSize: 16,
                                color: black,
                              )
                              ,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}