import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../Common/Widget/Custom_shapes/Containers/rounded_Container.dart';
import '../../../../../Common/Widget/Products/Ratings/ratings_indicator.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/image_strings.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(ViImages.reviewImage1)),
                const SizedBox(width: ViSizes.spaceBtwItems),
                Text("Mustafa Kuş",
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        // Review
        Row(
          children: [
            const ViRatingBarIndicator(rating: 4),
            const SizedBox(width: ViSizes.spaceBtwItems),
            Text("01 Nov, 2023", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        const SizedBox(height: ViSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of app is quite  intutive. I was able to navigate and make purchases seamlessly. Great job!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show less',
          trimCollapsedText: ' Show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
        ),
        const SizedBox(height: ViSizes.spaceBtwItems),

        // Comany Review
        ViRoundedContainer(
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(ViSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Vi's Store",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text("02, Nov 2023",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const ReadMoreText(
                  'The user interface of app is quite  intutive. I was able to navigate and make purchases seamlessly. Great job!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Show less',
                  trimCollapsedText: ' Show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: ViSizes.spaceBtwSections),
      ],
    );
  }
}
