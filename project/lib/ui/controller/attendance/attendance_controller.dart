import 'package:get/get.dart';
import 'package:rfc_cc/data/model/attendance_response.dart';
import 'package:rfc_cc/data/model/status.dart';
import 'package:rfc_cc/data/model/stud_info.dart';
import 'package:rfc_cc/data/model/user_info.dart';
import 'package:rfc_cc/data/network/operation_callback.dart';
import 'package:rfc_cc/ui/controller/base_controller.dart';

import '../../../data/model/attendance_count_response.dart';
import '../../../data/model/attendance_detail_by_subject.dart';
import '../../../data/model/attendance_detail_response.dart';
import '../../../data/model/attendance_details.dart';
import '../../../data/repository_impl/attendance_repository_impl.dart';

/*
  Created By Amol Gahukar 20-11-2024
*/
class AttendanceController extends BaseController {
  AttendanceRepositoryImpl repository;
  AttendanceController({required this.repository});
  var studInfo = Rx<StudInfo?>(null);
  var studentPercentage = Rx<AttendanceCountResponse?>(null);
  var userInfo = Rx<UserInfo?>(null);

  var attendanceBySubjectList = RxList<AttendanceBySubject>([]);
  var attendanceDetails = Rx<List<AttendanceDetails>?>(null);

  var isAttedanceLoading = false.obs;
  var isAttSubLoading = false.obs;

  @override
  void onInit() {
    getUserInfo();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getUserInfo();
  }

  getUserInfo() async {
    var user = await repository.getUserInfo();
    userInfo.value = user;
  }

  void getAttendanceDetail(
      String regNo, String? courseId, String sessionNo) async {
    attendanceBySubjectList = RxList<AttendanceBySubject>([]);
    isAttSubLoading.value = true;
    await repository.getAttendanceDetail(
        regNo,
        courseId!,
        sessionNo,
        OperationCallBack<AttendanceCountResponse, Status>(
          success: (data) {
            isAttSubLoading.value = false;
            var attendanceBySubject = AttendanceDetailResponse.fromJson(data);
            attendanceBySubjectList.value =
                attendanceBySubject.attendanceBySubject!;
          },
          error: (data) {
            isAttSubLoading.value = false;
            attendanceBySubjectList.value = [];
          },
          authenticationError: (data) {
            isAttSubLoading.value = false;
            var status = Status.fromJson(data);
            authnticationFailed.value = status;
          },
          noInternet: (data) {
            isAttSubLoading.value = false;
            noInternet.value = Status.fromJson(data);
          },
        ));
  }

  void getAttendanceCount(String regNo) async {
    await repository.getAttendanceCount(
        regNo,
        OperationCallBack<AttendanceCountResponse, Status>(
          success: (data) {
            var attendanceCountResponse =
                AttendanceCountResponse.fromJson(data);
            studentPercentage.value = attendanceCountResponse;
          },
          error: (data) {},
          authenticationError: (data) {
            var status = Status.fromJson(data);
            authnticationFailed.value = status;
          },
          noInternet: (data) {
            noInternet.value = Status.fromJson(data);
          },
        ));
  }

  void getAttendance(String regNo) async {
    attendanceDetails = Rx<List<AttendanceDetails>>([]);
    isAttedanceLoading.value = true;
    await repository.getAttendance(
        regNo,
        OperationCallBack<AttendanceResponse, Status>(
          success: (data) {
            isAttedanceLoading.value = false;
            var newPaging = AttendanceResponse.fromJson(data);
            studInfo.value = newPaging.studInfo!;
            attendanceDetails.value = newPaging.attendanceDetails;
          },
          error: (data) {
            isAttedanceLoading.value = false;
          },
          authenticationError: (data) {
            isAttedanceLoading.value = false;
            var status = Status.fromJson(data);
            authnticationFailed.value = status;
          },
          noInternet: (data) {
            isAttedanceLoading.value = false;
            noInternet.value = Status.fromJson(data);
          },
        ));
  }
}
