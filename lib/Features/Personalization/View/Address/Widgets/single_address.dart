import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Common/Widget/Custom_shapes/Containers/rounded_Container.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

class ViSingleAddress extends StatelessWidget {
  const ViSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return ViRoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? AppColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? AppColors.darkerGrey
              : AppColors.grey,
      margin: const EdgeInsets.only(bottom: ViSizes.spaceBtwItems),
      padding: const EdgeInsets.all(ViSizes.md),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? AppColors.ligth
                      : AppColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mehmet Kaan Öztürk",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: ViSizes.sm / 2),
              Text("(+90) 530 392 2283",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: dark
                          ? AppColors.ligth
                          : AppColors.dark.withOpacity(0.6)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: ViSizes.sm / 2),
              Text(
                "Taşyaka Mahallesi 267 sokak No: 51, Fethiye / Muğla",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: dark
                        ? AppColors.ligth
                        : AppColors.dark.withOpacity(0.6)),
                softWrap: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
