import 'package:rfc_cc/data/model/attendance_detail_by_subject.dart';
import 'package:rfc_cc/data/model/status.dart';
import 'package:rfc_cc/data/model/stud_info.dart';

class AttendanceDetailResponse extends Status {
  bool? duplicationAttPresent;
  StudInfo? studInfo;
  List<AttendanceBySubject>? attendanceBySubject;

  AttendanceDetailResponse({
    this.duplicationAttPresent,
    this.studInfo,
    this.attendanceBySubject,
  });

  AttendanceDetailResponse.fromJson(Map<String, dynamic> json) {
    duplicationAttPresent = json['DuplicationAttPresent'];

    studInfo =
        json['StudInfo'] != null ? StudInfo.fromJson(json['StudInfo']) : null;

    if (json['AttendanceBySubject'] != null) {
      attendanceBySubject = <AttendanceBySubject>[];
      json['AttendanceBySubject'].forEach((v) {
        attendanceBySubject!.add(AttendanceBySubject.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['DuplicationAttPresent'] = duplicationAttPresent;

    if (studInfo != null) {
      data['StudInfo'] = studInfo!.toJson();
    }

    if (attendanceBySubject != null) {
      data['AttendanceBySubject'] =
          attendanceBySubject!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
