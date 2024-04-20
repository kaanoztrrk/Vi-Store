// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

class OnBoardingPart extends StatelessWidget {
  const OnBoardingPart(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ViSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: ViHelpersFunctions.screenWidth() * 0.8,
            height: ViHelpersFunctions.screenHeigth() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ViSizes.spaceBtwItems),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
