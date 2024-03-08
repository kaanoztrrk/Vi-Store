import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Features/Authentication/Views/password_configuration/forgot_password.dart';

import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Constant/text_strings.dart';
import '../../../../../navigation_menu.dart';
import '../../Signup/Signup.dart';

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
                    onPressed: () => Get.to(() => const ForgotPassword()),
                    child: const Text(ViTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: ViSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const NavigatorMenu()),
                  child: const Text(ViTexts.signIn)),
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
