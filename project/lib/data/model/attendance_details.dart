class AttendanceDetails {
  String? semester;
  String? courseNo;
  String? courseName;
  int? totalClass;
  int? present;
  int? absent;
  double? percentage;
  String? uaName;

  AttendanceDetails(
      {this.semester,
      this.courseNo,
      this.courseName,
      this.totalClass,
      this.present,
      this.absent,
      this.percentage,
      this.uaName});

  AttendanceDetails.fromJson(Map<String, dynamic> json) {
    semester = json['Semester'];
    courseNo = json['CourseNo'];
    courseName = json['Course_Name'];
    totalClass = json['Total_Class'];
    present = json['Present'];
    absent = json['Absent'];
    percentage = json['Percentage'];
    uaName = json['UaName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Semester'] = semester;
    data['CourseNo'] = courseNo;
    data['Course_Name'] = courseName;
    data['Total_Class'] = totalClass;
    data['Present'] = present;
    data['Absent'] = absent;
    data['Percentage'] = percentage;
    data['UaName'] = uaName;
    return data;
  }
}
