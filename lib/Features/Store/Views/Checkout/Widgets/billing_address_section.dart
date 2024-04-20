import 'package:flutter/material.dart';

import '../../../../../Common/Widget/Texts/section_heading.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';

class ViBillingAddressSection extends StatelessWidget {
  const ViBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text('Coding with Vi.', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: ViSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: AppColors.grey, size: 16),
            const SizedBox(width: ViSizes.spaceBtwItems),
            Text('+90(530)392-2283',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ViSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: AppColors.grey, size: 16),
            const SizedBox(width: ViSizes.spaceBtwItems),
            Expanded(
              child: Text(
                'Taşyaka Mahallesi 267.sokak No:51, Fethiye/Muğla',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
