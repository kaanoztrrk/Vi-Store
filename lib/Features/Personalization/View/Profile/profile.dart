// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Common/Widget/Image_Text_Widget/vertical_image_text.dart';
import '../../../../Common/Widget/Texts/section_heading.dart';
import '../../../../Util/Constant/image_strings.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../Controllers/user_controller.dart';
import 'Widget/name_change.dart';
import 'Widget/profile_menu.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: ViAppBar(
        showBackArrow: true,
        title:
            Text("Profile", style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ViSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    GetBuilder<UserController>(
                      builder: (controller) {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : ViImages.user;
                        return ViCircularImage(
                          image: image,
                          width: 80,
                          heigth: 80,
                          isNetworkImage: networkImage.isNotEmpty,
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePictures(),
                      child: const Text("Change Profile Pictures"),
                    ),
                  ],
                ),
              ),
              // Details
              const SizedBox(height: ViSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: ViSizes.spaceBtwItems),
              const ViSectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              const SizedBox(height: ViSizes.spaceBtwItems),
              ViProfileMenu(
                onpressed: () => Get.to(() => const ChangeName()),
                title: "Name",
                value: controller.user.value.fullName,
              ),
              ViProfileMenu(
                onpressed: () {},
                title: "Username",
                value: controller.user.value.userName,
              ),
              const SizedBox(height: ViSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: ViSizes.spaceBtwItems),
              ViProfileMenu(
                onpressed: () {},
                title: "User ID",
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              ViProfileMenu(
                onpressed: () {},
                title: "E-Mail",
                value: controller.user.value.email,
              ),
              ViProfileMenu(
                onpressed: () {},
                title: "Phone Number",
                value: controller.user.value.phoneNumber,
              ),
              ViProfileMenu(
                onpressed: () {},
                title: "Gender",
                value: "Male",
              ),
              ViProfileMenu(
                onpressed: () {},
                title: "Date of Birth",
                value: "12 Jan 2002",
              ),
              const Divider(),
              const SizedBox(height: ViSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
