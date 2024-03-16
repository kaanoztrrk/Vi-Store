import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Common/Widget/Appbar/appbar.dart';
import 'package:vi_store/Common/Widget/Images/circular_image.dart';
import 'package:vi_store/Common/Widget/Texts/section_heading.dart';
import 'package:vi_store/Features/Personalization/View/Profile/Widget/profile_menu.dart';
import 'package:vi_store/Util/Constant/image_strings.dart';
import 'package:vi_store/Util/Constant/sizes.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ViAppBar(
          showBackArrow: true,
          title: Text("Profile",
              style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ViSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const ViCircularImage(
                        image: ViImages.user, width: 80, heigth: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Change Profile Pictures"))
                  ],
                ),
              ),
              // Details

              const SizedBox(height: ViSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: ViSizes.spaceBtwItems),
              const ViSectionHeading(
                  title: "Profile Information", showActionButton: false),
              const SizedBox(height: ViSizes.spaceBtwItems),

              ViProfileMenu(
                onpressed: () {},
                title: "Name",
                value: "Kaan",
              ),
              ViProfileMenu(
                onpressed: () {},
                title: "Username",
                value: "theviacoder",
              ),

              const SizedBox(height: ViSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: ViSizes.spaceBtwItems),
              ViProfileMenu(
                onpressed: () {},
                title: "User ID",
                value: "523547",
                icon: Iconsax.copy,
              ),
              ViProfileMenu(
                onpressed: () {},
                title: "E-Mail",
                value: "kaanoztrrk411@gmail.com",
              ),
              ViProfileMenu(
                onpressed: () {},
                title: "Phone Number",
                value: "+90-530-392-2283",
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
                    onPressed: () {},
                    child: const Text(
                      "Close Account",
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
