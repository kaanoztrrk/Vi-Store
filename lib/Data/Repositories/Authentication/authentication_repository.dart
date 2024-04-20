import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../Features/Authentication/Views/Login/login.dart';
import '../../../Features/Authentication/Views/OnBoarding/onboarding.dart';
import '../../../Features/Authentication/Views/Signup/verify_email.dart';
import '../../../Util/Exception/firebase_auth_exceptions.dart';
import '../../../Util/Exception/firebase_exceptions.dart';
import '../../../Util/Exception/format_exceptions.dart';
import '../../../Util/Exception/platform_exceptions.dart';
import '../../../Core/navigation_menu.dart';
import '../User/user_repository.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  //Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      // if the user is logged in
      if (user.emailVerified) {
        Get.offAll(() => const NavigatorMenu());
      } else {
        Get.offAll(() => VerifyEmailPage(email: _auth.currentUser?.email));
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
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw ViFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ViFormatException().message;
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

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
      throw const ViFormatException().message;
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// REAuth     - REAuth User
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      // Create a credental
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
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
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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

  /*--------------------------- ----------------Federated İdentity & social sign in ------------------------------------ */

  /// Google AUTH - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Triger the ayth flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Abtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final crendentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once Signed in, return  the USerCredential
      return await _auth.signInWithCredential(crendentials);
    } on FirebaseAuthException catch (e) {
      throw ViFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw ViFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const ViFormatException();
    } on PlatformException catch (e) {
      throw ViPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  /// FaceBook AUTH - FACEBOOK

  /*--------------------------- ---------------./end Federated identity & social sign in------------------------------------ */

  /// Logout User - Valid for any auth
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
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
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
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
}
