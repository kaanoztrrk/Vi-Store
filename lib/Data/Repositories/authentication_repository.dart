import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vi_store/Features/Authentication/Views/Login/login.dart';
import 'package:vi_store/Features/Authentication/Views/OnBoarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();

  //Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    // Local Storge
    if (kDebugMode) {
      print('==================== GET STORAGE AUTH REPO ====================');
      print(deviceStorage.read('IsFirstTime'));
    }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginPage())
        : Get.offAll(const OnBoardingPage());
  }

  /*--------------------------- ----------------------Email & Password sign-in ------------------------------------ */

  /// Email Auth - Sign In
  /// Email Auth - REGİSTER
  /// REAuth     - REAuth User
  /// Email Verification - MAİL VERİFİCATİON
  /// Email Verification - FORGET PASSWORD

  /*--------------------------- ----------------Federated İdentity & social sign in ------------------------------------ */

  /// Google AUTH - GOOGLE
  /// FaceBook AUTH - FACEBOOK

  /*--------------------------- ---------------./end Federated identity & social sign in------------------------------------ */

  /// Logout User - Valid for any auth
  /// DELETE USER - Remove user auth and Firestore Account
}
