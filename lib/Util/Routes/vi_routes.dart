import 'package:flutter/material.dart';

class ViRoutes {
  static const String order = '/order';
  static const String profile = '/profile';
  // Diğer rotalar buraya eklenebilir
}

class ViNavigator {
  static void navigateToOrderScreen(BuildContext context) {
    Navigator.pushNamed(context, ViRoutes.order);
  }

  static void navigateToProfileScreen(BuildContext context) {
    Navigator.pushNamed(context, ViRoutes.profile);
  }

  // Diğer yönlendirme işlevleri buraya eklenebilir
}
