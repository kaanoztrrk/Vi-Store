import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Common/Widget/Brand/vi_brand_card.dart';
import '../../../../Common/Widget/Texts/section_heading.dart';
import '../../../../Common/Widget/layouts/grid_layout.dart';
import '../../../../Util/Constant/sizes.dart';
import 'brand_products.dart';

class AllBrandsPage extends StatelessWidget {
  const AllBrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViAppBar(
        title: Text('Brand', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(ViSizes.defaultSpace),
            child: Column(
              children: [
                const ViSectionHeading(
                    title: 'Brands', showActionButton: false),
                const SizedBox(height: ViSizes.spaceBtwItems),
                ViGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) => ViBrandCard(
                    showBorder: true,
                    onTap: () => Get.to(() => const BrandProducts()),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
