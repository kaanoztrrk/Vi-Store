import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Data/Model/User/user._model.dart';
import '../../../../Data/Repositories/Authentication/authentication_repository.dart';
import '../../../../Data/Repositories/User/user_repository.dart';
import '../../../../Util/Constant/image_strings.dart';
import '../../../../Util/Loader/vi_Loader.dart';
import '../../../../Util/Popups/full_screen_loader.dart';
import '../../../../Util/validators/network_Manager.dart';
import '../../Views/Signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// SIGNUP
  void signup() async {
    try {
      // Start Loading
      ViFullScreenLoader.openLoadingDialog(
          'We are processing your information...', ViImages.doteImage);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ViFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        ViFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        ViLoaders.warningSnacBar(
            title: 'Accept Privacy Plicy',
            message:
                'In order to create account, you must have to read and accept the Privacy Plicy & Terms of Use');
        return;
      }

      // Resgister user in the firebase auth & save uer data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      ViFullScreenLoader.stopLoading();

      // show success message

      ViLoaders.successSnacBar(
          title: 'Cogratulations',
          message: 'Your account has been created! Verify email to continue');
      Get.to(() => VerifyEmailPage(email: email.text.trim()));
    } catch (e) {
      // show some generic error to user
      ViLoaders.errorSnacBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loader
      //   ViFullScreenLoader.stopLoading();
    }
  }
}
