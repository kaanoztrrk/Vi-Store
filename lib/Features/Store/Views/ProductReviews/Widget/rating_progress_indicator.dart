import 'package:flutter/material.dart';

import 'progress_indicator_and_rating.dart';

class ViOverallProductRating extends StatelessWidget {
  const ViOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child:
                Text("4.8", style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              ViRatingProgressIndicator(text: "5", value: 1.0),
              ViRatingProgressIndicator(text: "4", value: 0.8),
              ViRatingProgressIndicator(text: "3", value: 0.6),
              ViRatingProgressIndicator(text: "2", value: 0.4),
              ViRatingProgressIndicator(text: "1", value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
