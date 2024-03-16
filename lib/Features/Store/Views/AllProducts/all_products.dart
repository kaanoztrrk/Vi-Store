import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Common/Widget/Appbar/appbar.dart';
import 'package:vi_store/Common/Widget/Products/ProductCard.dart/product_card_vertical.dart';
import 'package:vi_store/Common/Widget/Products/sortable/sortable_products.dart';
import 'package:vi_store/Common/Widget/layouts/grid_layout.dart';
import 'package:vi_store/Util/Constant/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViAppBar(
        title: Text("Popular Products",
            style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ViSizes.defaultSpace),
          child: ViSortableProducts(),
        ),
      ),
    );
  }
}
