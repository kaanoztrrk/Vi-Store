import 'package:flutter/material.dart';

import '../../../../../Util/Constant/image_strings.dart';
import '../../../../../Util/Constant/text_strings.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

class ViLoginHeader extends StatelessWidget {
  const ViLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image:
              AssetImage(dark ? ViImages.ligthApplogo : ViImages.darkApplogo),
        ),
        Text(ViTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        Text(ViTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
