import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Helpers/helpers_functions.dart';

class ViSshimmerEffect extends StatelessWidget {
  const ViSshimmerEffect(
      {super.key,
      required this.width,
      required this.heigth,
      this.radius = 15,
      this.color});

  final double width, heigth, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: heigth,
        decoration: BoxDecoration(
          color: color ?? (dark ? AppColors.darkerGrey : AppColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
