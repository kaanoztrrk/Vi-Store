import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Common/Widget/Appbar/appbar.dart';
import 'package:vi_store/Common/Widget/Icons/vi_circular_icon.dart';
import 'package:vi_store/Common/Widget/Products/ProductCard.dart/product_card_vertical.dart';
import 'package:vi_store/Common/Widget/layouts/grid_layout.dart';
import 'package:vi_store/Features/Store/Views/Home/home.dart';
import 'package:vi_store/Util/Constant/sizes.dart';

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
          padding: EdgeInsets.all(ViSizes.defaultSpace),
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
