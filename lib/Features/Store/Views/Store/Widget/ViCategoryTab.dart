import 'package:flutter/material.dart';
import 'package:vi_store/Common/Widget/Products/ProductCard.dart/product_card_vertical.dart';
import 'package:vi_store/Common/Widget/Texts/section_heading.dart';
import 'package:vi_store/Common/Widget/layouts/grid_layout.dart';

import '../../../../../Common/Widget/Brand/brand_show_case.dart';
import '../../../../../Util/Constant/image_strings.dart';
import '../../../../../Util/Constant/sizes.dart';

class ViCategoryTab extends StatelessWidget {
  const ViCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ViSizes.defaultSpace),
          child: Column(
            children: [
              const ViBrandShowCase(
                images: [
                  ViImages.productImage_1,
                  ViImages.productImage_2,
                  ViImages.productImage_5
                ],
              ),
              const SizedBox(height: ViSizes.spaceBtwItems),
              ViSectionHeading(title: 'You might like', onPressed: () {}),
              const SizedBox(height: ViSizes.spaceBtwItems),
              ViGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const ViProductCardVertical(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
