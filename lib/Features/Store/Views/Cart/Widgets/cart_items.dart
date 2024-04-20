import 'package:flutter/material.dart';

import '../../../../../Common/Widget/Products/cart/add_remove_button.dart';
import '../../../../../Common/Widget/Products/cart/cart_item.dart';
import '../../../../../Common/Widget/Texts/vi_product_price_text.dart';
import '../../../../../Util/Constant/sizes.dart';

class ViCartItems extends StatelessWidget {
  const ViCartItems({super.key, this.showAddRemoveButtons = false});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
          const SizedBox(height: ViSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          const ViCartItem(),
          if (showAddRemoveButtons)
            const SizedBox(height: ViSizes.spaceBtwItems),
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //Extra Space
                    SizedBox(width: 90),
                    // add Remove Buttons
                    ViProductQuantityWithAddRemoveButton(),
                  ],
                ),
                ViProductPriceText(price: '256'),
              ],
            )
        ],
      ),
    );
  }
}
