import 'package:flutter/material.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Constant/enums.dart';
import '../../../Util/Constant/image_strings.dart';
import '../../../Util/Constant/sizes.dart';
import '../../../Util/Helpers/helpers_functions.dart';
import '../Custom_shapes/Containers/rounded_Container.dart';
import '../Images/circular_image.dart';
import '../Texts/vi_brand_title_text_with_verified_icon.dart';

class ViBrandCard extends StatelessWidget {
  const ViBrandCard({
    super.key,
    this.showBorder = false,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ViRoundedContainer(
        padding: const EdgeInsets.all(ViSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: ViCircularImage(
                image: ViImages.clothes,
                backgroundColor: Colors.transparent,
                overplayColor: ViHelpersFunctions.isDarkMode(context)
                    ? AppColors.white
                    : AppColors.black,
              ),
            ),
            const SizedBox(height: ViSizes.spaceBtwItems / 2),

            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ViBrandTitleWithVerifiedIcon(
                      title: "Nike", brandTextSize: TextSizes.large),
                  Text(
                    "256 products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
