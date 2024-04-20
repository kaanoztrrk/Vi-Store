import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/Widget/Loaders/animation_loader.dart';
import '../Constant/colors.dart';
import '../Helpers/helpers_functions.dart';

class ViFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) => PopScope(
          canPop: false,
          child: Container(
            color: ViHelpersFunctions.isDarkMode(Get.context!)
                ? AppColors.dark
                : AppColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 250),
                ViAnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          )),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
