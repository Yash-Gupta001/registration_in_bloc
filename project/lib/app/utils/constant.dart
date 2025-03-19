/*
  Constant use for Constant data like api end point, logos etc.
  Created By Amol Gahukar 15-11-2024
*/

class Constant {
  static const String blobLink =
      "https://rfcappstorage.blob.core.windows.net/rfcapplogo/";

  static const String flavor = String.fromEnvironment('FLAVOR');

  static const String splashLogo = "$blobLink$flavor/ic_splash_logo.png";
  static const String loginLogo = "$blobLink$flavor/ic_login_logo.png";
  static const String loginProfileBack =
      "$blobLink$flavor/ic_profile_bg_image.png";

  static String fromUrlEncode = "application/x-www-form-urlencoded";
  static String login = "initial/authv3";
  static String getAttendance = "attendance/att";
  static String getAttendanceCount = "Attendance/getStudentPercentageDetails";
  static String getRegisterCourses = "initial/registeredCourses";
  static String getAttendanceBySubject = "attendance/attsub";
  static String getStudentClassSchedule = "schedule/student";
  static String getStudentInformation = "information/studV2";
}
