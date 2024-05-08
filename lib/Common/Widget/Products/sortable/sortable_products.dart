import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Features/Store/Controllers/Product/all_products_controller.dart';
import 'package:ecommerce_app/Features/Store/Models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Util/Constant/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../ProductCard.dart/product_card_vertical.dart';

class ViSortableProducts extends StatelessWidget {
  const ViSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assingProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProduct(value!);
          },
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        ),
        const SizedBox(height: ViSizes.spaceBtwSections),
        Obx(
          () => ViGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) =>
                ViProductCardVertical(product: controller.products[index]),
          ),
        )
      ],
    );
  }
}
