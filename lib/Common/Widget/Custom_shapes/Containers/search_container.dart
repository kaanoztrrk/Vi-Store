import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Util/Constant/colors.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Device/device_utility.dart';
import '../../../../Util/Helpers/helpers_functions.dart';

class ViSearchContainer extends StatelessWidget {
  const ViSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    required this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ViSizes.defaultSpace),
        child: Container(
          width: ViDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(ViSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? AppColors.dark
                      : AppColors.ligth
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(ViSizes.cardRadiusLg),
              border: showBorder ? Border.all(color: AppColors.grey) : null),
          child: Row(
            children: [
              Icon(icon, color: AppColors.grey),
              const SizedBox(width: ViSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
