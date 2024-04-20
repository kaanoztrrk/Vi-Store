// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/Widget/Image_Text_Widget/vertical_image_text.dart';
import '../../Sub_Category/sub_categories.dart';

class ViHomeCategories extends StatelessWidget {
  const ViHomeCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*


    return Obx(() {
      if (categoryController.isLoading.value) {
        return const ViCategoryShimmer();
      }

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            "No Data Found!",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
 */

    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3, //categoryController.featuredCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          //     final category = categoryController.featuredCategories[index];
          return ViVerticalImageText(
            image: "", // category.image,
            title: "", //category.name,
            onTap: () => Get.to(() => const SubCategoriesPage()),
          );
        },
      ),
    );
  }
}
