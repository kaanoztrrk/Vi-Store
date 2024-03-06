import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Features/Authentication/Views/Signup/Widget/terms_conditions_checkbox.dart';

import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Constant/text_strings.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

class ViSignupForm extends StatelessWidget {
  const ViSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: ViTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(width: ViSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
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
            expands: false,
            decoration: const InputDecoration(
                labelText: ViTexts.userName,
                prefixIcon: Icon(Iconsax.user_edit))),
        const SizedBox(height: ViSizes.spaceBtwInputFields),
        TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: ViTexts.email, prefixIcon: Icon(Iconsax.direct))),
        const SizedBox(height: ViSizes.spaceBtwInputFields),
        TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: ViTexts.phoneNo, prefixIcon: Icon(Iconsax.call))),
        const SizedBox(height: ViSizes.spaceBtwInputFields),
        TextFormField(
          obscureText: true,
          expands: false,
          decoration: const InputDecoration(
            labelText: ViTexts.password,
            prefixIcon: Icon(Iconsax.eye_slash),
            suffixIcon: Icon(Iconsax.password_check),
          ),
        ),
        const SizedBox(height: ViSizes.spaceBtwSections),
        const ViTermAndConditionCheckbox(),
        const SizedBox(height: ViSizes.spaceBtwInputFields),
      ],
    ));
  }
}
