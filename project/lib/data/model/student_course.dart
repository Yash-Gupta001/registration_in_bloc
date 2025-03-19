class StudentCourse {
  String? courseNo;
  String? courseName;
  String? courseCode;
  String? subId;

  StudentCourse({this.courseNo, this.courseName, this.courseCode, this.subId});

  StudentCourse.fromJson(Map<String, dynamic> json) {
    courseNo = json['CourseNo'];
    courseName = json['CourseName'];
    courseCode = json['CourseCode'];
    subId = json['SubId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CourseNo'] = courseNo;
    data['CourseName'] = courseName;
    data['CourseCode'] = courseCode;
    data['SubId'] = subId;
    return data;
  }
}
