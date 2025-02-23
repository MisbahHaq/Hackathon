import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 03), () {
      Get.offNamed('/Slider');
    });
  }
}
