import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vi_store/Data/Repositories/authentication_repository.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Popups/full_screen_loader.dart';
import 'package:vi_store/Util/validators/network_Manager.dart';

import '../../../../Util/Loader/vi_Loader.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      ViFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // show some generic error to user
      ViFullScreenLoader.stopLoading();
      ViLoaders.errorSnacBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
