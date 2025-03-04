import 'package:get_it/get_it.dart';
import 'package:registration_in_bloc/floor_database/database/app_database.dart';
import 'package:registration_in_bloc/floor_database/dao/userdao.dart';
import 'package:registration_in_bloc/repository/user_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // Register AppDatabase
  getIt.registerLazySingletonAsync<AppDatabase>(() async {
    return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  });

  // Register UserDao
  getIt.registerLazySingleton<UserDao>(() => getIt<AppDatabase>().usereDao);

  // Register UserRepository
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(userDao: getIt<UserDao>()));

  // Ensure AppDatabase is ready before continuing
  await getIt.isReady<AppDatabase>();
}