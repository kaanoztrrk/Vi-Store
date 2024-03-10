import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Common/Widget/Appbar/appbar.dart';
import 'package:vi_store/Common/Widget/Custom_shapes/Curved_edges/curved_edges_widget.dart';
import 'package:vi_store/Common/Widget/Icons/vi_circular_icon.dart';
import 'package:vi_store/Common/Widget/Images/rounded_image.dart';
import 'package:vi_store/Features/Store/Views/Poduct_Details/Widget/product_meta_data.dart';
import 'package:vi_store/Util/Constant/colors.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';

import 'Widget/product_details_image_slider.dart';
import 'Widget/product_rating_and_share.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    //  final dark = ViHelpersFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ViProductImageSlider(),
            Padding(
              padding: EdgeInsets.only(
                right: ViSizes.defaultSpace,
                left: ViSizes.defaultSpace,
                bottom: ViSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating & Share Button
                  ViRatingandShare(),
                  ProductMetaDeta(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
