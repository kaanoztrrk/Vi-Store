import 'package:flutter/material.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Common/Widget/Products/Ratings/ratings_indicator.dart';
import '../../../../Util/Constant/sizes.dart';
import 'Widget/rating_progress_indicator.dart';
import 'Widget/user_review_card.dart';

class ProductReviewsPage extends StatelessWidget {
  const ProductReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViAppBar(
          title: Text("Reviews & Ratings",
              style: Theme.of(context).textTheme.headlineMedium),
          showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ViSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and ate from people who use the same type of device that you use.'),
              const SizedBox(height: ViSizes.spaceBtwItems),

              // Overall Product ratings
              const ViOverallProductRating(),

              const ViRatingBarIndicator(rating: 4.8),
              Text('12.661', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: ViSizes.spaceBtwSections),

              // User Review List

              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
