import 'package:flutter/material.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Common/Widget/Brand/vi_brand_card.dart';
import '../../../../Common/Widget/Products/sortable/sortable_products.dart';
import '../../../../Util/Constant/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViAppBar(
        showBackArrow: true,
        title: Text("Nike", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(ViSizes.defaultSpace),
            child: Column(
              children: [
                ViBrandCard(showBorder: true),
                SizedBox(height: ViSizes.spaceBtwSections),
                ViSortableProducts(
                  products: [],
                ),
              ],
            )),
      ),
    );
  }
}
