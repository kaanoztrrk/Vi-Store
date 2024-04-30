import 'package:ecommerce_app/Common/Widget/layouts/grid_layout.dart';
import 'package:ecommerce_app/Common/Widget/shimmer/shimmer.dart';
import 'package:ecommerce_app/Util/Constant/sizes.dart';
import 'package:flutter/material.dart';

class ViVerticalProdductShimmer extends StatelessWidget {
  const ViVerticalProdductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ViGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) {
        return const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ViSshimmerEffect(width: 180, heigth: 180),
              SizedBox(height: ViSizes.spaceBtwItems),

              // Text
              ViSshimmerEffect(width: 160, heigth: 15),
              SizedBox(height: ViSizes.spaceBtwItems / 2),
              ViSshimmerEffect(width: 110, heigth: 15)
            ],
          ),
        );
      },
    );
  }
}
