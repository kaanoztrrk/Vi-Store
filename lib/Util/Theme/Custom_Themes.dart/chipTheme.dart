import 'package:flutter/material.dart';
import 'package:vi_store/Util/Constant/colors.dart';

class ViChipTheme {
  ViChipTheme._();

  static ChipThemeData ligthChipTheme = ChipThemeData(
    disabledColor: AppColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: AppColors.black),
    selectedColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: AppColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: AppColors.darkgrey,
    labelStyle: TextStyle(color: AppColors.white),
    selectedColor: AppColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: AppColors.white,
  );
}
