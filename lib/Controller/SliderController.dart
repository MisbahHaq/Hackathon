import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  var currentIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  void nextPage(int totalSlides) {
    if (currentIndex.value < totalSlides - 1) {
      currentIndex.value++;
      pageController.animateToPage(
        currentIndex.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed('/auth');
    }
  }

  void skip() {
    Get.offAllNamed('/auth');
  }
}
