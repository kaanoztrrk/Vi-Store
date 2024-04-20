import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Common/Widget/Custom_shapes/Containers/rounded_Container.dart';
import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Helpers/helpers_functions.dart';

class ViOrderListItems extends StatelessWidget {
  const ViOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ViHelpersFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (_, index) {
        return ViRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(ViSizes.md),
          backgroundColor: dark ? AppColors.dark : AppColors.ligth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(Iconsax.ship),
                  const SizedBox(width: ViSizes.spaceBtwItems / 2),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Processing",
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: AppColors.primary, fontWeightDelta: 1)),
                        Text("07, Nov 2024",
                            style: Theme.of(context).textTheme.headlineSmall)
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.arrow_right_34,
                          size: ViSizes.iconSm))
                ],
              ),
              const SizedBox(height: ViSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Iconsax.ship),
                        const SizedBox(width: ViSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order",
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text("[#256f2]",
                                  style:
                                      Theme.of(context).textTheme.titleMedium)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Iconsax.ship),
                        const SizedBox(width: ViSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Shipping Date",
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text("03 Feb 2025",
                                  style:
                                      Theme.of(context).textTheme.titleMedium)
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) =>
          const SizedBox(height: ViSizes.spaceBtwItems),
    );
  }
}
