import 'package:get/get.dart';
import 'add_student_subject_controller.dart';

class AddStudentSubjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddStudentSubjectController>(
        () => AddStudentSubjectController());
  }
}
