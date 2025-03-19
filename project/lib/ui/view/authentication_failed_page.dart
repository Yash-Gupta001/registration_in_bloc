import 'package:flutter/material.dart';
import 'package:rfc_cc/ui/controller/auth/authentication_failed_controller.dart';
import 'package:rfc_cc/ui/view/base_view.dart';

class AuthenticationFailedPage extends BaseView<AuthFailedController> {
  const AuthenticationFailedPage({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text("Autnehication Failed"),
    );
  }

  @override
  String titleName() {
    return "";
  }
}
