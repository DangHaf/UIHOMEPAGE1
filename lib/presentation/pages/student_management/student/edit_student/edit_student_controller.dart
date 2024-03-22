import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:template/core/helper/izi_alert.dart';
import 'package:template/data/model/student/student_model.dart';
import 'package:template/data/model/student/student_request.dart';
import 'package:template/data/repositories/student_repositories.dart';
import 'package:template/presentation/pages/student_management/student/student_management_controller.dart';

class EditStudentController extends GetxController {
  late final StudentModel studentModel;

  final StudentRepository studentRepository = GetIt.I.get<StudentRepository>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController averageController = TextEditingController();
  RxList<String> listSelectedSubject = <String>[].obs;
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    studentModel = Get.arguments;
    listSelectedSubject.assignAll(studentModel.registeredCourses ?? {});
    getTextEditingValue();
    super.onInit();
  }

  void getTextEditingValue() {
    fullNameController.text = studentModel.fullName ?? '';
    classController.text = studentModel.classInfo ?? '';
    studentIdController.text = studentModel.id;
    emailController.text = studentModel.contactInfo?.email ?? '';
    dateController.text = studentModel.dateOfBirth.toString();
    addressController.text = studentModel.contactInfo?.address ?? '';
    phoneController.text = studentModel.contactInfo?.phoneNumber ?? '';
    averageController.text = studentModel.averageScore.toString();
  }

  void saveSelectedSubjects(List<String> selectedSubjects) {
    listSelectedSubject.assignAll(selectedSubjects);
  }

  Future<void> updateStudent() async {
    _isLoading.value = true;
    final ContactInfoRequest contactInfo = ContactInfoRequest(
      id: studentModel.id,
      address: addressController.text.isNotEmpty
          ? addressController.text
          : studentModel.contactInfo?.address,
      email: emailController.text.isNotEmpty
          ? emailController.text
          : studentModel.contactInfo?.email,
      phoneNumber: phoneController.text.isNotEmpty
          ? phoneController.text
          : studentModel.contactInfo?.phoneNumber,
    );
    final UpdateStudentRequest updateStudentRequest = UpdateStudentRequest(
        contactInfo: contactInfo,
        registeredCourses: listSelectedSubject,
        averageScore: averageController.text.isNotEmpty
            ? double.parse(averageController.text)
            : studentModel.averageScore,
        dateOfBirth: dateController.text.isNotEmpty
            ? int.parse(dateController.text)
            : studentModel.dateOfBirth,
        fullName: fullNameController.text.isNotEmpty
            ? fullNameController.text
            : studentModel.fullName);

    await studentRepository.updateStudent(
      id: studentModel.id,
      data: updateStudentRequest,
      onSuccess: () {
        final studentController = Get.find<StudentManagementController>();
        studentController.getAllStudents();
        IZIAlert().success(message: 'Successfully updated');
      },
      onError: (error) {
        EasyLoading.dismiss();
        IZIAlert().error(message: error.toString());
      },
    );
    _isLoading.value = false;
  }
}
