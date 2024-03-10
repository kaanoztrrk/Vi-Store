import 'package:flutter/material.dart';

import '../../../../Util/Constant/colors.dart';
import '../../../../Util/Constant/image_strings.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Helpers/helpers_functions.dart';
import '../../Images/rounded_image.dart';
import '../../Texts/vi_brand_title_text_with_verified_icon.dart';
import '../../Texts/vi_product_title_text.dart';

class ViCartItem extends StatelessWidget {
  const ViCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ViRoundedImage(
          width: 60,
          heigth: 60,
          imageUrl: ViImages.productImage_1,
          backgroundColor: ViHelpersFunctions.isDarkMode(context)
              ? AppColors.darkerGrey
              : AppColors.ligth,
        ),
        const SizedBox(width: ViSizes.spaceBtwSections),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ViBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child:
                    ViProductTitleText(title: 'White Sport Shoes', maxLines: 1),
              ),
              //Attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'White',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: '44', style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
