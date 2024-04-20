import 'package:flutter/material.dart';

import '../Constant/colors.dart';
import 'Custom_Themes.dart/appbar_theme.dart';
import 'Custom_Themes.dart/bottom_sheet_theme.dart';
import 'Custom_Themes.dart/checkbox_theme.dart';
import 'Custom_Themes.dart/chipTheme.dart';
import 'Custom_Themes.dart/elevated_button_theme.dart';
import 'Custom_Themes.dart/outlined_button_theme.dart';
import 'Custom_Themes.dart/text_field_theme.dart';
import 'Custom_Themes.dart/text_theme.dart';

class ViAppTheme {
  ViAppTheme._();

  //* Ligth Theme */

  static ThemeData ligthTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: ViTextTheme.ligthTextTheme,
    elevatedButtonTheme: ViElevatedButtonTheme.ligthElevtedButtonTheme,
    appBarTheme: ViAppbarTheme.ligthAppBarTheme,
    bottomSheetTheme: ViBottomSheetTheme.ligthBottomSheetTheme,
    checkboxTheme: ViCheckBoxTheme.ligthCheckboxTheme,
    chipTheme: ViChipTheme.ligthChipTheme,
    outlinedButtonTheme: ViOutlinedButtonTheme.ligthOutlinedButtonTheme,
    inputDecorationTheme: ViTextFormFieldTheme.ligthInputDecorationTheme,
  );

  //* Dark Theme */

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: AppColors.black,
    textTheme: ViTextTheme.darkTextTheme,
    elevatedButtonTheme: ViElevatedButtonTheme.darkElevtedButtonTheme,
    appBarTheme: ViAppbarTheme.darkAppBarTheme,
    bottomSheetTheme: ViBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: ViCheckBoxTheme.darkCheckboxTheme,
    chipTheme: ViChipTheme.darkChipTheme,
    outlinedButtonTheme: ViOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ViTextFormFieldTheme.darkInputDecorationTheme,
  );
}
