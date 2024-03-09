import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';

import '../../../Util/Constant/colors.dart';

class ViCircularIcon extends StatelessWidget {
  const ViCircularIcon({
    super.key,
    this.width,
    this.heigth,
    this.size,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, heigth, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : ViHelpersFunctions.isDarkMode(context)
                ? AppColors.black.withOpacity(0.9)
                : AppColors.white.withOpacity(0.9),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: size,
          )),
    );
  }
}
