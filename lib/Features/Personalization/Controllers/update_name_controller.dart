import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Data/Repositories/User/user_repository.dart';
import '../../../Util/Constant/image_strings.dart';
import '../../../Util/Loader/vi_loader.dart';
import '../../../Util/Popups/full_screen_loader.dart';
import '../../../Util/validators/network_Manager.dart';
import '../View/Profile/profile.dart';
import 'user_controller.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init user data when Home Screen appears

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      ViFullScreenLoader.openLoadingDialog(
          'We are updating your information', ViImages.doteImage);

      // Check Internet Connecetivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ViFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        ViFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the firebase firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };

      await userRepository.updateSingleField(name);

      // update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      ViFullScreenLoader.stopLoading();

      //show Sccuess Message
      ViLoaders.successSnacBar(
          title: 'Congratulations', message: 'Your Name has been updated.');

      // move to previous screen
      Get.off(() => const ProfilePage());
    } catch (e) {
      ViFullScreenLoader.stopLoading();
      ViLoaders.errorSnacBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
