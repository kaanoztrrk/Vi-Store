import 'package:cached_network_image/cached_network_image.dart';
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
            ViCircularImage(image: image),
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

class ViCircularImage extends StatelessWidget {
  const ViCircularImage({
    super.key,
    this.width = 56,
    this.heigth = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.boxFit = BoxFit.cover,
    this.padding = ViSizes.sm,
    this.isNetworkImage = false,
  });

  final BoxFit? boxFit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, heigth, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ??
              (ViHelpersFunctions.isDarkMode(context)
                  ? AppColors.black
                  : AppColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: boxFit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const ViSshimmerEffect(
                    width: 55,
                    heigth: 55,
                    radius: 55,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: boxFit,
                  color: overlayColor,
                  image: AssetImage(image),
                ),
        ),
      ),
    );
  }
}
