import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/Common/Widget/Images/circular_image.dart';
import 'package:flutter/material.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Constant/sizes.dart';
import '../../../Util/Helpers/helpers_functions.dart';
import '../shimmer/shimmer.dart';

class ViVerticalImageText extends StatelessWidget {
  const ViVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = AppColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ViSizes.spaceBtwItems),
        child: Column(
          children: [
            ViCircularImage(
              image: image,
              isNetworkImage: isNetworkImage,
            ),
            const SizedBox(height: ViSizes.spaceBtwItems / 2),
            Container(
              alignment: Alignment.center,
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
