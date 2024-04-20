import 'package:flutter/material.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Common/Widget/Images/rounded_image.dart';
import '../../../../Common/Widget/Products/ProductCard.dart/product_card_horizontal.dart';
import '../../../../Common/Widget/Texts/section_heading.dart';
import '../../../../Util/Constant/image_strings.dart';
import '../../../../Util/Constant/sizes.dart';

class SubCategoriesPage extends StatelessWidget {
  const SubCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViAppBar(
          showBackArrow: true,
          title: Text("Sports shirts",
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ViSizes.defaultSpace),
          child: Column(
            children: [
              const ViRoundedImage(
                  imageUrl: ViImages.promoBanner2,
                  applyImageRadius: true,
                  width: double.infinity),
              const SizedBox(height: ViSizes.spaceBtwSections),
              Column(
                children: [
                  ViSectionHeading(title: "Sport shirts", onPressed: () {}),
                  const SizedBox(height: ViSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: ViSizes.spaceBtwItems),
                      itemBuilder: (context, index) =>
                          const ViProductCardHorizontal(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
