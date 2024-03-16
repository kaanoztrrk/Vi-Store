import 'package:flutter/material.dart';

import '../../../../../Common/Widget/Appbar/appbar.dart';
import '../../../../../Common/Widget/Products/cart/cart_menu_icon.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/text_strings.dart';

class ViHomeAppBar extends StatelessWidget {
  const ViHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          Text(ViTexts.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: AppColors.grey)),
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
