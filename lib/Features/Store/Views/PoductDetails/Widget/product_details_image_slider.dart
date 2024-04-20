import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../../Common/Widget/Custom_shapes/Curved_edges/curved_edges_widget.dart';
import '../../../../../Common/Widget/Icons/vi_circular_icon.dart';
import '../../../../../Common/Widget/Images/rounded_image.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/image_strings.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

class ViProductImageSlider extends StatelessWidget {
  const ViProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return ViCurvedEdgeWidget(
      child: Container(
        color: dark ? AppColors.darkerGrey : AppColors.ligth,
        child: Stack(
          children: [
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(ViSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(
                    image: AssetImage(ViImages.productImage_1),
                  )),
                )),
            Positioned(
              left: 10,
              right: 0,
              bottom: 30,
              child: SizedBox(
                height: 70,
                width: ViHelpersFunctions.screenWidth(),
                child: ListView.separated(
                  itemCount: 8,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: ViSizes.spaceBtwItems),
                  itemBuilder: (_, index) => ViRoundedImage(
                    fit: BoxFit.cover,
                    width: 70,
                    backgroundColor: dark ? AppColors.dark : AppColors.white,
                    border: Border.all(color: AppColors.primary),
                    imageUrl: ViImages.productImage_3,
                  ),
                ),
              ),
            ),
            const ViAppBar(
              showBackArrow: true,
              actions: [
                ViCircularIcon(icon: Iconsax.heart5, color: Colors.red)
              ],
            )
          ],
        ),
      ),
    );
  }
}
