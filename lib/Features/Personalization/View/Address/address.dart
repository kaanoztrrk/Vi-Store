import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Common/Widget/Appbar/appbar.dart';
import 'package:vi_store/Features/Personalization/View/Address/Widgets/single_address.dart';
import 'package:vi_store/Features/Personalization/View/Address/add_new_address.dart';
import 'package:vi_store/Util/Constant/colors.dart';
import 'package:vi_store/Util/Constant/sizes.dart';

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
