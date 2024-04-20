import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../Data/Repositories/Authentication/authentication_repository.dart';
import '../../../../Util/Constant/image_strings.dart';
import '../../../../Util/Loader/vi_loader.dart';
import '../../../../Util/Popups/full_screen_loader.dart';
import '../../../../Util/validators/network_Manager.dart';
import '../../Views/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      ViFullScreenLoader.openLoadingDialog(
          'Processing your request...', ViImages.doteImage);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ViFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        ViFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      ViFullScreenLoader.stopLoading();

      // Show Sccess Screen
      ViLoaders.successSnacBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);

      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      ViFullScreenLoader.stopLoading();
      ViLoaders.errorSnacBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      ViFullScreenLoader.openLoadingDialog(
          'Processing your request...', ViImages.doteImage);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ViFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        ViFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      ViFullScreenLoader.stopLoading();

      // Show Sccess Screen
      ViLoaders.successSnacBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);
    } catch (e) {
      ViFullScreenLoader.stopLoading();
      ViLoaders.errorSnacBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
