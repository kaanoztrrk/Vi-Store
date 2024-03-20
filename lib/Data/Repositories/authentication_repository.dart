import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vi_store/Features/Authentication/Views/Login/login.dart';
import 'package:vi_store/Features/Authentication/Views/OnBoarding/onboarding.dart';
import 'package:vi_store/Features/Authentication/Views/Signup/verify_email.dart';

import '../../Util/Exception/firebase_auth_exceptions.dart';
import '../../Util/Exception/firebase_exceptions.dart';
import '../../Util/Exception/format_exceptions.dart';
import '../../Util/Exception/platform_exceptions.dart';
import '../../navigation_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigatorMenu());
      } else {
        Get.offAll(() => VerifyEmailPage(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      if (kDebugMode) {
        print(
            '==================== GET STORAGE AUTH REPO ====================');
        print(deviceStorage.read('IsFirstTime'));
      }
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginPage())
          : Get.offAll(const OnBoardingPage());
    }
  }
  // Local Storge

  /*--------------------------- ----------------------Email & Password sign-in ------------------------------------ */

  /// Email Auth - Sign In
  /// Email Auth - REGİSTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw ViFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw ViFormatException().message;
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// REAuth     - REAuth User
  /// Email Verification - MAİL VERİFİCATİON
  Future<void> sendEmailVerification() async {
    try {
      return _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw ViFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ViFormatException();
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Email Verification - FORGET PASSWORD

  /*--------------------------- ----------------Federated İdentity & social sign in ------------------------------------ */

  /// Google AUTH - GOOGLE
  /// FaceBook AUTH - FACEBOOK

  /*--------------------------- ---------------./end Federated identity & social sign in------------------------------------ */

  /// Logout User - Valid for any auth
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginPage());
    } on FirebaseAuthException catch (e) {
      throw ViFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ViFormatException();
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// DELETE USER - Remove user auth and Firestore Account
}
