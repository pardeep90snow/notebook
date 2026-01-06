import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetController extends GetxController {
  final Connectivity connectivity = Connectivity();

  RxBool isOnline = true.obs;
  StreamSubscription? _sub;

  @override
  void onInit() {
    super.onInit();

    _sub = connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        isOnline.value = false;
      } else {
        isOnline.value = true;
      }
    });
  }

  @override
  void onClose() {
    _sub?.cancel();
    super.onClose();
  }
}
