class StudentModel {
  final String id;
  final ContactInfo? contactInfo;
  final List<String>? registeredCourses;
  final double? averageScore;
  final int? dateOfBirth;
  final String? classInfo;
  final String? fullName;

  StudentModel({
    required this.id,
    this.contactInfo,
    this.registeredCourses,
    this.averageScore,
    this.dateOfBirth,
    this.classInfo,
    this.fullName,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['_id'] as String,
      contactInfo: json['contactInfo'] != null ? ContactInfo.fromJson(json['contactInfo'] as Map<String, dynamic>) : null,
      registeredCourses: json['registeredCourses'] != null ? List<String>.from(json['registeredCourses'] as List<dynamic>) : null,
      averageScore: json['averageScore'] != null ? (json['averageScore'] as num).toDouble() : null,
      dateOfBirth: json['dateOfBirth'] as int?,
      classInfo: json['class'] as String?,
      fullName: json['fullName'] as String?,
    );
  }
}


class ContactInfo {
  final String? address;
  final String? email;
  final String? phoneNumber;
  final String id;

  ContactInfo({
     this.address,
     this.email,
     this.phoneNumber,
    required this.id,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      address: json['address'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      id: json['_id'] as String,
    );
  }
}
