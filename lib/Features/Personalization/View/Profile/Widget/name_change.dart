import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Constant/text_strings.dart';
import '../../../../../Util/validators/validationHelpers.dart';
import '../../../Controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: ViAppBar(
        showBackArrow: true,
        title: Text("Change Name",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(ViSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              "Use real name fot easy verification. This name will on several pages.",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: ViSizes.spaceBtwSections),
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        ViValidator.validateEmtyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: ViTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: ViSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        ViValidator.validateEmtyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: ViTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ViSizes.spaceBtwInputFields),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text("Save")),
            )
          ],
        ),
      ),
    );
  }
}
