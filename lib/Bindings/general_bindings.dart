import 'package:get/get.dart';

import '../Util/validators/network_Manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
