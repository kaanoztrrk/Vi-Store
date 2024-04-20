import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Common/Widget/Texts/section_heading.dart';
import '../../../../Util/Constant/sizes.dart';
import '../ProductReviews/product_reviews.dart';
import 'Widget/bottom_add_to_cart_widget.dart';
import 'Widget/product_attributes.dart';
import 'Widget/product_details_image_slider.dart';
import 'Widget/product_meta_data.dart';
import 'Widget/product_rating_and_share.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    //  final dark = ViHelpersFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const ViBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ViProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                right: ViSizes.defaultSpace,
                left: ViSizes.defaultSpace,
                bottom: ViSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating & Share Button
                  const ViRatingandShare(),
                  // Price title stock brand
                  const ProductMetaDeta(),
                  // Attributes
                  const ProductAttributes(),
                  const SizedBox(height: ViSizes.spaceBtwSections),
                  // Cectout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Checkout")),
                  ),
                  const SizedBox(height: ViSizes.spaceBtwSections),

                  const ViSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: ViSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product description for white Nike sport shoes. There are more thing tht can be added but i am just praticing and nothing else.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  const Divider(),
                  const SizedBox(height: ViSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ViSectionHeading(
                          title: 'Reviews (201)', showActionButton: false),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewsPage()),
                          icon: const Icon(Iconsax.arrow_right_3, size: 18)),
                    ],
                  ),
                  const SizedBox(height: ViSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
