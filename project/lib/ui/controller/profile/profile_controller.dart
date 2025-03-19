import 'package:get/get.dart';
import 'package:rfc_cc/data/repository_impl/profile_repository_impl.dart';
import 'package:rfc_cc/ui/controller/base_controller.dart';

import '../../../data/model/menu_data.dart';
import '../../../data/model/status.dart';
import '../../../data/model/student_info_response.dart';
import '../../../data/model/user_info.dart';
import '../../../data/network/operation_callback.dart';

class ProfileController extends BaseController {
  ProfileRepositoryImpl repository;
  ProfileController({required this.repository});

  var userInfo = Rx<UserInfo?>(null);
  var studentResponse = Rx<StudentInfoResponse?>(null);

  @override
  void onInit() {
    super.onInit();
  }

  getUserInfo() async {
    var user = await repository.getUserInfo();
    userInfo.value = user;
    getStudentDetaile(user!.regNo!);
  }

  List<MenuData> getMenu() {
    const List<MenuData> choices = <MenuData>[
      MenuData(
          title: 'Personal Details',
          icon: 'assets/images/ic_personal_details.png'),
      MenuData(
          title: 'Contact Details',
          icon: 'assets/images/ic_contact_details.png'),
      MenuData(
          title: 'Postel Details', icon: 'assets/images/ic_postel_details.png'),
    ];
    return choices;
  }

  void getStudentDetaile(String regNo) async {
    await repository.getStudentDetaile(
        regNo,
        OperationCallBack<StudentInfoResponse, Status>(
          success: (data) {
            var studentData = StudentInfoResponse.fromJson(data);
            studentResponse.value = studentData;
          },
          error: (data) {
            studentResponse.value = null;
          },
          authenticationError: (data) {
            var status = Status.fromJson(data);
            authnticationFailed.value = status;
          },
          noInternet: (data) {
            noInternet.value = Status.fromJson(data);
          },
        ));
  }
}
