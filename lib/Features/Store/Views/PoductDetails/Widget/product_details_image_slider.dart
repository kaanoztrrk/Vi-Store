import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/Features/Store/Controllers/Product/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../../Common/Widget/Custom_shapes/Curved_edges/curved_edges_widget.dart';
import '../../../../../Common/Widget/Icons/vi_circular_icon.dart';
import '../../../../../Common/Widget/Images/rounded_image.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/image_strings.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';
import '../../../Models/product_model.dart';

class ViProductImageSlider extends StatelessWidget {
  const ViProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return ViCurvedEdgeWidget(
      child: Container(
        color: dark ? AppColors.darkerGrey : AppColors.ligth,
        child: Stack(
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(ViSizes.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnLargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  })),
                )),
            Positioned(
              left: 10,
              right: 0,
              bottom: 30,
              child: SizedBox(
                height: 70,
                width: ViHelpersFunctions.screenWidth(),
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: ViSizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(
                    () {
                      final imageSelected =
                          controller.selectedProductImage.value ==
                              images[index];
                      return ViRoundedImage(
                        fit: BoxFit.cover,
                        width: 70,
                        isNetworkImage: true,
                        backgroundColor:
                            dark ? AppColors.dark : AppColors.white,
                        imageUrl: images[index],
                        onPressed: () => controller.selectedProductImage.value =
                            images[index],
                        border: Border.all(
                            color: imageSelected
                                ? AppColors.primary
                                : Colors.transparent),
                      );
                    },
                  ),
                ),
              ),
            ),
            const ViAppBar(
              showBackArrow: true,
              actions: [
                ViCircularIcon(icon: Iconsax.heart5, color: Colors.red)
              ],
            )
          ],
        ),
      ),
    );
  }
}
