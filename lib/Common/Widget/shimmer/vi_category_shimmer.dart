import 'package:ecommerce_app/Common/Widget/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../Util/Constant/sizes.dart';

class ViCategoryShimmer extends StatelessWidget {
  const ViCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (_, __) =>
            const SizedBox(width: ViSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ViSshimmerEffect(width: 55, heigth: 55, radius: 55),
              SizedBox(height: ViSizes.spaceBtwItems),

              // texts
              ViSshimmerEffect(width: 55, heigth: 8)
            ],
          );
        },
      ),
    );
  }
}
