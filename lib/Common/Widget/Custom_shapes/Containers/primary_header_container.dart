import 'package:flutter/material.dart';

import '../../../../Util/Constant/colors.dart';
import '../Curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class ViPrimaryHeaderContainer extends StatelessWidget {
  const ViPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ViCurvedEdgeWidget(
      child: Container(
        color: AppColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: ViCircularContainer(
                  backgroundColor: AppColors.textWhite.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: ViCircularContainer(
                  backgroundColor: AppColors.textWhite.withOpacity(0.1)),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
