import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../Data/Repositories/Authentication/authentication_repository.dart';
import '../../../../Util/Constant/image_strings.dart';
import '../../../../Util/Loader/vi_Loader.dart';
import '../../../../Util/Popups/full_screen_loader.dart';
import '../../../../Util/validators/network_Manager.dart';
import '../../../Personalization/Controllers/user_controller.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  @override
  void onInit() {
    final rememberEmail = localStorage.read('REMEMBER_ME_EMAIL');
    final rememberPassword = localStorage.read('REMEMBER_ME_PASSWORD');
    if (rememberEmail != null) {
      email.text = rememberEmail;
    }
    if (rememberPassword != null) {
      password.text = rememberPassword;
    }
    super.onInit();
  }

  // -- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      ViFullScreenLoader.openLoadingDialog(
          'Logging you in...', ViImages.doteImage);

      // check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ViFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        ViFullScreenLoader.stopLoading();
        return;
      }

      // save data if rememeber me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      // login user using email  & password auuthentication
      /*   final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());*/

      ViFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // show some generic error to user
      ViFullScreenLoader.stopLoading();
      ViLoaders.errorSnacBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // --Google SignI Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      ViFullScreenLoader.openLoadingDialog(
          'Logging you in...', ViImages.doteImage);

      // Google Auth
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader

      ViFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      ViLoaders.errorSnacBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
