import 'package:flutter/material.dart';

import '../../../../../Common/Chips/choice_chips.dart';
import '../../../../../Common/Widget/Custom_shapes/Containers/rounded_Container.dart';
import '../../../../../Common/Widget/Texts/section_heading.dart';
import '../../../../../Common/Widget/Texts/vi_product_price_text.dart';
import '../../../../../Common/Widget/Texts/vi_product_title_text.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Column(
      children: [
        ViRoundedContainer(
          padding: const EdgeInsets.all(ViSizes.md),
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const ViSectionHeading(
                      title: "Variation", showActionButton: false),
                  const SizedBox(width: ViSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ViProductTitleText(
                              title: "Price : ", smallSize: true),
                          Text("\$25",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: ViSizes.spaceBtwItems),
                          const ViProductPriceText(price: '20')
                        ],
                      ),
                      Row(
                        children: [
                          const ViProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const ViProductTitleText(
                title:
                    'This is the Description of the Product and it can go up to max 4 lines.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: ViSizes.spaceBtwItems),
        // attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ViSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: ViSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ViChoiceChip(
                  text: "Green",
                  selected: true,
                  onSelected: (value) {},
                ),
                ViChoiceChip(
                  text: "Blue",
                  selected: false,
                  onSelected: (value) {},
                ),
                ViChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ViSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: ViSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                ViChoiceChip(
                  text: "34",
                  selected: true,
                  onSelected: (value) {},
                ),
                ViChoiceChip(
                  text: "36",
                  selected: false,
                  onSelected: (value) {},
                ),
                ViChoiceChip(
                  text: "44",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
