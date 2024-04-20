import 'package:flutter/material.dart';

import '../../../../../Common/Widget/Custom_shapes/Containers/rounded_Container.dart';
import '../../../../../Common/Widget/Texts/section_heading.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/image_strings.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

class ViBillingPaymentSection extends StatelessWidget {
  const ViBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Column(
      children: [
        ViSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: ViSizes.spaceBtwItems / 2),
        Row(
          children: [
            ViRoundedContainer(
              width: 60,
              heigth: 35,
              backgroundColor: dark ? AppColors.ligth : AppColors.white,
              child: const Image(
                  image: AssetImage(ViImages.mastercard), fit: BoxFit.contain),
            ),
            const SizedBox(height: ViSizes.spaceBtwItems / 2),
            Text("MasterCard", style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
