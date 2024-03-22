class AddStudentSubjectRequest {
  final String fullName;
  final String className;
  final List<String> registeredCourses;
  final String semester;
  final int creditHours;
  final String registrationStatus;

  AddStudentSubjectRequest({
    required this.fullName,
    required this.className,
    required this.registeredCourses,
    required this.semester,
    required this.creditHours,
    required this.registrationStatus
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'class': className,
      'registeredCourses': registeredCourses,
      'semester' : semester,
      'creditHours' : creditHours,
      'registrationStatus' : registrationStatus,
    };
  }
}
