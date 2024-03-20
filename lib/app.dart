import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_store/Bindings/general_bindings.dart';
import 'package:vi_store/Util/Constant/colors.dart';

import 'Util/Theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: ViAppTheme.ligthTheme,
        darkTheme: ViAppTheme.darkTheme,
        initialBinding: GeneralBindings(),
        home: const Scaffold(
          backgroundColor: AppColors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white)),
        ));
  }
}
