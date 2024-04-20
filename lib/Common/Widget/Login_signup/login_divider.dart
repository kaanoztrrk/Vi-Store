import 'package:flutter/material.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Helpers/helpers_functions.dart';

class ViFormDivider extends StatelessWidget {
  const ViFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
              color: dark ? AppColors.darkgrey : AppColors.grey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
              color: dark ? AppColors.darkgrey : AppColors.grey,
              thickness: 0.5,
              indent: 5,
              endIndent: 60),
        ),
      ],
    );
  }
}
