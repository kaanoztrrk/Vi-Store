import 'package:flutter/material.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Constant/sizes.dart';
import '../../../Util/Helpers/helpers_functions.dart';

class ViCircularImage extends StatelessWidget {
  const ViCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overplayColor,
    this.backgroundColor,
    this.width = 56,
    this.heigth = 56,
    this.padding = ViSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overplayColor;
  final Color? backgroundColor;
  final double width, heigth, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      padding: const EdgeInsets.all(ViSizes.sm),
      decoration: BoxDecoration(
          color: backgroundColor ??
              (ViHelpersFunctions.isDarkMode(context)
                  ? AppColors.black
                  : AppColors.white),
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            image: isNetworkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
          )),
    );
  }
}
