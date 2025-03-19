import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/utils/color_config.dart';
import '../../data/network/connectivity_service.dart';



class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final connectivityService = Get.find<ConnectivityService>();

    return PopScope(
      canPop: false, 
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.wifi_off, size: 80, color: ColorConfig.redColor),
              const SizedBox(height: 20),
              const Text("No Internet Connection",
                  style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (await connectivityService.isInternetAvailable()) {
                    Get.back(result: true);
                  }
                },
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
