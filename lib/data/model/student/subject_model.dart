class SubjectModel {
  final String id;
  final String? registrationStatus;
  final int? creditHours;
  final String? semester;
  final List<String>? registeredCourses;
  final String? classInfo;
  final String? fullName;
  final String? studentId;
  final DateTime createdAt;
  final DateTime updatedAt;

  SubjectModel({
    required this.id,
    this.registrationStatus,
    this.creditHours,
    this.semester,
    this.registeredCourses,
    this.classInfo,
    this.fullName,
    this.studentId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String await = 'AWAITING';
  final String confirm = 'CONFIRMED';
  final String declined = 'DECLINED';


  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['_id'] as String,
      registrationStatus: json['registrationStatus'] as String?,
      creditHours: json['creditHours'] as int?,
      semester: json['semester'] as String?,
      registeredCourses: (json['registeredCourses'] != null)
          ? List<String>.from(json['registeredCourses'] as List<dynamic>)
          : null,
      classInfo: json['class'] as String?,
      fullName: json['fullName'] as String?,
      studentId: json['studentId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}
