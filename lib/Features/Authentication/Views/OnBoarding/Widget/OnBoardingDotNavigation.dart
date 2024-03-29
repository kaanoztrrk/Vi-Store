import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vi_store/Features/Authentication/Controller/Onboarding/onboarding_controller.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';

import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Device/device_utility.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Positioned(
      bottom: ViDeviceUtils.getBottomNavigationBarHeigth() + 25,
      left: ViSizes.defaultSpace,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? AppColors.ligth : AppColors.dark,
            dotHeight: 6),
        controller: controller.pageController,
        onDotClicked: controller.doNavigationClick,
        count: 3,
      ),
    );
  }
}
