import 'package:flutter/material.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Constant/sizes.dart';

class ViRoundedImage extends StatelessWidget {
  const ViRoundedImage({
    super.key,
    this.width,
    this.heigth,
    this.border,
    this.fit = BoxFit.contain,
    this.padding,
    this.onPressed,
    this.backgroundColor = AppColors.ligth,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.isNetworkImage = false,
    this.borderRadius = ViSizes.md,
  });

  final double? width, heigth;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: heigth,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(ViSizes.md),
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
              fit: fit,
            )),
      ),
    );
  }
}
