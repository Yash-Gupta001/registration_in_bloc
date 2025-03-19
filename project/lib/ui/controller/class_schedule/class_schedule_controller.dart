import 'package:get/get.dart';
import 'package:rfc_cc/ui/controller/base_controller.dart';

import '../../../data/model/class_schedule_response.dart';
import '../../../data/model/status.dart';
import '../../../data/model/user_info.dart';
import '../../../data/network/operation_callback.dart';
import '../../../data/repository_impl/class_schedule_repository_impl.dart';

class ClassScheduleController extends BaseController {
  ClassScheduleRepositoryImpl repository;

  var isClassScheduleLoading = false.obs;

  ClassScheduleController({required this.repository});

  var classScheduleResponse = RxList<ClassScheduleTable>([]);
  var userInfo = Rx<UserInfo?>(null);

  getUserInfo() async {
    var user = await repository.getUserInfo();
    userInfo.value = user;
    if (user != null) {
      getStudentClassSchedule(user.regNo!, user.sessionNo.toString());
    }
  }

  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }

  getStudentClassSchedule(String regNo, String sessionNo) async {
    classScheduleResponse.clear();
    isClassScheduleLoading.value = true;
    await repository.getStudentClassSchedule(
        regNo,
        sessionNo,
        OperationCallBack<ClassScheduleResponse, Status>(
          success: (data) {
            isClassScheduleLoading.value = false;
            var response = ClassScheduleResponse.fromJson(data);
            classScheduleResponse.addAll(response.classScheduleTable ?? []);
          },
          error: (data) {
            isClassScheduleLoading.value = false;
          },
          authenticationError: (data) {
            isClassScheduleLoading.value = false;
            var status = Status.fromJson(data);
            authnticationFailed.value = status;
          },
          noInternet: (data) {
            isClassScheduleLoading.value = false;
            noInternet.value = Status.fromJson(data);
          },
        ));
    //
  }
}
