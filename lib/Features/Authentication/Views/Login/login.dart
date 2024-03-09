import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_store/Common/Styles/spacing_styles.dart';
import 'package:vi_store/Util/Constant/sizes.dart';
import 'package:vi_store/Util/Constant/text_strings.dart';
import '../../../../Common/Widget/Login_signup/login_divider.dart';
import 'Widget/login_form.dart';
import 'Widget/login_header.dart';
import '../../../../Common/Widget/Login_signup/login_social_buttons.dart';

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
              const ViLoginHeader(),

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
