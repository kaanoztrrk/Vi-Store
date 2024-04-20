import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/Widget/Custom_shapes/Containers/circular_container.dart';
import '../../../../../Common/Widget/Images/rounded_image.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../Controllers/home_controller.dart';

class ViPromoSlider extends StatelessWidget {
  const ViPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
            ),
            items:
                banners.map((url) => ViRoundedImage(imageUrl: url)).toList()),
        const SizedBox(height: ViSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                ViCircularContainer(
                  margin: const EdgeInsets.only(right: 10),
                  width: 20,
                  heigth: 4,
                  backgroundColor: controller.carouselCurrentIndex.value == i
                      ? AppColors.primary
                      : AppColors.grey,
                ),
            ],
          ),
        )
      ],
    );
  }
}
