import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Constant/text_strings.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';
import '../../../Controller/Signup/signup_controller.dart';

class ViTermAndConditionCheckbox extends StatelessWidget {
  const ViTermAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = ViHelpersFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 15,
            height: 15,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        const SizedBox(width: ViSizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${ViTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: ViTexts.privacyPolicy,
              style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: dark ? AppColors.ligth : AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? AppColors.white : AppColors.primary)),
          TextSpan(
              text: ' ${ViTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: ViTexts.termsofUse,
              style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: dark ? AppColors.ligth : AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? AppColors.white : AppColors.primary)),
        ])),
      ],
    );
  }
}
