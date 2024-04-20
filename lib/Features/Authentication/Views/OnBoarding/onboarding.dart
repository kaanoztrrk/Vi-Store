import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Util/Constant/image_strings.dart';
import '../../../../Util/Constant/text_strings.dart';
import '../../Controller/Onboarding/onboarding_controller.dart';
import 'Widget/OnBoardingDotNavigation.dart';
import 'Widget/OnBoardingNextButton.dart';
import 'Widget/OnBoardingPart.dart';
import 'Widget/OnboardingSkipButton.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPart(
                  image: ViImages.onBoardingImage1,
                  title: ViTexts.onBoardinTitle1,
                  subtitle: ViTexts.onBoardinSubTitle1),
              OnBoardingPart(
                  image: ViImages.onBoardingImage2,
                  title: ViTexts.onBoardinTitle2,
                  subtitle: ViTexts.onBoardinSubTitle2),
              OnBoardingPart(
                  image: ViImages.onBoardingImage3,
                  title: ViTexts.onBoardinTitle3,
                  subtitle: ViTexts.onBoardinSubTitle3),
            ],
          ),

          // Skip Button
          const OnBoardingSkip(),

          // Dot Navigation SmootPageIndicator

          const OnBoardingDotNavigation(),

          //Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
