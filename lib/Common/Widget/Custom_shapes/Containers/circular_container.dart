import 'package:flutter/material.dart';

import '../../../../Util/Constant/colors.dart';

class ViCircularContainer extends StatelessWidget {
  const ViCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.heigth = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = AppColors.white,
    this.margin,
  });

  final double? width;
  final double? heigth;
  final double? radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!), color: backgroundColor),
      child: child,
    );
  }
}
