import 'package:get_it/get_it.dart';
import 'package:registration_in_bloc/floor_database/database/app_database.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // Initialize the database
  getIt.registerSingletonAsync<AppDatabase>(() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return database;
  });

  // Ensure the database is initialized before registering other dependencies
  await getIt.isReady<AppDatabase>();
}
