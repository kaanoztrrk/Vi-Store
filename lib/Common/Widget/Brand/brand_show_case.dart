import 'package:flutter/material.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Constant/sizes.dart';
import '../../../Util/Helpers/helpers_functions.dart';
import '../Custom_shapes/Containers/rounded_Container.dart';
import 'vi_brand_card.dart';

class ViBrandShowCase extends StatelessWidget {
  const ViBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ViRoundedContainer(
      showBorder: true,
      borderColor: AppColors.darkgrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: ViSizes.spaceBtwItems),
      padding: const EdgeInsets.all(ViSizes.md),
      child: Column(
        children: [
          const ViBrandCard(showBorder: false),
          Row(
              children: images
                  .map((image) => brandTopProductImagesWidget(image, context))
                  .toList())
        ],
      ),
    );
  }

  Expanded brandTopProductImagesWidget(String image, BuildContext context) {
    return Expanded(
      child: ViRoundedContainer(
        heigth: 100,
        backgroundColor: ViHelpersFunctions.isDarkMode(context)
            ? AppColors.darkerGrey
            : AppColors.ligth,
        margin: const EdgeInsets.only(right: ViSizes.sm),
        padding: const EdgeInsets.all(ViSizes.md),
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}
