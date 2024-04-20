import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../Util/Constant/colors.dart';
import '../../../../Util/Constant/sizes.dart';
import 'Widgets/single_address.dart';
import 'add_new_address.dart';

class UserAddressPage extends StatelessWidget {
  const UserAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressPage()),
        child: const Icon(Iconsax.add, color: AppColors.white),
      ),
      appBar: ViAppBar(
        showBackArrow: true,
        title:
            Text("Addresses", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ViSizes.defaultSpace),
          child: Column(
            children: [
              ViSingleAddress(selectedAddress: false),
              ViSingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}
