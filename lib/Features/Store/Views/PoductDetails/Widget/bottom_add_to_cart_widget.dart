import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Common/Widget/Icons/vi_circular_icon.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

class ViBottomAddToCart extends StatelessWidget {
  const ViBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: ViSizes.defaultSpace, vertical: ViSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? AppColors.darkerGrey : AppColors.ligth,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ViSizes.cardRadiusLg),
          topRight: Radius.circular(ViSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ViCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: AppColors.darkgrey,
                width: 40,
                heigth: 40,
                color: AppColors.white,
              ),
              const SizedBox(width: ViSizes.spaceBtwItems),
              Text("2", style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: ViSizes.spaceBtwItems),
              const ViCircularIcon(
                icon: Iconsax.add,
                backgroundColor: AppColors.black,
                width: 40,
                heigth: 40,
                color: AppColors.white,
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(ViSizes.md),
                  backgroundColor: AppColors.black,
                  side: const BorderSide(color: AppColors.black)),
              onPressed: () {},
              child: const Text('Add to Cart'))
        ],
      ),
    );
  }
}
