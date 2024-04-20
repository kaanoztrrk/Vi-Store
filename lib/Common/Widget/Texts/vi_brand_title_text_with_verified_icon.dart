import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Constant/enums.dart';
import '../../../Util/Constant/sizes.dart';
import 'vi_brand_title_text.dart';

class ViBrandTitleWithVerifiedIcon extends StatelessWidget {
  const ViBrandTitleWithVerifiedIcon(
      {super.key,
      this.textColor,
      this.iconColor = AppColors.primary,
      this.textAlign = TextAlign.center,
      required this.title,
      this.maxLines = 1,
      this.brandTextSize = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ViBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSizes: brandTextSize,
          ),
        ),
        const SizedBox(width: ViSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: ViSizes.iconXs),
      ],
    );
  }
}
