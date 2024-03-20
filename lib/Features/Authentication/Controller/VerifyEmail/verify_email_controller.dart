import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:vi_store/Common/Widget/success_page/success_page.dart';
import 'package:vi_store/Data/Repositories/authentication_repository.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/text_strings.dart';
import 'package:vi_store/Util/Loader/vi_loader.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send Email Whever Verify Screen Appears & Set Timer for auto redirect
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sendEmailVerification();
    setTimerForAutoRedirect();
  }

  /// Send Email Verification link
  void sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ViLoaders.successSnacBar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verify email');
    } catch (e) {
      ViLoaders.errorSnacBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verfication

  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessPage(
            image: ViImages.staticSuccessllustration,
            title: ViTexts.yourAccountCreatedTitle,
            subtitle: ViTexts.yourAccountCreatedSubtitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  /// Manually  Check if Email Verified
  void checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessPage(
          image: ViImages.staticSuccessllustration,
          title: ViTexts.yourAccountCreatedTitle,
          subtitle: ViTexts.yourAccountCreatedSubtitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()));
    }
  }
}
