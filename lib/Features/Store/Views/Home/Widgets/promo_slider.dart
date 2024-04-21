import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/Common/Widget/shimmer/shimmer.dart';
import 'package:ecommerce_app/Features/Store/Controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/Widget/Custom_shapes/Containers/circular_container.dart';
import '../../../../../Common/Widget/Images/rounded_image.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';

class ViPromoSlider extends StatelessWidget {
  const ViPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const ViSshimmerEffect(width: double.infinity, heigth: 190);
      }

      if (controller.banners.isEmpty) {
        return const Center(
          child: Text("No Data Found"),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                ),
                items: controller.banners
                    .map((banner) => ViRoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed: () => Get.toNamed(banner.targetScreen),
                        ))
                    .toList()),
            const SizedBox(height: ViSizes.spaceBtwItems),
            Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    ViCircularContainer(
                      margin: const EdgeInsets.only(right: 10),
                      width: 20,
                      heigth: 4,
                      backgroundColor:
                          controller.carouselCurrentIndex.value == i
                              ? AppColors.primary
                              : AppColors.grey,
                    ),
                ],
              ),
            )
          ],
        );
      }
    });
  }
}
