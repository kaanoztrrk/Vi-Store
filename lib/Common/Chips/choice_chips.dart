// ignore_for_file: prefer_null_aware_operators

import 'package:flutter/material.dart';

import '../../Util/Constant/colors.dart';
import '../../Util/Helpers/helpers_functions.dart';
import '../Widget/Custom_shapes/Containers/circular_container.dart';

class ViChoiceChip extends StatelessWidget {
  const ViChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = ViHelpersFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        // ignore: dead_code
        labelStyle: TextStyle(color: selected ? AppColors.white : null),
        avatar: isColor
            ? ViCircularContainer(
                width: 50,
                heigth: 50,
                backgroundColor: ViHelpersFunctions.getColor(text)!)
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: isColor ? ViHelpersFunctions.getColor(text)! : null,
      ),
    );
  }
}
