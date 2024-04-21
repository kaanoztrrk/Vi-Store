import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Constant/text_strings.dart';
import '../../../../Util/validators/validationHelpers.dart';
import '../../Controller/ForgetPassword/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: const ViAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ViSizes.defaultSpace),
        child: Column(
          children: [
            // Headings
            Text(ViTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: ViSizes.spaceBtwItems),
            Text(ViTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: ViSizes.spaceBtwSections * 2),

            // TextField
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: ViValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: ViTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(height: ViSizes.spaceBtwSections),

            //Submit Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: const Text(ViTexts.submit)))
          ],
        ),
      ),
    );
  }
}
