import 'package:get/get.dart';
import 'package:template/presentation/pages/student_management/evaluation/add_evaluation/add_evaluation_controller.dart';

class AddEvaluationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEvaluationController>(() => AddEvaluationController());
  }
}
