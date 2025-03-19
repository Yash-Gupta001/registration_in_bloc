import 'package:rfc_cc/data/model/status.dart';
import 'package:rfc_cc/data/model/user_info.dart';

class Initial extends Status {
  UserInfo? userInfo;

  Initial({this.userInfo});

  Initial.fromJson(Map<String, dynamic> json) {
    userInfo =
        json['UserInfo'] != null ? UserInfo.fromJson(json['UserInfo']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userInfo != null) {
      data['UserInfo'] = userInfo!.toJson();
    }
    return data;
  }
}
