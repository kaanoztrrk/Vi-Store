import 'package:flutter/material.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Constant/sizes.dart';
import '../../../Util/Helpers/helpers_functions.dart';

class ViVerticalImageText extends StatelessWidget {
  const ViVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.white,
    this.backgroundColor = AppColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ViSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(ViSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (ViHelpersFunctions.isDarkMode(context)
                          ? AppColors.black
                          : AppColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    color: AppColors.dark),
              ),
            ),
            SizedBox(height: ViSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: AppColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
