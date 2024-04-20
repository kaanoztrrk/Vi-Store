import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Common/Widget/Icons/vi_circular_icon.dart';
import '../../../../Common/Widget/Products/ProductCard.dart/product_card_vertical.dart';
import '../../../../Common/Widget/layouts/grid_layout.dart';
import '../../../../Util/Constant/sizes.dart';
import '../Home/home.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViAppBar(
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          ViCircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(const HomePage()))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ViSizes.defaultSpace),
          child: Column(
            children: [
              ViGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const ViProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
