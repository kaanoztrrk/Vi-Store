import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Views/Login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //* Variables

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  //* Update Current Index whren Page Scroll
  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  //* Jump to the spesific dot selected page
  void doNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //* Update Current Index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginPage());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //* Update Current Index & jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpTo(2);
  }
}
