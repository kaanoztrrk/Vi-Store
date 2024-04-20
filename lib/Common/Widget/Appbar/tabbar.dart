import 'package:flutter/material.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Device/device_utility.dart';
import '../../../Util/Helpers/helpers_functions.dart';

class ViTabbar extends StatelessWidget implements PreferredSizeWidget {
  const ViTabbar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ViHelpersFunctions.isDarkMode(context)
          ? AppColors.black
          : AppColors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: AppColors.primary,
          labelColor: ViHelpersFunctions.isDarkMode(context)
              ? AppColors.white
              : AppColors.primary,
          unselectedLabelColor: AppColors.darkerGrey,
          tabs: tabs),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ViDeviceUtils.getAppBarHeigth());
}
