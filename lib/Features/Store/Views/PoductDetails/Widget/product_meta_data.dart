import 'package:flutter/material.dart';

import '../../../../../Common/Widget/Custom_shapes/Containers/rounded_Container.dart';
import '../../../../../Common/Widget/Images/circular_image.dart';
import '../../../../../Common/Widget/Texts/vi_brand_title_text_with_verified_icon.dart';
import '../../../../../Common/Widget/Texts/vi_product_price_text.dart';
import '../../../../../Common/Widget/Texts/vi_product_title_text.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/enums.dart';
import '../../../../../Util/Constant/image_strings.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

class ProductMetaDeta extends StatelessWidget {
  const ProductMetaDeta({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ViRoundedContainer(
              radius: ViSizes.sm,
              backgroundColor: AppColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: ViSizes.sm, vertical: ViSizes.xs),
              child: Text('%25',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: AppColors.black)),
            ),
            const SizedBox(width: ViSizes.spaceBtwItems),
            Text('\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: ViSizes.spaceBtwItems),
            const ViProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(width: ViSizes.spaceBtwItems / 1.5),
        const ViProductTitleText(title: 'White Nike Sports Shoes'),
        const SizedBox(width: ViSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const ViProductTitleText(title: 'Status'),
            const SizedBox(width: ViSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: ViSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            ViCircularImage(
              width: 32,
              heigth: 32,
              overplayColor: dark ? AppColors.white : AppColors.black,
              image: ViImages.shoes,
            ),
            const ViBrandTitleWithVerifiedIcon(
                title: 'Nike', brandTextSize: TextSizes.medium)
          ],
        )
      ],
    );
  }
}
