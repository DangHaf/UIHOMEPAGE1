import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/core/utils/images_path.dart';
import 'package:template/presentation/pages/student_management/subject/widgets/widget_add_one_subject.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_button_confirm.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_header.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_search.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_text_input.dart';
import 'edit_subject_controller.dart';

class EditSubjectPage extends GetView<EditSubjectController> {
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
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'edit_subject'.tr,
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
                            controller.updateSubject();
                          },
                          width: 76,
                          textColor: Colors.white,
                          backgroundSave: ColorResources.COLOR_EDAC02,
                          backgroundCancel: ColorResources.COLOR_002184,
                          padding: 8,
                          borderRadius: 20,
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
              tittle: 'school_term',
              width: 175.w,
              textEditingController: controller.schoolTermController,
              keyboardType: TextInputType.text,
            ),
            const Spacer(),
            WidgetTextInput(
              tittle: 'quantity_credits',
              width: 110.w,
              textEditingController: controller.dateController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
        ),
        Text(
          'registering_status'.tr,
          style: AppText.text16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => DropdownButton(
                    value: controller.dropDownValue.value,
                    style: const TextStyle(color: Colors.black),
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    icon: Padding(
                      padding: EdgeInsets.only(left: 200.w),
                      child: const Icon(Icons.keyboard_arrow_down),
                    ),
                    items: controller.items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      controller.dropDownValue.value = newValue!;
                    },
                  ),
                ),
              ],
            )),
        SizedBox(height: 10.h),
        Text(
          'list_registed_subjects'.tr,
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
              child: WidgetAddOneSubject(
                addSubject: (nameSubject) {
                  controller.addSelectedSubjects(nameSubject);
                },
              ),
            );
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
