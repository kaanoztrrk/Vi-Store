import 'package:flutter/material.dart';
import 'package:vi_store/Common/Widget/Custom_shapes/Containers/rounded_Container.dart';
import 'package:vi_store/Common/Widget/Texts/section_heading.dart';
import 'package:vi_store/Util/Constant/colors.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';

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
