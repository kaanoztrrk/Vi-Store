// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Device/device_utility.dart';
import '../../../Controller/Onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: ViDeviceUtils.getAppBarHeigth(),
        right: ViSizes.defaultSpace,
        child: TextButton(
            onPressed: () => OnBoardingController.instance.skipPage(),
            child: const Text("Skip")));
  }
}
