import 'package:floor/floor.dart';

@Entity(tableName: 'user')
class UserInfo {
  @PrimaryKey(autoGenerate: true)
  int? id = 0;
  String? batchNo;
  String? sectionNo;
  String? semesterNo;
  String? branchNo;
  String? currentSemesterName;
  String? currentSemesterNo;
  String? currentSessionName;
  String? currentSessionNo;
  int? uaStatus;
  String? subCollegeName;
  String? organizationId;
  String? collegeId;
  String? mobileNo;
  String? email;
  String? regNo;
  String? uaNo;
  String? idNo;
  String? userName;
  String? uaType;
  String? uaDesignation;
  String? degreeName;
  bool? isFirstLogin;
  String? branchName;
  String? semesterName;
  String? collegeName;
  String? collegeLogo;
  String? sessionName;
  int? sessionNo;
  String? token;
  int? collegeCode;
  String? enrollmentNo;
  String? password;

  UserInfo(
      {this.id,
      this.batchNo,
      this.sectionNo,
      this.semesterNo,
      this.branchNo,
      this.currentSemesterName,
      this.currentSemesterNo,
      this.currentSessionName,
      this.currentSessionNo,
      this.uaStatus,
      this.subCollegeName,
      this.organizationId,
      this.collegeId,
      this.mobileNo,
      this.email,
      this.regNo,
      this.uaNo,
      this.idNo,
      this.userName,
      this.uaType,
      this.uaDesignation,
      this.degreeName,
      this.isFirstLogin,
      this.branchName,
      this.semesterName,
      this.collegeName,
      this.collegeLogo,
      this.sessionName,
      this.sessionNo,
      this.token,
      this.collegeCode,
      this.enrollmentNo,
      this.password});

  UserInfo.fromJson(Map<String, dynamic> json) {
    batchNo = json['BatchNo'];
    sectionNo = json['SectionNo'];
    semesterNo = json['SemesterNo'];
    branchNo = json['BranchNo'];
    currentSemesterName = json['currentSemesterName'];
    currentSemesterNo = json['currentSemesterNo'];
    currentSessionName = json['currentSessionName'];
    currentSessionNo = json['currentSessionNo'];
    uaStatus = json['UA_STATUS'];
    subCollegeName = json['SubCollegeName'];
    organizationId = json['OrganizationId'];
    collegeId = json['CollegeId'];
    mobileNo = json['MobileNo'];
    email = json['Email'];
    regNo = json['RegNo'];
    uaNo = json['UaNo'];
    idNo = json['IdNo'];
    userName = json['UserName'];
    uaType = json['UaType'];
    uaDesignation = json['UaDesignation'];
    degreeName = json['DegreeName'];
    isFirstLogin = json['IsFirstLogin'];
    branchName = json['BranchName'];
    semesterName = json['SemesterName'];
    collegeName = json['CollegeName'];
    collegeLogo = json['CollegeLogo'];
    sessionName = json['SessionName'];
    sessionNo = json['SessionNo'];
    token = json['Token'];
    collegeCode = json['CollegeCode'];
    enrollmentNo = json['EnrollmentNo'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BatchNo'] = batchNo;
    data['SectionNo'] = sectionNo;
    data['SemesterNo'] = semesterNo;
    data['BranchNo'] = branchNo;
    data['currentSemesterName'] = currentSemesterName;
    data['currentSemesterNo'] = currentSemesterNo;
    data['currentSessionName'] = currentSessionName;
    data['currentSessionNo'] = currentSessionNo;
    data['UA_STATUS'] = uaStatus;
    data['SubCollegeName'] = subCollegeName;
    data['OrganizationId'] = organizationId;
    data['CollegeId'] = collegeId;
    data['MobileNo'] = mobileNo;
    data['Email'] = email;
    data['RegNo'] = regNo;
    data['UaNo'] = uaNo;
    data['IdNo'] = idNo;
    data['UserName'] = userName;
    data['UaType'] = uaType;
    data['UaDesignation'] = uaDesignation;
    data['DegreeName'] = degreeName;
    data['IsFirstLogin'] = isFirstLogin;
    data['BranchName'] = branchName;
    data['SemesterName'] = semesterName;
    data['CollegeName'] = collegeName;
    data['CollegeLogo'] = collegeLogo;
    data['SessionName'] = sessionName;
    data['SessionNo'] = sessionNo;
    data['Token'] = token;
    data['CollegeCode'] = collegeCode;
    data['EnrollmentNo'] = enrollmentNo;
    data['Password'] = password;
    return data;
  }
}
