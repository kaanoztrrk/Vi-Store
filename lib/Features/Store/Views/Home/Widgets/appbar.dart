import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../../Common/Widget/Products/cart/cart_menu_icon.dart';
import '../../../../../Common/Widget/shimmer/shimmer.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/text_strings.dart';
import '../../../../Personalization/Controllers/user_controller.dart';

class ViHomeAppBar extends StatelessWidget {
  const ViHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ViAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ViTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: AppColors.grey)),
          // User Name
          Obx(() {
            if (controller.profileLoading.value) {
              return const ViSshimmerEffect(width: 80, heigth: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: AppColors.grey));
            }
          }),
        ],
      ),
      actions: const [
        ViCardCounterIcon(
          iconColor: AppColors.white,
        )
      ],
    );
  }
}
