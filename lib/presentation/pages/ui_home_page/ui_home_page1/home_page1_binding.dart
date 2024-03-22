import 'package:get/get.dart';
import 'home_page1_controller.dart';

class HomePage1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePage1Controller>(() => HomePage1Controller());
  }
}
