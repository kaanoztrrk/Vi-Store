import 'package:get/get.dart';
import 'package:vi_store/Util/validators/network_Manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
