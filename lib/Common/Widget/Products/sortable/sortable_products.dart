import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Common/Widget/Products/ProductCard.dart/product_card_vertical.dart';

import '../../../../Util/Constant/sizes.dart';
import '../../Brand/vi_brand_card.dart';
import '../../Texts/section_heading.dart';
import '../../layouts/grid_layout.dart';

class ViSortableProducts extends StatelessWidget {
  const ViSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
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
        ViGridLayout(
          itemCount: 8,
          itemBuilder: (_, index) => const ViProductCardVertical(),
        )
      ],
    );
  }
}
