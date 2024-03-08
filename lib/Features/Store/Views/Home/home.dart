import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Common/Widget/Appbar/appbar.dart';
import 'package:vi_store/Features/Store/Controllers/home_controller.dart';
import 'package:vi_store/Util/Constant/colors.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import 'package:vi_store/Util/Constant/text_strings.dart';
import 'package:vi_store/Util/Device/device_utility.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';
import 'package:vi_store/Util/Http/http_client.dart';

import '../../../../Common/Widget/Custom_shapes/Containers/circular_container.dart';
import '../../../../Common/Widget/Custom_shapes/Containers/primary_header_container.dart';
import '../../../../Common/Widget/Custom_shapes/Containers/search_container.dart';
import '../../../../Common/Widget/Custom_shapes/Curved_edges/curved_edges.dart';
import '../../../../Common/Widget/Custom_shapes/Curved_edges/curved_edges_widget.dart';
import '../../../../Common/Widget/Image_Text_Widget/vertical_image_text.dart';
import '../../../../Common/Widget/Images/rounded_image.dart';
import '../../../../Common/Widget/Products/cart_menu_icon.dart';
import '../../../../Common/Widget/Texts/section_heading.dart';
import 'Widgets/Categories.dart';
import 'Widgets/appbar.dart';
import 'Widgets/promo_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ViPrimaryHeaderContainer(
                child: Column(
              children: [
                const ViHomeAppBar(),
                const SizedBox(height: ViSizes.spaceBtwSections),
                ViSearchContainer(
                  text: 'Seach in Store',
                  onTap: () {},
                ),
                const SizedBox(height: ViSizes.spaceBtwSections),
                const Padding(
                  padding: EdgeInsets.only(left: ViSizes.defaultSpace),
                  child: Column(
                    children: [
                      ViSectionHeading(
                        title: 'Populer Categories',
                        showActionButton: false,
                        textColor: Colors.white,
                      ),
                      SizedBox(height: ViSizes.spaceBtwItems),
                      ViHomeCategories()
                    ],
                  ),
                )
              ],
            )),
            const Padding(
                padding: EdgeInsets.all(ViSizes.defaultSpace),
                child: ViPromoSlider(
                  banners: [
                    ViImages.promoBanner1,
                    ViImages.promoBanner2,
                    ViImages.promoBanner3,
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
