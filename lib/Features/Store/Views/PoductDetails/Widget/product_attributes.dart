import 'package:ecommerce_app/Features/Store/Controllers/Product/variation_controller.dart';
import 'package:ecommerce_app/Features/Store/Models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/Chips/choice_chips.dart';
import '../../../../../Common/Widget/Custom_shapes/Containers/rounded_Container.dart';
import '../../../../../Common/Widget/Texts/section_heading.dart';
import '../../../../../Common/Widget/Texts/vi_product_price_text.dart';
import '../../../../../Common/Widget/Texts/vi_product_title_text.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
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

                              // actual price
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                    "\$${controller.selectedVariation.value.salePrice}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough)),
                              const SizedBox(width: ViSizes.spaceBtwItems),
                              ViProductPriceText(
                                  price: controller.getVariationPrice())
                            ],
                          ),
                          Row(
                            children: [
                              const ViProductTitleText(
                                  title: 'Stock : ', smallSize: true),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  ViProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
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
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ViSectionHeading(
                          title: attribute.name ?? '', showActionButton: false),
                      const SizedBox(height: ViSizes.spaceBtwItems / 2),
                      Obx(() => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValue;

                            final avaiable = controller
                                .getAttributesAvaibilityInVaritaion(
                                    product.productVariations!, attribute.name!)
                                .contains(attributeValue);

                            return ViChoiceChip(
                              text: attributeValue,
                              selected: isSelected,
                              onSelected: avaiable
                                  ? (selected) {
                                      if (selected && avaiable) {
                                        controller.onAttributeSelected(
                                            product,
                                            attribute.name ?? '',
                                            attributeValue);
                                      }
                                    }
                                  : null,
                            );
                          }).toList()))
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
