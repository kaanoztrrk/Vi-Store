import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Common/Styles/spacing_styles.dart';
import 'package:vi_store/Features/Authentication/Views/Signup/Signup.dart';
import 'package:vi_store/Util/Constant/colors.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import 'package:vi_store/Util/Constant/text_strings.dart';
import 'package:vi_store/Util/Helpers/helpers_functions.dart';

import '../../../../Common/Widget/login_divider.dart';
import 'Widget/login_header.dart';
import '../../../../Common/Widget/login_social_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ViSpacingStyle.paddingWithAppBarHeigth,
          child: Column(
            children: [
              // Logo, Title & SubTitle
              ViLoginHeader(),

              // Form
              const ViLoginForm(),

              // Divider
              ViFormDivider(dividerText: ViTexts.orSignInWith.capitalize!),
              const SizedBox(height: ViSizes.spaceBtwSections),

              // Footer
              const ViSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}

class ViLoginForm extends StatelessWidget {
  const ViLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ViSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: ViTexts.email,
              ),
            ),
            const SizedBox(height: ViSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: ViTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: ViSizes.spaceBtwInputFields / 2),

            // Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(ViTexts.rememberMe),
                  ],
                ),
                //Forget Password,
                TextButton(
                    onPressed: () {}, child: const Text(ViTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: ViSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text(ViTexts.signIn)),
            ),
            const SizedBox(height: ViSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupPage()),
                  child: const Text(ViTexts.createAccount)),
            )
          ],
        ),
      ),
    );
  }
}
