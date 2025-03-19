import 'initial.dart';

class RegisterCoursesResponse extends Initial {
  List<RegisterCourseDetail>? registerCourseDetailList;

  RegisterCoursesResponse({
    this.registerCourseDetailList,
  });

  RegisterCoursesResponse.fromJson(Map<String, dynamic> json) {
    if (json['RegisterCourse'] != null) {
      registerCourseDetailList = <RegisterCourseDetail>[];
      json['RegisterCourse'].forEach((v) {
        registerCourseDetailList!.add(RegisterCourseDetail.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (registerCourseDetailList != null) {
      data['RegisterCourse'] =
          registerCourseDetailList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RegisterCourseDetail {
  String? subName;
  String? regNo;
  String? semesterNo;
  String? semesterName;
  String? courseName;
  String? subId;
  String? ccode;
  String? register;
  String? accepted;
  String? detaind;
  String? studExamReg;
  String? examReg;
  String? sessionName;

  RegisterCourseDetail({
    this.subName,
    this.regNo,
    this.semesterNo,
    this.semesterName,
    this.courseName,
    this.subId,
    this.ccode,
    this.register,
    this.accepted,
    this.detaind,
    this.studExamReg,
    this.examReg,
    this.sessionName,
  });

  RegisterCourseDetail.fromJson(Map<String, dynamic> json) {
    subName = json['SubName'];
    regNo = json['RegNo'];
    semesterNo = json['SemesterNo'];
    semesterName = json['SemesterName'];
    courseName = json['CourseName'];
    subId = json['SubId'];
    ccode = json['Ccode'];
    register = json['Register'];
    accepted = json['Accepted'];
    detaind = json['Detaind'];
    studExamReg = json['StudExamReg'];
    examReg = json['ExamReg'];
    sessionName = json['SessionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SubName'] = subName;
    data['RegNo'] = regNo;
    data['SemesterNo'] = semesterNo;
    data['SemesterName'] = semesterName;
    data['CourseName'] = courseName;
    data['SubId'] = subId;
    data['Ccode'] = ccode;
    data['Register'] = register;
    data['Accepted'] = accepted;
    data['Detaind'] = detaind;
    data['StudExamReg'] = studExamReg;
    data['ExamReg'] = examReg;
    data['SessionName'] = sessionName;
    return data;
  }
}
