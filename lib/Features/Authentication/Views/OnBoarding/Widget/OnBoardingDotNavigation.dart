// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Device/device_utility.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';
import '../../../Controller/Onboarding/onboarding_controller.dart';

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
