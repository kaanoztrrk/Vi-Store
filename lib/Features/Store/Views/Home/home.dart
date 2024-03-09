import 'package:flutter/material.dart';
import 'package:vi_store/Common/Widget/Products/ProductCard.dart/product_card_vertical.dart';
import 'package:vi_store/Common/Widget/layouts/grid_layout.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import '../../../../Common/Widget/Custom_shapes/Containers/primary_header_container.dart';
import '../../../../Common/Widget/Custom_shapes/Containers/search_container.dart';
import '../../../../Common/Widget/Texts/section_heading.dart';
import 'Widgets/Categories.dart';
import 'Widgets/appbar.dart';
import 'Widgets/promo_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                        ViHomeCategories()
                      ],
                    ),
                  )
                ],
              ),
            ),

            Padding(
                padding: const EdgeInsets.all(ViSizes.defaultSpace),
                child: Column(
                  children: [
                    const ViPromoSlider(banners: [
                      ViImages.promoBanner1,
                      ViImages.promoBanner2,
                      ViImages.promoBanner3,
                    ]),
                    const SizedBox(height: ViSizes.spaceBtwSections),
                    //Populer Products
                    ViSectionHeading(
                        title: "Popular Products", onPressed: () {}),
                    const SizedBox(height: ViSizes.spaceBtwSections),
                    //Grid View
                    ViGridLayout(
                        itemCount: 4,
                        itemBuilder: (_, index) =>
                            const ViProductCardVertical()),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
