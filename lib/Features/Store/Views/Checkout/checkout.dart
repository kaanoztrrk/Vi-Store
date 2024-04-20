import 'package:ecommerce_app/Util/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Common/Widget/Custom_shapes/Containers/rounded_Container.dart';
import '../../../../Common/Widget/Products/cart/coupon_widget.dart';
import '../../../../Common/Widget/success_page/success_page.dart';
import '../../../../Core/navigation_menu.dart';
import '../../../../Util/Constant/image_strings.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Helpers/helpers_functions.dart';
import '../Cart/Widgets/cart_items.dart';
import 'Widgets/billing_address_section.dart';
import 'Widgets/billing_amount_section.dart';
import 'Widgets/billing_payment_section.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Scaffold(
      appBar: ViAppBar(
          title: Text("Order Review",
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ViSizes.defaultSpace),
          child: Column(
            children: [
              const ViCartItems(showAddRemoveButtons: false),
              const SizedBox(height: ViSizes.spaceBtwSections),

              // Coupon TextField
              const ViCouponCode(),
              const SizedBox(height: ViSizes.spaceBtwSections),

              // Billing Section
              ViRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(ViSizes.md),
                backgroundColor: dark ? AppColors.dark : AppColors.white,
                child: const Column(
                  children: [
                    // Pricing
                    ViBillingAmountSections(),
                    SizedBox(height: ViSizes.spaceBtwItems),

                    // Divider
                    Divider(),
                    SizedBox(height: ViSizes.spaceBtwSections),

                    // Payment Methods
                    ViBillingPaymentSection(),
                    SizedBox(height: ViSizes.spaceBtwSections),
                    // Address
                    ViBillingAddressSection(),
                    SizedBox(height: ViSizes.spaceBtwSections),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ViSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessPage(
                  image: ViImages.successPaymentIcon,
                  title: 'Payment Success!',
                  subtitle: "Your item will be shipped",
                  onPressed: () => Get.offAll(() => const NavigatorMenu()),
                )),
            child: const Text('Checkout \$256.0')),
      ),
    );
  }
}
