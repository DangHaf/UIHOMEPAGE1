import 'package:get/get.dart';
import 'add_student_controller.dart';

class AddStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddStudentController>(() => AddStudentController());
  }
}
