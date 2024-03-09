import 'package:flutter/material.dart';
import 'package:vi_store/Util/Constant/colors.dart';

class ViShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: AppColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
  static final horizontalProductShadow = BoxShadow(
      color: AppColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
