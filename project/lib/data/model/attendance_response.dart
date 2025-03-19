import 'package:rfc_cc/data/model/attendance_detail_by_subject.dart';
import 'package:rfc_cc/data/model/attendance_details.dart';
import 'package:rfc_cc/data/model/status.dart';
import 'package:rfc_cc/data/model/stud_info.dart';
import 'package:rfc_cc/data/model/student_course.dart';

class AttendanceResponse extends Status {
  StudInfo? studInfo;
  List<AttendanceDetails>? attendanceDetails;
  List<AttendanceBySubject>? attendanceBySubject;
  List<StudentCourse>? studentCourses;

  AttendanceResponse({
    this.studInfo,
    this.attendanceDetails,
    this.attendanceBySubject,
    this.studentCourses,
  });

  AttendanceResponse.fromJson(Map<String, dynamic> json) {
    studInfo =
        json['StudInfo'] != null ? StudInfo.fromJson(json['StudInfo']) : null;

    if (json['AttendanceDetails'] != null) {
      attendanceDetails = <AttendanceDetails>[];
      json['AttendanceDetails'].forEach((v) {
        attendanceDetails!.add(AttendanceDetails.fromJson(v));
      });
    }

    if (json['AttendanceBySubject'] != null) {
      attendanceBySubject = <AttendanceBySubject>[];
      json['AttendanceBySubject'].forEach((v) {
        attendanceBySubject!.add(AttendanceBySubject.fromJson(v));
      });
    }

    if (json['StudentCourses'] != null) {
      studentCourses = <StudentCourse>[];
      json['StudentCourses'].forEach((v) {
        studentCourses!.add(StudentCourse.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (studInfo != null) {
      data['StudInfo'] = studInfo!.toJson();
    }
    if (attendanceDetails != null) {
      data['AttendanceDetails'] =
          attendanceDetails!.map((v) => v.toJson()).toList();
    }
    if (attendanceBySubject != null) {
      data['AttendanceBySubject'] =
          attendanceBySubject!.map((v) => v.toJson()).toList();
    }
    if (studentCourses != null) {
      data['StudentCourses'] = studentCourses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
