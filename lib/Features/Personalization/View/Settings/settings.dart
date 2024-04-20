import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Common/Widget/Custom_shapes/Containers/primary_header_container.dart';
import '../../../../Common/Widget/List_Tiles/settings_menu_tile.dart';
import '../../../../Common/Widget/List_Tiles/user_profile_tile.dart';
import '../../../../Common/Widget/Texts/section_heading.dart';
import '../../../../Data/Repositories/Authentication/authentication_repository.dart';
import '../../../../Util/Constant/colors.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../Store/Views/Order/order.dart';
import '../Address/address.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            ViPrimaryHeaderContainer(
                child: Column(
              children: [
                ViAppBar(
                  title: Text(
                    "Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: AppColors.white),
                  ),
                ),
                const ViUserProfileTile(),
                const SizedBox(height: ViSizes.spaceBtwSections),
              ],
            )),
            // Body

            Padding(
              padding: const EdgeInsets.all(ViSizes.defaultSpace),
              child: Column(
                children: [
                  const ViSectionHeading(
                      title: "Account Settings", showActionButton: false),
                  const SizedBox(height: ViSizes.spaceBtwItems),

                  // Account Settings
                  ViSettingsMenuTile(
                      onTap: () => Get.to(() => const UserAddressPage()),
                      icon: Iconsax.safe_home,
                      title: "My Addresses",
                      subTitle: "Set shopping delivery address"),
                  ViSettingsMenuTile(
                      onTap: () {},
                      icon: Iconsax.shopping_cart,
                      title: "My Cart",
                      subTitle: "Add, remove products and move to checkout"),
                  ViSettingsMenuTile(
                      onTap: () => Get.to(() => const OrderPage()),
                      icon: Iconsax.bag_tick,
                      title: "My Orders",
                      subTitle: "In-progress and Completed Orders"),

                  ViSettingsMenuTile(
                      onTap: () {},
                      icon: Iconsax.bank,
                      title: "Bank Account",
                      subTitle: "Withdraw balanceto registered bank account"),
                  ViSettingsMenuTile(
                      onTap: () {},
                      icon: Iconsax.discount_shape,
                      title: "My Coupons",
                      subTitle: "Lİst of all the discounted coupons"),
                  ViSettingsMenuTile(
                      onTap: () {},
                      icon: Iconsax.notification,
                      title: "Notification",
                      subTitle: "Set any kind of notification message"),
                  ViSettingsMenuTile(
                      onTap: () {},
                      icon: Iconsax.security_card,
                      title: "Account Privacy",
                      subTitle: "Manage data usage and connected accounts"),

                  // App Settings
                  const SizedBox(height: ViSizes.spaceBtwItems),
                  const ViSectionHeading(
                      title: "App Settings", showActionButton: false),
                  const SizedBox(height: ViSizes.spaceBtwItems),
                  ViSettingsMenuTile(
                      onTap: () {},
                      icon: Iconsax.document_upload,
                      title: "Load Data",
                      subTitle: "Upload Data to your Cloud Firebase"),

                  ViSettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Geolocation",
                    subTitle: "Set recommendation based on location",
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  ViSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subTitle: "Search result is safe for all ages",
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  ViSettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subTitle: "Set image quality to be seen",
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: ViSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => controller.logout(),
                        child: const Text("Logout")),
                  ),

                  const SizedBox(height: ViSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
