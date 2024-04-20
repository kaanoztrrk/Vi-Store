import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Util/Constant/colors.dart';
import '../../../../Util/Constant/image_strings.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Helpers/helpers_functions.dart';
import '../../Custom_shapes/Containers/rounded_Container.dart';
import '../../Icons/vi_circular_icon.dart';
import '../../Images/rounded_image.dart';
import '../../Texts/vi_brand_title_text_with_verified_icon.dart';
import '../../Texts/vi_product_price_text.dart';
import '../../Texts/vi_product_title_text.dart';

class ViProductCardHorizontal extends StatelessWidget {
  const ViProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ViSizes.productImageRadius),
        color: dark ? AppColors.darkerGrey : AppColors.softGrey,
      ),
      child: Row(
        children: [
          ViRoundedContainer(
            heigth: 120,
            padding: const EdgeInsets.all(ViSizes.sm),
            backgroundColor: dark ? AppColors.dark : AppColors.ligth,
            child: Stack(
              children: [
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: ViRoundedImage(
                      imageUrl: ViImages.productImage_11,
                      applyImageRadius: true),
                ),
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
                        icon: Iconsax.heart5, color: Colors.red)),
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: ViSizes.sm, left: ViSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ViProductTitleText(
                          title: 'White Nike Half Sleeves Sneakers',
                          smallSize: true),
                      SizedBox(width: ViSizes.spaceBtwItems / 2),
                      ViBrandTitleWithVerifiedIcon(title: 'Nike')
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: ViProductPriceText(price: '256.0')),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(ViSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(ViSizes.productImageRadius)),
                        ),
                        child: const SizedBox(
                          width: ViSizes.iconLg * 1.2,
                          height: ViSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: AppColors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
