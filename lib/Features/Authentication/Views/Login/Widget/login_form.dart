import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Constant/text_strings.dart';
import '../../../../../Util/validators/validationHelpers.dart';
import '../../../Controller/Login/login_controller.dart';
import '../../Signup/Signup.dart';
import '../../password_configuration/forgot_password.dart';

class ViLoginForm extends StatelessWidget {
  const ViLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ViSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => ViValidator.validateEmail(value!),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: ViTexts.email,
              ),
            ),
            const SizedBox(height: ViSizes.spaceBtwInputFields),

            // Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => ViValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                expands: false,
                decoration: InputDecoration(
                  labelText: ViTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
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
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(ViTexts.rememberMe),
                  ],
                ),
                //Forget Password,
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(ViTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: ViSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(),
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
