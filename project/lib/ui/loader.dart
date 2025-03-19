import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class Loader {
  SimpleFontelicoProgressDialog? progressDialog;

  showDialog(String message) async {
    progressDialog = SimpleFontelicoProgressDialog(context: Get.context!);
    progressDialog!.show(
        message: 'Loading', type: SimpleFontelicoProgressDialogType.normal);
  }

  hideProgress() async {
    if (progressDialog != null) progressDialog!.hide();
  }
}
