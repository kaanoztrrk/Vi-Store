import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_store/Features/Store/Views/Sub_Category/sub_categories.dart';

import '../../../../../Common/Widget/Image_Text_Widget/vertical_image_text.dart';
import '../../../../../Util/Constant/image_strings.dart';

class ViHomeCategories extends StatelessWidget {
  const ViHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return ViVerticalImageText(
            image: ViImages.clothes,
            title: 'Clothes',
            onTap: () => Get.to(() => SubCategoriesPage()),
          );
        },
      ),
    );
  }
}
