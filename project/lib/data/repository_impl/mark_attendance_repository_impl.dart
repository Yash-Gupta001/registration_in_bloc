import '../local_database/app_database.dart';
import '../model/user_info.dart';
import '../repository/mark_attendance_repository.dart';

class MarkAttendanceRepositoryImpl implements MarkAttendanceRepository {
  AppDatabase appDatabase;
  MarkAttendanceRepositoryImpl({required this.appDatabase});

  @override
  Future<UserInfo?> getUserInfo() async {
    UserInfo? userInfo = await appDatabase.userDao.getUserInfo();
    return userInfo;
  }
}
