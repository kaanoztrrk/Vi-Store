import 'package:flutter/material.dart';

import '../../../Util/Constant/sizes.dart';
import '../../../Util/Constant/text_strings.dart';
import '../../../Util/Helpers/helpers_functions.dart';
import '../../Styles/spacing_styles.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: ViSpacingStyle.paddingWithAppBarHeigth * 2,
        child: Column(
          children: [
            Image(
                width: ViHelpersFunctions.screenWidth() * 0.6,
                image: AssetImage(image)),
            const SizedBox(height: ViSizes.spaceBtwSections),
            // Title & Subtitle
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: ViSizes.spaceBtwItems),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: ViSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onPressed, child: const Text(ViTexts.viContinue)),
            ),
            const SizedBox(height: ViSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
