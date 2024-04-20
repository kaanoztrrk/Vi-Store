import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Constant/text_strings.dart';
import '../../../../../Util/validators/validationHelpers.dart';
import '../../../Controller/Signup/signup_controller.dart';
import 'terms_conditions_checkbox.dart';

class ViSignupForm extends StatelessWidget {
  const ViSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        ViValidator.validateEmtyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: ViTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: ViSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        ViValidator.validateEmtyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: ViTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ViSizes.spaceBtwInputFields),
            TextFormField(
                controller: controller.userName,
                validator: (value) =>
                    ViValidator.validateEmtyText('Username', value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: ViTexts.userName,
                    prefixIcon: Icon(Iconsax.user_edit))),
            const SizedBox(height: ViSizes.spaceBtwInputFields),
            TextFormField(
                controller: controller.email,
                validator: (value) => ViValidator.validateEmail(value!),
                expands: false,
                decoration: const InputDecoration(
                    labelText: ViTexts.email,
                    prefixIcon: Icon(Iconsax.direct))),
            const SizedBox(height: ViSizes.spaceBtwInputFields),
            TextFormField(
                controller: controller.phoneNumber,
                validator: (value) => ViValidator.validatePhoneNumber(value!),
                expands: false,
                decoration: const InputDecoration(
                    labelText: ViTexts.phoneNo,
                    prefixIcon: Icon(Iconsax.call))),
            const SizedBox(height: ViSizes.spaceBtwInputFields),
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
            const SizedBox(height: ViSizes.spaceBtwSections),
            const ViTermAndConditionCheckbox(),
            const SizedBox(height: ViSizes.spaceBtwInputFields),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(ViTexts.createAccount),
              ),
            ),
          ],
        ));
  }
}
