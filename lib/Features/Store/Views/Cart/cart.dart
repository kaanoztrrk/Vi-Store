import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Common/Widget/Appbar/appbar.dart';
import 'package:vi_store/Common/Widget/Icons/vi_circular_icon.dart';
import 'package:vi_store/Common/Widget/Images/rounded_image.dart';
import 'package:vi_store/Common/Widget/Texts/vi_brand_title_text_with_verified_icon.dart';
import 'package:vi_store/Common/Widget/Texts/vi_product_price_text.dart';
import 'package:vi_store/Common/Widget/Texts/vi_product_title_text.dart';
import 'package:vi_store/Features/Store/Views/Cart/Widgets/cart_items.dart';
import 'package:vi_store/Features/Store/Views/Checkout/checkout.dart';
import 'package:vi_store/Util/Constant/colors.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';

import '../../../../Common/Widget/Products/cart/add_remove_button.dart';
import '../../../../Common/Widget/Products/cart/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViAppBar(
          title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(ViSizes.defaultSpace),
        child: ViCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ViSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutPage()),
            child: Text('Checkout \$256.0')),
      ),
    );
  }
}
