import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Features/Authentication/Controller_Onboarding/onboarding_controller.dart';

import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Device/device_utility.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

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
            shape: CircleBorder(),
            backgroundColor: dark ? AppColors.primary : AppColors.black,
          ),
          onPressed: () => OnBoardingController.instance.nextPage(),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
