import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vi_store/Features/Personalization/View/Profile/profile.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Constant/image_strings.dart';
import '../Images/circular_image.dart';

class ViUserProfileTile extends StatelessWidget {
  const ViUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ViCircularImage(
          image: ViImages.user, width: 50, heigth: 50, padding: 0),
      title: Text("Coding with Vi...",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: AppColors.white)),
      subtitle: Text("theviacoder",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: AppColors.white)),
      trailing: IconButton(
          onPressed: () => Get.to(const ProfilePage()),
          icon: const Icon(Iconsax.edit, color: AppColors.white)),
    );
  }
}
