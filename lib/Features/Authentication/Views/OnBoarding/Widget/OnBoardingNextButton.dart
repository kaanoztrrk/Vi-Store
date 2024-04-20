// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Device/device_utility.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';
import '../../../Controller/Onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Positioned(
        right: ViSizes.defaultSpace,
        bottom: ViDeviceUtils.getBottomNavigationBarHeigth(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? AppColors.primary : AppColors.black,
          ),
          onPressed: () => OnBoardingController.instance.nextPage(),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
