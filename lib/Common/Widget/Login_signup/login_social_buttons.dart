import 'package:flutter/material.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Constant/image_strings.dart';
import '../../../Util/Constant/sizes.dart';

class ViSocialButtons extends StatelessWidget {
  const ViSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: ViSizes.iconMd,
                  height: ViSizes.iconMd,
                  image: AssetImage(ViImages.googleLogo))),
        ),
        SizedBox(width: ViSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: ViSizes.iconMd,
                  height: ViSizes.iconMd,
                  image: AssetImage(ViImages.facebookLogo))),
        ),
      ],
    );
  }
}
