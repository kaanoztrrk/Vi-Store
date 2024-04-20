import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Util/Constant/colors.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Helpers/helpers_functions.dart';
import '../../Icons/vi_circular_icon.dart';

class ViProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ViProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ViCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          heigth: 32,
          size: ViSizes.md,
          color: ViHelpersFunctions.isDarkMode(context)
              ? AppColors.white
              : AppColors.black,
          backgroundColor: ViHelpersFunctions.isDarkMode(context)
              ? AppColors.darkerGrey
              : AppColors.ligth,
        ),
        const SizedBox(width: ViSizes.spaceBtwItems),
        Text("2", style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: ViSizes.spaceBtwItems),
        const ViCircularIcon(
            icon: Iconsax.add,
            width: 32,
            heigth: 32,
            size: ViSizes.md,
            color: AppColors.white,
            backgroundColor: AppColors.primary),
      ],
    );
  }
}
