import 'package:ecommerce_app/Common/Widget/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/Widget/Custom_shapes/Containers/primary_header_container.dart';
import '../../../../Common/Widget/Custom_shapes/Containers/search_container.dart';
import '../../../../Common/Widget/Products/ProductCard.dart/product_card_vertical.dart';
import '../../../../Common/Widget/Texts/section_heading.dart';

import '../../../../Common/Widget/layouts/grid_layout.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../Controllers/product_controller.dart';
import '../AllProducts/all_products.dart';
import 'Widgets/appbar.dart';
import 'Widgets/categories.dart';
import 'Widgets/promo_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main Headers
            ViPrimaryHeaderContainer(
              child: Column(
                children: [
                  const ViHomeAppBar(),
                  const SizedBox(height: ViSizes.spaceBtwSections),
                  ViSearchContainer(
                    text: 'Seach in Store',
                    onTap: () {},
                  ),
                  const SizedBox(height: ViSizes.spaceBtwSections),
                  const Padding(
                    padding: EdgeInsets.only(left: ViSizes.defaultSpace),
                    child: Column(
                      children: [
                        // heading
                        ViSectionHeading(
                          title: 'Populer Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: ViSizes.spaceBtwItems),

                        // Categories
                        ViHomeCategories(),
                      ],
                    ),
                  ),
                  const SizedBox(height: ViSizes.spaceBtwSections),
                ],
              ),
            ),

            Padding(
                padding: const EdgeInsets.all(ViSizes.defaultSpace),
                child: Column(
                  children: [
                    const ViPromoSlider(),
                    const SizedBox(height: ViSizes.spaceBtwSections),
                    //Populer Products
                    ViSectionHeading(
                        title: "Popular Products",
                        onPressed: () => Get.to(() => const AllProducts())),
                    const SizedBox(height: ViSizes.spaceBtwSections),
                    //Grid View
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const ViVerticalProdductShimmer();
                      }
                      if (controller.featuredProducts.isEmpty) {
                        return Center(
                          child: Text(
                            'No Data Found!',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      }

                      return ViGridLayout(
                          itemCount: controller.featuredProducts.length,
                          itemBuilder: (_, index) => ViProductCardVertical(
                                product: controller.featuredProducts[index],
                              ));
                    })
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
