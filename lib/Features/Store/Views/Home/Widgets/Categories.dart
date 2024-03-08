import 'package:flutter/material.dart';

import '../../../../../Common/Widget/Image_Text_Widget/vertical_image_text.dart';
import '../../../../../Util/Constant/image_strings.dart';

class ViHomeCategories extends StatelessWidget {
  const ViHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return const ViVerticalImageText(
              image: ViImages.clothes, title: 'Clothes');
        },
      ),
    );
  }
}
