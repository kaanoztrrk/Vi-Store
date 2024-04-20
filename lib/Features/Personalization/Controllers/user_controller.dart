import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Data/Model/User/user._model.dart';
import '../../../Data/Repositories/Authentication/authentication_repository.dart';
import '../../../Data/Repositories/User/user_repository.dart';
import '../../../Util/Constant/image_strings.dart';
import '../../../Util/Constant/sizes.dart';
import '../../../Util/Loader/vi_loader.dart';
import '../../../Util/Popups/full_screen_loader.dart';
import '../../../Util/validators/network_Manager.dart';
import '../../Authentication/Views/Login/login.dart';
import '../View/Profile/Widget/re_authenticate_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // Reflesh User Record
      await fetchUserRecord();

      //  if no record already record
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // convert name to first and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUserName(
              userCredentials.user!.displayName ?? '');

          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      ViLoaders.warningSnacBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  // Deleye acconut Warning

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(ViSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure want to delete your accunt permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: ViSizes.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text("Cancel")),
    );
  }

  void deleteUserAccount() async {
    try {
      ViFullScreenLoader.openLoadingDialog('Processing', ViImages.doteImage);

      // First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider == 'google.com') {
        await auth.signInWithGoogle();
        await auth.deleteAccount();
        ViFullScreenLoader.stopLoading();
        Get.offAll(() => const LoginPage());
      } else if (provider == 'password') {
        ViFullScreenLoader.stopLoading();
        Get.to(() => const ReAuthLoginForm());
      }
    } catch (e) {
      ViFullScreenLoader.stopLoading();
      ViLoaders.warningSnacBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void reAuthenticateEmailAndPasswordUser() async {
    try {
      ViFullScreenLoader.openLoadingDialog('Progressing', ViImages.doteImage);

      // check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ViFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        ViFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      ViFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginPage());
    } catch (e) {
      ViFullScreenLoader.stopLoading();
      ViLoaders.warningSnacBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Upload Profile Image
  uploadUserProfilePictures() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        // Upload Image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update User Image recod
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        ViLoaders.successSnacBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      ViLoaders.errorSnacBar(
          title: 'Oh Snap', message: 'Something went wrong : $e');
    }
  }
}
