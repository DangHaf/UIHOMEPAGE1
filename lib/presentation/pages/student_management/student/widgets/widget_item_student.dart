import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:template/config/routes/route_path/app_route.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/core/utils/images_path.dart';
import 'package:template/data/model/student/student_model.dart';
import 'package:template/presentation/pages/student_management/student/student_management_controller.dart';
import 'package:template/presentation/pages/student_management/student/widgets/dialog_delete_student.dart';

class WidgetItemStudent extends StatelessWidget {
  final StudentModel? student;

  const WidgetItemStudent({Key? key, this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, bottom: 15.h),
              child: Container(
                width: Get.width,
                height: 50.h,
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_F3F4F6,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 180.w,
                          child: Text(
                            student?.fullName ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: AppText.text14.copyWith(
                              color: ColorResources.COLOR_002184,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 50.w,
                              child: Text(
                                student?.classInfo ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: AppText.text14.copyWith(
                                  color: ColorResources.COLOR_002184,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            SizedBox(
                              width: 140.w,
                              child: Text(
                                "- ${student?.contactInfo?.email}",
                                overflow: TextOverflow.ellipsis,
                                style: AppText.text14.copyWith(
                                  color: ColorResources.COLOR_002184,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.EDIT_STUDENT, arguments: student);
                      },
                      child: Container(
                          width: 30.w,
                          height: 30.h,
                          color: Colors.transparent,
                          child: Center(
                            child: SvgPicture.asset(ImagesPath.icEdit),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(
                          WidgetDeleteStudent(
                            onConfirm: () {
                              final studentController =
                                  Get.find<StudentManagementController>();
                              studentController
                                  .deleteStudent(student?.id ?? '');
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 30.w,
                        height: 30.h,
                        color: Colors.transparent,
                        child: Center(
                          child: SvgPicture.asset(ImagesPath.icDelete),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 11.h),
          child: Container(
            width: 26.w,
            height: 23.h,
            decoration: BoxDecoration(
              color: ColorResources.COLOR_002184,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                student?.averageScore.toString() ?? '',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: AppText.text11.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
