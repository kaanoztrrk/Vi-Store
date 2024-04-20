import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Util/Constant/sizes.dart';

class ViRatingandShare extends StatelessWidget {
  const ViRatingandShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: ViSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(text: "(201)")
            ])),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: ViSizes.iconMd,
            ))
      ],
    );
  }
}
