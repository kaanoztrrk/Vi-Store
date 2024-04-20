import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Data/Repositories/Authentication/authentication_repository.dart';
import '../../../../Util/Constant/image_strings.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Constant/text_strings.dart';
import '../../../../Util/Helpers/helpers_functions.dart';
import '../../Controller/VerifyEmail/verify_email_controller.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: ViAppBar(
          actions: [
            IconButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                icon: const Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(ViSizes.defaultSpace),
            child: Column(
              children: [
                // Image
                Image(
                    width: ViHelpersFunctions.screenWidth() * 0.6,
                    image:
                        const AssetImage(ViImages.deliveredEmilIllustration)),
                const SizedBox(height: ViSizes.spaceBtwSections),
                // Title & Subtitle
                Text(
                  ViTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: ViSizes.spaceBtwItems),
                Text(
                  email ?? "",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: ViSizes.spaceBtwItems),
                Text(
                  ViTexts.confirmEmailSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: ViSizes.spaceBtwItems),

                // Buttons

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          controller.checkEmailVerificationStatus(),
                      child: const Text(ViTexts.viContinue)),
                ),
                const SizedBox(height: ViSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendEmailVerification(),
                      child: const Text(ViTexts.resendEmail)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
