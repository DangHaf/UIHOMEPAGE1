import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:template/core/helper/izi_alert.dart';
import 'package:template/data/model/student/student_model.dart';
import 'package:template/data/model/student/subject_model.dart';
import 'package:template/data/repositories/student_repositories.dart';

class StudentManagementController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final StudentRepository _studentRepository = GetIt.I.get<StudentRepository>();
  RxList<StudentModel> listStudents = <StudentModel>[].obs;
  RxList<SubjectModel> listSubject = <SubjectModel>[].obs;
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  List<String> tabList = ['Students', 'Subject', 'Evaluation', 'Event'];
  bool isFirstLoading = true;
  final RefreshController refreshControllerStudent = RefreshController();
  final RefreshController refreshControllerSubject = RefreshController();

  @override
  void onInit() {
    getAllStudents();
    super.onInit();
  }

  void selectTab(int index) {
    selectedIndex.value = index;
    if (selectedIndex.value == 1 && isFirstLoading) {
      getAllSubject();
      isFirstLoading = false;
    }
  }

  Future<void> initDataStudent({bool isRefresh = false}) async {
    if (!isRefresh) {
      _isLoading.value = true;
    }
    await getAllStudents();
    if (isRefresh) {
      refreshControllerStudent.refreshCompleted();
    } else {
      _isLoading.value = false;
    }
  }

  Future<void> initDataSubject({bool isRefresh = false}) async {
    if (!isRefresh) {
      _isLoading.value = true;
    }
    await getAllStudents();
    if (isRefresh) {
      refreshControllerSubject.refreshCompleted();
    } else {
      _isLoading.value = false;
    }
  }

  Future<void> getAllStudents() async {
    await _studentRepository.getAllStudent(
      onSuccess: (data) {
        listStudents.assignAll(data);
      },
      onError: (_) {},
    );
    refreshControllerStudent.loadComplete();
  }

  Future<void> deleteStudent(String id) async {
    _isLoading.value = true;
    await _studentRepository.deleteStudent(
        id: id,
        onSuccess: () {
          getAllStudents();
          IZIAlert().success(message: 'Delete student successfully');
        },
        onError: (error) {
          EasyLoading.dismiss();
          IZIAlert().error(message: error.toString());
        });
    _isLoading.value = false;
  }

  Future<void> getAllSubject() async {
    _isLoading.value = true;
    await _studentRepository.getAllSubject(
      onSuccess: (data) {
        listSubject.assignAll(data);
      },
      onError: (_) {},
    );
    _isLoading.value = false;
  }

  Future<void> deleteStudentSubject(String id) async {
    _isLoading.value = true;
    await _studentRepository.deleteStudentSubject(
        id: id,
        onSuccess: () {
          getAllSubject();
          IZIAlert().success(message: 'Delete student successfully');
        },
        onError: (error) {
          EasyLoading.dismiss();
          IZIAlert().error(message: error.toString());
        });
    _isLoading.value = false;
  }
}
