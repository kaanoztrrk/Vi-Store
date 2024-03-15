import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_store/Common/Widget/Custom_shapes/Containers/rounded_Container.dart';
import 'package:vi_store/Common/Widget/success_page/success_page.dart';
import 'package:vi_store/Features/Store/Views/Cart/Widgets/cart_items.dart';
import 'package:vi_store/Features/Store/Views/Checkout/Widgets/billing_address_section.dart';
import 'package:vi_store/Features/Store/Views/Checkout/Widgets/billing_amount_section.dart';
import 'package:vi_store/Features/Store/Views/Checkout/Widgets/billing_payment_section.dart';
import 'package:vi_store/Util/Constant/colors.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Common/Widget/Products/cart/coupon_widget.dart';
import '../../../../navigation_menu.dart';

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
              ViCouponCode(),
              const SizedBox(height: ViSizes.spaceBtwSections),

              // Billing Section
              ViRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(ViSizes.md),
                backgroundColor: dark ? AppColors.dark : AppColors.white,
                child: Column(
                  children: [
                    // Pricing
                    ViBillingAmountSections(),
                    const SizedBox(height: ViSizes.spaceBtwItems),

                    // Divider
                    Divider(),
                    const SizedBox(height: ViSizes.spaceBtwSections),

                    // Payment Methods
                    ViBillingPaymentSection(),
                    const SizedBox(height: ViSizes.spaceBtwSections),
                    // Address
                    ViBillingAddressSection(),
                    const SizedBox(height: ViSizes.spaceBtwSections),
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
            child: Text('Checkout \$256.0')),
      ),
    );
  }
}
