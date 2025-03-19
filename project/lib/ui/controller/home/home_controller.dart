import 'package:get/get.dart';
import 'package:rfc_cc/data/model/menu_data.dart';
import 'package:rfc_cc/data/model/user_info.dart';
import 'package:rfc_cc/data/repository_impl/home_repository_impl.dart';
import 'package:rfc_cc/ui/controller/base_controller.dart';

/*
  Created By Amol Gahukar 20-11-2024
*/
class HomeController extends BaseController {
  @override
  var currentIndex = 0.obs;

  HomeRepositoryImpl repository;

  var menuData = RxList<MenuData>([]);

  HomeController({required this.repository});

  var userInfo = Rx<UserInfo?>(null);

  @override
  onInit() {
    super.onInit();
  }

  void getMenu(int userType) {
    // const List<MenuData> choices = <MenuData>[
    //   MenuData(title: 'Attendance', icon: 'assets/images/ic_attendance.png'),
    //   MenuData(title: 'Schedule', icon: 'assets/images/ic_schedule.png'),
    //   MenuData(title: 'Course', icon: 'assets/images/ic_register_subjects.png'),
    //   MenuData(title: 'Result', icon: 'assets/images/ic_result.png'),
    //   MenuData(title: 'Mark Attendance', icon: 'assets/images/ic_result.png'),
    //   MenuData(title: 'In Out', icon: 'assets/images/ic_result.png'),
    //   MenuData(title: 'Fees', icon: 'assets/images/ic_result.png'),
    //   MenuData(title: 'Exam Time Table', icon: 'assets/images/ic_result.png'),
    //   MenuData(title: 'Hall Ticket', icon: 'assets/images/ic_result.png'),
    //   MenuData(title: "Pay Slip", icon: 'assets/images/ic_result.png'),
    //   MenuData(title: "Apply Leave", icon: 'assets/images/ic_result.png'),
    //   MenuData(title: "Approve Leave", icon: 'assets/images/ic_result.png'),
    // ];
    // return choices;

    if (userType == 2) {
      menuData.value = getStudentMenu();
    } else if (userType == 3) {
      menuData.value = getFacultyMenu();
    } else if (userType == 1) {
      menuData.value = getAdminMenu();
    }
  }

  List<MenuData> getStudentMenu() {
    const List<MenuData> studentMenu = <MenuData>[
      MenuData(title: 'Attendance', icon: 'assets/images/ic_attendance.png'),
      MenuData(title: 'Schedule', icon: 'assets/images/ic_schedule.png'),
      MenuData(title: 'Course', icon: 'assets/images/ic_register_subjects.png'),
      MenuData(title: 'Result', icon: 'assets/images/ic_result.png'),
      MenuData(title: 'Fees', icon: 'assets/images/ic_result.png'),
      MenuData(title: 'Exam Time Table', icon: 'assets/images/ic_result.png'),
      MenuData(title: 'Hall Ticket', icon: 'assets/images/ic_result.png'),
    ];
    return studentMenu;
  }

  List<MenuData> getFacultyMenu() {
    const List<MenuData> facultyMenu = <MenuData>[
      MenuData(title: 'Schedule', icon: 'assets/images/ic_schedule.png'),
      MenuData(title: 'Mark Attendance', icon: 'assets/images/ic_result.png'),
      MenuData(title: 'In Out', icon: 'assets/images/ic_result.png'),
      MenuData(title: "Pay Slip", icon: 'assets/images/ic_result.png'),
      MenuData(title: "Apply Leave", icon: 'assets/images/ic_result.png'),
      MenuData(title: "Approve Leave", icon: 'assets/images/ic_result.png'),
    ];
    return facultyMenu;
  }

  List<MenuData> getAdminMenu() {
    const List<MenuData> adminMenu = <MenuData>[
      MenuData(title: 'In Out', icon: 'assets/images/ic_result.png'),
      MenuData(title: "Pay Slip", icon: 'assets/images/ic_result.png'),
      MenuData(title: "Apply Leave", icon: 'assets/images/ic_result.png'),
      MenuData(title: "Approve Leave", icon: 'assets/images/ic_result.png'),
    ];
    return adminMenu;
  }

  getUserInfo() async {
    var user = await repository.getUserInfo();
    userInfo.value = user;
    getMenu(int.parse(user?.uaType ?? "0"));
  }
}
