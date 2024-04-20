import 'package:flutter/material.dart';

import '../../../../Util/Constant/colors.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Helpers/helpers_functions.dart';
import '../../Custom_shapes/Containers/rounded_Container.dart';

class ViCouponCode extends StatelessWidget {
  const ViCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return ViRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.only(
          top: ViSizes.sm,
          bottom: ViSizes.sm,
          right: ViSizes.sm,
          left: ViSizes.md),
      backgroundColor: dark ? AppColors.dark : AppColors.white,
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
                decoration: const InputDecoration(
              hintText: 'Have a promo code? Enter here',
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            )),
          ),

          // Buttons

          SizedBox(
              width: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: dark
                          ? AppColors.white.withOpacity(0.5)
                          : AppColors.dark.withOpacity(0.5),
                      backgroundColor: AppColors.grey.withOpacity(0.2),
                      side: BorderSide(color: AppColors.grey.withOpacity(0.1))),
                  onPressed: () {},
                  child: const Text("Apply")))
        ],
      ),
    );
  }
}
