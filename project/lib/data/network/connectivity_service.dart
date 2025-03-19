import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';



class ConnectivityService  {
      //final RxBool isConnected = false.obs;
  final Connectivity _connectivity = Connectivity();
  //late StreamSubscription<List<ConnectivityResult>> _subscription;

  // Future<bool> init() async {
  //   _checkInitialConnection();
  //   _subscription = _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
  //     final isConnectedNow = results.any((result) => result != ConnectivityResult.none);
  //     _updateConnectionStatus(isConnectedNow);
  //   });
  //   return this;
  // }

  Future<bool> isInternetAvailable() async {
    final results = await _connectivity.checkConnectivity();
    final isConnectedNow = results.any((result) => result != ConnectivityResult.none);
    return isConnectedNow;
  }

  // void _updateConnectionStatus(bool isConnectedNow) {
  //   isConnected.value = isConnectedNow;

  //   // if (!isConnected.value) {
  //   //   Get.to(NoInternetPage()); // Navigate to no internet page
  //   // } else {
  //   //   Get.back();
  //   // }
  // }



  Future<bool> checkInternetConnection() async {
    var isConnected = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      isConnected = result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isConnected = false;
    }
    return isConnected;
  } 

}
