// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Common/Widget/Login_signup/login_divider.dart';
import '../../../../Common/Widget/Login_signup/login_social_buttons.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Constant/text_strings.dart';
import 'Widget/signup_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
