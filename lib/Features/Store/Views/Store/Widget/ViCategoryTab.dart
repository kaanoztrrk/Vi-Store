// ignore_for_file: file_names

import 'package:ecommerce_app/Features/Store/Models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../Common/Widget/Brand/brand_show_case.dart';
import '../../../../../Common/Widget/Products/ProductCard.dart/product_card_vertical.dart';
import '../../../../../Common/Widget/Texts/section_heading.dart';
import '../../../../../Common/Widget/layouts/grid_layout.dart';
import '../../../../../Util/Constant/image_strings.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../Models/category_model.dart';

class ViCategoryTab extends StatelessWidget {
  const ViCategoryTab({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

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
                itemBuilder: (_, index) => ViProductCardVertical(
                  product: ProductModel.empty(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
