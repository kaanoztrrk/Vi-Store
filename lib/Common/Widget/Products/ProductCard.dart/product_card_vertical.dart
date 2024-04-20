import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Features/Store/Views/PoductDetails/product_details.dart';
import '../../../../Util/Constant/colors.dart';
import '../../../../Util/Constant/image_strings.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Helpers/helpers_functions.dart';
import '../../../Styles/shadow.dart';
import '../../Custom_shapes/Containers/rounded_Container.dart';
import '../../Icons/vi_circular_icon.dart';
import '../../Images/rounded_image.dart';
import '../../Texts/vi_brand_title_text_with_verified_icon.dart';
import '../../Texts/vi_product_price_text.dart';
import '../../Texts/vi_product_title_text.dart';

class ViProductCardVertical extends StatelessWidget {
  const ViProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(const ProductDetails()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [ViShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(ViSizes.productImageRadius),
            color: ViHelpersFunctions.isDarkMode(context)
                ? AppColors.darkerGrey
                : AppColors.white),
        child: Column(
          children: [
            // Thumbnail, WishlistButton, Discount Tag
            ViRoundedContainer(
              heigth: 200,
              //    padding: const EdgeInsets.all(ViSizes.sm),
              backgroundColor: dark ? AppColors.darkerGrey : AppColors.ligth,
              child: Stack(
                children: [
                  const ViRoundedImage(
                      width: double.infinity,
                      imageUrl: ViImages.productImage_5,
                      applyImageRadius: true),

                  // Sale Tag
                  Positioned(
                      top: 12,
                      child: ViRoundedContainer(
                          radius: ViSizes.sm,
                          backgroundColor: AppColors.secondary.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: ViSizes.sm, vertical: ViSizes.xs),
                          child: Text('25%',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(color: AppColors.black)))),

                  // Favorite Button

                  const Positioned(
                      top: 0,
                      right: 0,
                      child: ViCircularIcon(
                          icon: Iconsax.heart5, color: Colors.red))
                ],
              ),
            ),

            // -- Details

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(left: ViSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ViProductTitleText(
                      title: "White Nike Air Shoes", smallSize: true),
                  const SizedBox(height: ViSizes.spaceBtwItems / 2),
                  const ViBrandTitleWithVerifiedIcon(title: "Nike"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price

                      const ViProductPriceText(price: "35.6", isLarge: true),

                      Container(
                        decoration: const BoxDecoration(
                            color: AppColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(ViSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    ViSizes.productImageRadius))),
                        child: const SizedBox(
                            width: ViSizes.iconLg * 1.2,
                            height: ViSizes.iconLg * 1.2,
                            child: Icon(Iconsax.add, color: AppColors.white)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
