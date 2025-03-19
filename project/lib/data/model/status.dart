class Status {
  String? message;
  int? id;
  bool? isErrorInService;

  Status({this.message, this.id, this.isErrorInService});

  Status.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    id = json['Id'];
    isErrorInService = json['IsErrorInService'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    data['Id'] = id;
    data['IsErrorInService'] = isErrorInService;
    return data;
  }
}
