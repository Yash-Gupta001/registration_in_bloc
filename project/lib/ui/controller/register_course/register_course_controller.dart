import 'package:get/get.dart';
import 'package:rfc_cc/data/repository_impl/register_course_repository_impl.dart';
import 'package:rfc_cc/ui/controller/base_controller.dart';
import '../../../data/model/register_courses_response.dart';
import '../../../data/model/status.dart';
import '../../../data/model/user_info.dart';
import '../../../data/network/operation_callback.dart';

class RegisterCourseController extends BaseController {
  RegisterCourseRepositoryImpl repository;
  RegisterCourseController({required this.repository});

  var isRegisterCourseLoading = false.obs;
  var registerCourseDetailList = RxList<RegisterCourseDetail>([]);
  var userInfo = Rx<UserInfo?>(null);

  @override
  void onReady() {
    super.onReady();
    getUserInfo();
  }

  getUserInfo() async {
    var user = await repository.getUserInfo();
    userInfo.value = user;
    getRegisterCourses(user!.regNo!);
  }

  getRegisterCourses(String regNo) async {
    isRegisterCourseLoading.value = true;
    registerCourseDetailList = RxList<RegisterCourseDetail>([]);
    await repository.getStudentregisterCourse(
        regNo,
        OperationCallBack<RegisterCoursesResponse, Status>(
          success: (data) {
            isRegisterCourseLoading.value = false;
            var attendanceBySubject = RegisterCoursesResponse.fromJson(data);
            registerCourseDetailList.value =
                attendanceBySubject.registerCourseDetailList!;
          },
          error: (data) {
            isRegisterCourseLoading.value = false;
            registerCourseDetailList.value = [];
          },
          authenticationError: (data) {
            isRegisterCourseLoading.value = false;
            var status = Status.fromJson(data);
            authnticationFailed.value = status;
          },
          noInternet: (data) {
            isRegisterCourseLoading.value = false;
            noInternet.value = Status.fromJson(data);
          },
        ));
  }
}
