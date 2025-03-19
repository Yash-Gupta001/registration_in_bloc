class AttendanceBySubject {
  String? attDate;
  String? attStatus;
  String? period;

  AttendanceBySubject({
    this.attDate,
    this.attStatus,
    this.period,
  });
  AttendanceBySubject.fromJson(Map<String, dynamic> json) {
    attDate = json['AttDate'];
    attStatus = json['AttStatus'];
    period = json['Period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AttDate'] = attDate;
    data['AttStatus'] = attStatus;
    data['Period'] = period;
    return data;
  }
}
