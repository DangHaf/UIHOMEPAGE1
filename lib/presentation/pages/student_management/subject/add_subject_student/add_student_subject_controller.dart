import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/core/helper/izi_alert.dart';
import 'package:template/data/model/student/add_student_subject_request.dart';
import 'package:template/data/repositories/student_repositories.dart';
import 'package:template/presentation/pages/student_management/student/student_management_controller.dart';

class AddStudentSubjectController extends GetxController {
  final StudentRepository studentRepository = GetIt.I.get<StudentRepository>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController schoolTermController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  RxList<String> listSelectedSubject = <String>[].obs;
  List<String> items = ['confirm'.tr, 'awaiting'.tr, 'declined'.tr];
  RxString dropDownValue = ''.obs;
  String registrationStatus = '';
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    dropDownValue.value = items[1];
    super.onInit();
  }

  void addSelectedSubjects(String selectedSubjects) {
    listSelectedSubject.add(selectedSubjects);
  }

  void checkRegistrationStatus(String dropDownValue) {
    switch (dropDownValue) {
      case 'Đã xác nhận':
        registrationStatus = 'CONFIRMED';
      case 'Chờ xác nhận':
        registrationStatus = 'AWAITING';
      case 'Từ chối':
        registrationStatus = 'DECLINED';
    }
  }

  Future<void> addStudentSubject() async {
    _isLoading.value = true;
    checkRegistrationStatus(dropDownValue.value);
    final AddStudentSubjectRequest addStudentSubjectRequest =
        AddStudentSubjectRequest(
            fullName: fullNameController.text,
            className: classController.text,
            registeredCourses: listSelectedSubject,
            semester: schoolTermController.text,
            creditHours: int.parse(dateController.text),
            registrationStatus: registrationStatus);

    await studentRepository.addStudentSubject(
        data: addStudentSubjectRequest,
        onSuccess: () {
          final studentController = Get.find<StudentManagementController>();
          studentController.getAllSubject();
          IZIAlert().success(message: 'Add Student Successfully');
        },
        onError: (error) {
          EasyLoading.dismiss();
          IZIAlert().error(message: error.toString());
        });
    _isLoading.value = false;
  }
}
