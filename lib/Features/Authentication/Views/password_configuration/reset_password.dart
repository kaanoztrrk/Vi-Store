import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/sizes.dart';

import '../../../../Util/Constant/text_strings.dart';
import '../../../../Util/Helpers/helpers_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(ViSizes.defaultSpace),
        child: Column(
          children: [
            Image(
                width: ViHelpersFunctions.screenWidth() * 0.6,
                image: AssetImage(ViImages.deliveredEmilIllustration)),
            const SizedBox(height: ViSizes.spaceBtwSections),
            // Title & Subtitle
            Text(
              ViTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: ViSizes.spaceBtwItems),
            Text(
              ViTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: ViSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text(ViTexts.done)),
            ),
            const SizedBox(height: ViSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () {}, child: const Text(ViTexts.resendEmail)),
            ),
          ],
        ),
      ),
    );
  }
}
