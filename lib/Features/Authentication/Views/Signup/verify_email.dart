import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_store/Common/Widget/Appbar/appbar.dart';
import 'package:vi_store/Common/Widget/success_page/success_page.dart';
import 'package:vi_store/Data/Repositories/authentication_repository.dart';
import 'package:vi_store/Features/Authentication/Controller/VerifyEmail/verify_email_controller.dart';
import 'package:vi_store/Features/Authentication/Views/Login/login.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import 'package:vi_store/Util/Constant/text_strings.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';

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
