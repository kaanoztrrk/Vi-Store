import 'package:ecommerce_app/Features/Store/Controllers/Product/product_controller.dart';
import 'package:ecommerce_app/Features/Store/Models/product_model.dart';
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
  const ProductMetaDeta({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
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
              child: Text('$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: AppColors.black)),
            ),
            const SizedBox(width: ViSizes.spaceBtwItems),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text('\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: ViSizes.spaceBtwItems),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: ViSizes.spaceBtwItems),
            ViProductPriceText(
                price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(width: ViSizes.spaceBtwItems / 1.5),
        ViProductTitleText(title: product.title),
        const SizedBox(width: ViSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const ViProductTitleText(title: 'Status'),
            const SizedBox(width: ViSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(width: ViSizes.spaceBtwItems / 1.5),

        // Brand
        Row(
          children: [
            ViCircularImage(
              isNetworkImage: true,
              width: 32,
              heigth: 32,
              overplayColor: dark ? AppColors.white : AppColors.black,
              image: product.brand != null ? product.brand!.image : '',
            ),
            ViBrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            )
          ],
        )
      ],
    );
  }
}
