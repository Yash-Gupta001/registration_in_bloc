class ClassScheduleResponse {
  List<ClassScheduleTable>? classScheduleTable;

  ClassScheduleResponse({
    this.classScheduleTable,
  });

  ClassScheduleResponse.fromJson(Map<String, dynamic> json) {
    if (json['ClassTables'] != null) {
      classScheduleTable = <ClassScheduleTable>[];
      json['ClassTables'].forEach((v) {
        classScheduleTable!.add(ClassScheduleTable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (classScheduleTable != null) {
      data['ClassTables'] = classScheduleTable!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClassScheduleTable {
  String? day;
  List<ClassScheduleList>? classScheduleList;

  ClassScheduleTable({
    this.day,
    this.classScheduleList,
  });

  ClassScheduleTable.fromJson(Map<String, dynamic> json) {
    day = json['Day'];

    if (json['Detail'] != null) {
      classScheduleList = <ClassScheduleList>[];
      json['Detail'].forEach((v) {
        classScheduleList!.add(ClassScheduleList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Day'] = day;

    if (classScheduleList != null) {
      data['Detail'] = classScheduleList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClassScheduleList {
  String? lectureName;
  String? periodDetails;
  String? lectureTime;
  List<ClassScheduleData>? classScheduleDataList;

  ClassScheduleList({
    this.lectureName,
    this.periodDetails,
    this.lectureTime,
    this.classScheduleDataList,
  });

  ClassScheduleList.fromJson(Map<String, dynamic> json) {
    lectureName = json['LectureName'];
    periodDetails = json['PeriodDetails'];
    lectureTime = json['LectureTime'];

    if (json['DetailList'] != null) {
      classScheduleDataList = <ClassScheduleData>[];
      json['DetailList'].forEach((v) {
        v.forEach((d) {
          classScheduleDataList!.add(ClassScheduleData.fromJson(d));
        });
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LectureName'] = lectureName;
    data['PeriodDetails'] = periodDetails;
    data['LectureTime'] = lectureTime;

    if (classScheduleDataList != null) {
      data['DetailList'] =
          classScheduleDataList!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class ClassScheduleData {
  String? type;
  String? key;
  String? value;

  ClassScheduleData({
    this.type,
    this.key,
    this.value,
  });

  ClassScheduleData.fromJson(Map<String, dynamic> json) {
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
