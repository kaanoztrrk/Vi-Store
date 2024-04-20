import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../Features/Personalization/View/Settings/settings.dart';
import '../Features/Store/Views/Home/home.dart';
import '../Features/Store/Views/Store/store.dart';
import '../Features/Store/Views/Wishlist/wishlist.dart';
import '../Util/Constant/colors.dart';
import '../Util/Helpers/helpers_functions.dart';

class NavigatorMenu extends StatelessWidget {
  const NavigatorMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkmode = ViHelpersFunctions.isDarkMode(context);
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: darkmode ? AppColors.black : AppColors.white,
            indicatorColor: darkmode
                ? AppColors.white.withOpacity(0.3)
                : AppColors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'Wishlist'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          ),
        ),
        body: Obx(
          () => controller.screens[controller.selectedIndex.value],
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    const StorePage(),
    const FavouritePage(),
    const SettingsPage(),
  ];
}
