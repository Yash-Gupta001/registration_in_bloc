class StudInfo {
  String? studentName;
  String? branch;
  String? semester;
  String? regNo;
  String? rollNo;
  String? semesterNo;
  String? schemename;
  String? degreeName;

  StudInfo(
      {this.studentName,
      this.branch,
      this.semester,
      this.regNo,
      this.rollNo,
      this.semesterNo,
      this.schemename,
      this.degreeName});

  StudInfo.fromJson(Map<String, dynamic> json) {
    studentName = json['StudentName'];
    branch = json['Branch'];
    semester = json['Semester'];
    regNo = json['RegNo'];
    rollNo = json['RollNo'];
    semesterNo = json['SemesterNo'];
    schemename = json['Schemename'];
    degreeName = json['DegreeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StudentName'] = studentName;
    data['Branch'] = branch;
    data['Semester'] = semester;
    data['RegNo'] = regNo;
    data['RollNo'] = rollNo;
    data['SemesterNo'] = semesterNo;
    data['Schemename'] = schemename;
    data['DegreeName'] = degreeName;
    return data;
  }
}
