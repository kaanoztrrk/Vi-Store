import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Util/Constant/image_strings.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Constant/text_strings.dart';
import '../../../../Util/Helpers/helpers_functions.dart';
import '../../Controller/ForgetPassword/forget_password_controller.dart';
import '../Login/login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(ViSizes.defaultSpace),
        child: Column(
          children: [
            Image(
                width: ViHelpersFunctions.screenWidth() * 0.6,
                image: const AssetImage(ViImages.deliveredEmilIllustration)),
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
                  onPressed: () => Get.offAll(() => const LoginPage()),
                  child: const Text(ViTexts.done)),
            ),
            const SizedBox(height: ViSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () => ForgetPasswordController.instance
                      .resendPasswordResetEmail(email),
                  child: const Text(ViTexts.resendEmail)),
            ),
          ],
        ),
      ),
    );
  }
}
