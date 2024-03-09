import 'package:flutter/material.dart';
import 'package:vi_store/Features/Authentication/Controller_Onboarding/onboarding_controller.dart';

import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Device/device_utility.dart';

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
