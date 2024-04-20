import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Util/Constant/sizes.dart';
import '../Checkout/checkout.dart';
import 'Widgets/cart_items.dart';

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
            child: const Text('Checkout \$256.0')),
      ),
    );
  }
}
