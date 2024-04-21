import 'package:ecommerce_app/Features/Store/Controllers/category_controller.dart';
import 'package:ecommerce_app/Features/Store/Views/Store/Widget/ViCategoryTab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Common/Widget/Appbar/tabbar.dart';
import '../../../../Common/Widget/Brand/vi_brand_card.dart';
import '../../../../Common/Widget/Custom_shapes/Containers/search_container.dart';
import '../../../../Common/Widget/Products/cart/cart_menu_icon.dart';
import '../../../../Common/Widget/Texts/section_heading.dart';
import '../../../../Common/Widget/layouts/grid_layout.dart';
import '../../../../Util/Constant/colors.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Helpers/helpers_functions.dart';
import '../Brand/all_brands.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.fetaturedCategories;
    return DefaultTabController(
      length: categories.length,
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
                    bottom: ViTabbar(
                        tabs: categories
                            .map((category) => Tab(
                                  child: Text(category.name),
                                ))
                            .toList())),
              ];
            },
            body: TabBarView(
                children: categories
                    .map((category) => ViCategoryTab(categoryModel: category))
                    .toList())

            /*
          TabBarView(
            children: categories
                .map((category) => ViCategoryTab(categoryModel: category))
                .toList(),
          ),
           */
            ),
      ),
    );
  }
}
