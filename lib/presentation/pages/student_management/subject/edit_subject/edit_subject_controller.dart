import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/core/helper/izi_alert.dart';
import 'package:template/data/model/student/add_student_subject_request.dart';
import 'package:template/data/model/student/subject_model.dart';
import 'package:template/data/repositories/student_repositories.dart';
import 'package:template/presentation/pages/student_management/student/student_management_controller.dart';

class EditSubjectController extends GetxController {
  late final SubjectModel subjectModel;
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
    subjectModel = Get.arguments;
    listSelectedSubject.assignAll(subjectModel.registeredCourses ?? {''});
    getTextEditingValue();
    checkDropDownValue();

    super.onInit();
  }

  void checkDropDownValue() {
    switch (subjectModel.registrationStatus) {
      case 'CONFIRMED':
        dropDownValue.value = items[0];
      case 'AWAITING':
        dropDownValue.value = items[1];
      case 'DECLINED':
        dropDownValue.value = items[2];
    }
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

  void getTextEditingValue() {
    fullNameController.text = subjectModel.fullName ?? '';
    classController.text = subjectModel.classInfo ?? '';
    studentIdController.text = subjectModel.studentId ?? '';
    schoolTermController.text = subjectModel.semester ?? '';
    dateController.text = subjectModel.creditHours.toString();
  }

  void addSelectedSubjects(String selectedSubjects) {
    listSelectedSubject.add(selectedSubjects);
  }


  Future<void> updateSubject() async {
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

    await studentRepository.updateSubject(
        id: subjectModel.id,
        data: addStudentSubjectRequest,
        onSuccess: () {
          final studentController = Get.find<StudentManagementController>();
          studentController.getAllSubject();
          IZIAlert().success(message: 'Successfully updated');
        },
        onError: (error) {
          EasyLoading.dismiss();
          IZIAlert().error(message: error.toString());
        });
    _isLoading.value = false;
  }
}
