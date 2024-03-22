import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/core/utils/images_path.dart';
import 'package:template/presentation/pages/student_management/student/edit_student/edit_student_controller.dart';
import 'package:template/presentation/pages/student_management/student/widgets/widget_add_subject.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_button_confirm.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_header.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_search.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_text_input.dart';

class EditStudentPage extends GetView<EditStudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 40.h, left: 8.w, right: 22.w, bottom: 20.h),
              child: const Stack(
                children: [
                  WidgetSearch(),
                  WidgetHeader(),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: ColorResources.COLOR_002184,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'edit_student'.tr,
                      style: AppText.text22.copyWith(
                        color: ColorResources.COLOR_96C0FF,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.h),
                        buildAllInputText(),
                        SizedBox(height: 10.h),
                        buildListSubject(),
                        SizedBox(height: 10.h),
                        buildButtonAddSubject(context),
                        SizedBox(height: 10.h),
                        WidgetButtonConfirm(
                          callBack: () {
                            controller.updateStudent();
                          },
                          width: 76,
                          textColor: Colors.white,
                          padding: 8,
                          borderRadius: 20,
                          backgroundSave: ColorResources.COLOR_EDAC02,
                          backgroundCancel: ColorResources.COLOR_002184,
                        ),
                        SizedBox(height: 50.h),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAllInputText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetTextInput(
          tittle: 'full_name',
          textEditingController: controller.fullNameController,
          keyboardType: TextInputType.text,
        ),
        Row(
          children: [
            WidgetTextInput(
              tittle: 'class',
              width: 175.w,
              textEditingController: controller.classController,
              keyboardType: TextInputType.text,
            ),
            const Spacer(),
            WidgetTextInput(
              tittle: 'student_id',
              width: 131.w,
              textEditingController: controller.studentIdController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
        ),
        Row(
          children: [
            WidgetTextInput(
              tittle: 'email',
              width: 199.w,
              textEditingController: controller.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const Spacer(),
            WidgetTextInput(
              tittle: 'date_of_birth',
              width: 110.w,
              textEditingController: controller.dateController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
        ),
        Row(
          children: [
            WidgetTextInput(
              tittle: 'address',
              width: 191.w,
              textEditingController: controller.addressController,
              keyboardType: TextInputType.text,
            ),
            const Spacer(),
            WidgetTextInput(
              tittle: 'phone_number',
              width: 117.w,
              textEditingController: controller.phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
        ),
        WidgetTextInput(
          tittle: 'avarage_mark',
          textEditingController: controller.averageController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        SizedBox(height: 10.h),
        Text(
          'list_subject'.tr,
          style: AppText.text16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Obx(
          () => Visibility(
            visible: controller.listSelectedSubject.isEmpty,
            child: Text(
              'This student doesn’t have any classes yet. Click here to add new subject!',
              textAlign: TextAlign.left,
              style: AppText.text10.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.5,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildListSubject() {
    return Obx(() => Wrap(
          spacing: 8,
          runSpacing: 8,
          children: controller.listSelectedSubject.map((course) {
            return buildItemSubject(course);
          }).toList(),
        ));
  }

  Widget buildItemSubject(String nameSubject) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
        child: Text(
          nameSubject.tr,
          textAlign: TextAlign.center,
          style: AppText.text12.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget buildButtonAddSubject(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          isDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return FractionallySizedBox(
                heightFactor: 0.8,
                child: WidgetAddSubject(
                  saveListSubject: (saveSelectedSubjects) {
                    controller.saveSelectedSubjects(saveSelectedSubjects);
                  },
                  initData: controller.studentModel.registeredCourses ?? [],
                ));
          },
        );
      },
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        child: Center(
          child: Image.asset(
            ImagesPath.icPlus,
            width: 15.w,
            height: 15.h,
            color: ColorResources.COLOR_002184,
          ),
        ),
      ),
    );
  }
}
