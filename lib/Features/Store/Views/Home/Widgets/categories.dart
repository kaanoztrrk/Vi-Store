// ignore_for_file: file_names

import 'package:ecommerce_app/Common/Widget/shimmer/vi_category_shimmer.dart';
import 'package:ecommerce_app/Features/Store/Controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/Widget/Image_Text_Widget/vertical_image_text.dart';
import '../../Sub_Category/sub_categories.dart';

class ViHomeCategories extends StatelessWidget {
  const ViHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
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

    return Obx(() {
      if (categoryController.isLoading.value) {
        return const ViCategoryShimmer();
      }

      if (categoryController.fetaturedCategories.isEmpty) {
        return Center(
          child: Text(
            "No data Found!",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.fetaturedCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.fetaturedCategories[index];
            return ViVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const SubCategoriesPage()),
            );
          },
        ),
      );
    });
  }
}
