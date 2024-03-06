import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Common/Widget/login_divider.dart';
import 'package:vi_store/Common/Widget/login_social_buttons.dart';
import 'package:vi_store/Util/Constant/colors.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import 'package:vi_store/Util/Constant/text_strings.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';

import 'Widget/signup_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Iconsax.arrow_left),
          color: dark ? AppColors.ligth : AppColors.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ViSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ViTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: ViSizes.spaceBtwSections),
              const ViSignupForm(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(ViTexts.createAccount),
                ),
              ),
              const SizedBox(height: ViSizes.spaceBtwSections),
              ViFormDivider(dividerText: ViTexts.orSignUpWith.capitalize!),
              const SizedBox(height: ViSizes.spaceBtwSections),
              const ViSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
