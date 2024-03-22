import 'package:get/get.dart';
import 'edit_subject_controller.dart';

class EditSubjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditSubjectController>(() => EditSubjectController());
  }
}
