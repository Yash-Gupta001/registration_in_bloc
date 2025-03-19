import 'package:rfc_cc/data/model/status.dart';

class StudentInfoResponse extends Status {
  String? studentName;
  String? photo;
  String? collegeLogo;
  String? regNo;
  String? semester;
  String? course;
  String? subcollegeName;
  String? emailID;
  String? mobileNo;
  List<StudentData>? studentInfo;
  List<StudentData>? contactInfo;
  List<StudentData>? postalInfo;

  StudentInfoResponse(
      {this.studentName,
      this.photo,
      this.collegeLogo,
      this.regNo,
      this.semester,
      this.course,
      this.subcollegeName,
      this.emailID,
      this.mobileNo,
      this.studentInfo,
      this.contactInfo,
      this.postalInfo});

  StudentInfoResponse.fromJson(Map<String, dynamic> json) {
    studentName = json['StudentName'];
    photo = json['Photo'];
    collegeLogo = json['CollegeLogo'];
    regNo = json['RegNo'];
    semester = json['Semester'];
    course = json['Course'];
    subcollegeName = json['SubcollegeName'];
    emailID = json['EmailID'];
    mobileNo = json['MobileNo'];
    if (json['StudentInfo'] != null) {
      studentInfo = <StudentData>[];
      json['StudentInfo'].forEach((v) {
        studentInfo!.add(StudentData.fromJson(v));
      });
    }
    if (json['ContactInfo'] != null) {
      contactInfo = <StudentData>[];
      json['ContactInfo'].forEach((v) {
        contactInfo!.add(StudentData.fromJson(v));
      });
    }
    if (json['PostalInfo'] != null) {
      postalInfo = <StudentData>[];
      json['PostalInfo'].forEach((v) {
        postalInfo!.add(StudentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StudentName'] = studentName;
    data['Photo'] = photo;
    data['CollegeLogo'] = collegeLogo;
    data['RegNo'] = regNo;
    data['Semester'] = semester;
    data['Course'] = course;
    data['SubcollegeName'] = subcollegeName;
    data['EmailID'] = emailID;
    data['MobileNo'] = mobileNo;
    if (studentInfo != null) {
      data['StudentInfo'] = studentInfo!.map((v) => v.toJson()).toList();
    }

    if (contactInfo != null) {
      data['ContactInfo'] = contactInfo!.map((v) => v.toJson()).toList();
    }
    if (postalInfo != null) {
      data['PostalInfo'] = postalInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentData {
  String? type;
  String? key;
  String? value;

  StudentData({this.type, this.key, this.value});

  StudentData.fromJson(Map<String, dynamic> json) {
    type = json['Type'];
    key = json['Key'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Type'] = type;
    data['Key'] = key;
    data['Value'] = value;
    return data;
  }
}
