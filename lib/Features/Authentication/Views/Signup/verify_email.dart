import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_store/Common/Widget/success_page/success_page.dart';
import 'package:vi_store/Features/Authentication/Views/Login/login.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import 'package:vi_store/Util/Constant/text_strings.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginPage()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ViSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                  width: ViHelpersFunctions.screenWidth() * 0.6,
                  image: AssetImage(ViImages.deliveredEmilIllustration)),
              const SizedBox(height: ViSizes.spaceBtwSections),
              // Title & Subtitle
              Text(
                ViTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: ViSizes.spaceBtwItems),
              Text(
                "theviacoder@gmail.com",
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
                    onPressed: () => Get.to(SuccessPage(
                        image: ViImages.staticSuccessllustration,
                        title: ViTexts.yourAccountCreatedTitle,
                        subtitle: ViTexts.yourAccountCreatedSubtitle,
                        onPressed: () => Get.to(() => const LoginPage()))),
                    child: Text(ViTexts.viContinue)),
              ),
              const SizedBox(height: ViSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: Text(ViTexts.resendEmail)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
