import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_store/Common/Widget/Appbar/appbar.dart';
import 'package:vi_store/Common/Widget/Appbar/tabbar.dart';
import 'package:vi_store/Common/Widget/Custom_shapes/Containers/search_container.dart';
import 'package:vi_store/Common/Widget/Products/cart/cart_menu_icon.dart';
import 'package:vi_store/Common/Widget/Texts/section_heading.dart';
import 'package:vi_store/Common/Widget/layouts/grid_layout.dart';
import 'package:vi_store/Features/Store/Views/Brand/all_brands.dart';
import 'package:vi_store/Features/Store/Views/Store/Widget/ViCategoryTab.dart';
import 'package:vi_store/Util/Constant/colors.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';

import '../../../../Common/Widget/Brand/vi_brand_card.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: ViAppBar(
            title: Text("Store",
                style: Theme.of(context).textTheme.headlineMedium),
            actions: const [ViCardCounterIcon()]),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: ViHelpersFunctions.isDarkMode(context)
                      ? AppColors.black
                      : AppColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(ViSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: ViSizes.spaceBtwItems),
                        ViSearchContainer(
                          text: "",
                          onTap: () {},
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: ViSizes.spaceBtwSections),
                        ViSectionHeading(
                            title: "Featured Brands",
                            onPressed: () =>
                                Get.to(() => const AllBrandsPage())),
                        const SizedBox(height: ViSizes.spaceBtwItems / 1.5),
                        ViGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: const ViBrandCard(showBorder: false),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  bottom: const ViTabbar(
                    tabs: [
                      Tab(child: Text("Sports")),
                      Tab(child: Text("Furniture")),
                      Tab(child: Text("Electronics")),
                      Tab(child: Text("Clothes")),
                      Tab(child: Text("Cosmetics")),
                    ],
                  )),
            ];
          },
          body: const TabBarView(
            children: [
              ViCategoryTab(),
              ViCategoryTab(),
              ViCategoryTab(),
              ViCategoryTab(),
              ViCategoryTab()
            ],
          ),
        ),
      ),
    );
  }
}
