import 'package:flutter/material.dart';
import 'package:vi_store/Common/Widget/Appbar/appbar.dart';
import 'package:vi_store/Common/Widget/Custom_shapes/Containers/rounded_Container.dart';
import 'package:vi_store/Common/Widget/Custom_shapes/Containers/search_container.dart';
import 'package:vi_store/Common/Widget/Products/cart_menu_icon.dart';
import 'package:vi_store/Common/Widget/Texts/section_heading.dart';
import 'package:vi_store/Common/Widget/Texts/vi_brand_title_text_with_verified_icon.dart';
import 'package:vi_store/Common/Widget/layouts/grid_layout.dart';
import 'package:vi_store/Util/Constant/colors.dart';
import 'package:vi_store/Util/Constant/enums.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';

import '../../../../Common/Widget/Images/circular_image.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViAppBar(
          title:
              Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          actions: [ViCardCounterIcon(onPressed: () {})]),
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
                  padding: EdgeInsets.all(ViSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: ViSizes.spaceBtwItems),
                      ViSearchContainer(
                        text: "",
                        onTap: () {},
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: ViSizes.spaceBtwSections),
                      ViSectionHeading(
                          title: "Featured Brands", onPressed: () {}),
                      SizedBox(height: ViSizes.spaceBtwItems / 1.5),
                      ViGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: ViRoundedContainer(
                              padding: const EdgeInsets.all(ViSizes.sm),
                              showBorder: true,
                              backgroundColor: Colors.transparent,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: ViCircularImage(
                                      image: ViImages.clothes,
                                      backgroundColor: Colors.transparent,
                                      overplayColor:
                                          ViHelpersFunctions.isDarkMode(context)
                                              ? AppColors.white
                                              : AppColors.black,
                                    ),
                                  ),
                                  SizedBox(height: ViSizes.spaceBtwItems / 2),

                                  // Text
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const ViBrandTitleWithVerifiedIcon(
                                            title: "Nike",
                                            brandTextSize: TextSizes.large),
                                        Text(
                                          "256 products",
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container()),
    );
  }
}
