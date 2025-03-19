import 'package:rfc_cc/data/model/status.dart';

class AttendanceCountResponse extends Status {
  String? percentage;

  AttendanceCountResponse({this.percentage});

  AttendanceCountResponse.fromJson(Map<String, dynamic> json) {
    percentage = json['percentage'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['percentage'] = percentage;
    return data;
  }
}
