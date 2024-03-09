import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_store/Features/Authentication/Views/OnBoarding/onboarding.dart';

import 'Util/Theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ViAppTheme.ligthTheme,
      darkTheme: ViAppTheme.darkTheme,
      home: const OnBoardingPage(),
    );
  }
}
