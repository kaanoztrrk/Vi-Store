// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../Util/Constant/colors.dart';
import '../../../../Util/Constant/sizes.dart';

class ViRoundedContainer extends StatelessWidget {
  const ViRoundedContainer({
    super.key,
    this.width,
    this.heigth,
    this.child,
    this.radius = ViSizes.cardRadiusLg,
    this.showBorder = false,
    this.borderColor = AppColors.grey,
    this.backgroundColor = AppColors.borderPrimary,
    this.padding,
    this.margin,
    this.onPressed,
  });

  final double? width;
  final double? heigth;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: heigth,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null,
        ),
        child: child,
      ),
    );
  }
}
