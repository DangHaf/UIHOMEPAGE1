import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_button_confirm.dart';

class WidgetAddOneSubject extends StatefulWidget {
  final void Function(String) addSubject;
  const WidgetAddOneSubject({super.key, required this.addSubject});

  @override
  State<WidgetAddOneSubject> createState() => _WidgetAddOneSubjectState();
}

class _WidgetAddOneSubjectState extends State<WidgetAddOneSubject> {
  TextEditingController addSubjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 420.h),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                'add_more_subject'.tr,
                style: AppText.text16.copyWith(
                  color: ColorResources.COLOR_002184,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'Subject',
                style: AppText.text16.copyWith(
                  color: ColorResources.COLOR_EDAC02,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              buildTextInput(),
              SizedBox(height: 40.h),
              WidgetButtonConfirm(
                callBack: () {
                  widget.addSubject(addSubjectController.text);
                },
                width: 63,
                textColor: ColorResources.COLOR_002184,
                backgroundSave: ColorResources.COLOR_FFD566,
                backgroundCancel: Colors.white,
                padding: 4,
                borderRadius: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextInput() {
    return Container(
      width: Get.width,
      height: 39.h,
      decoration: BoxDecoration(
        color: ColorResources.COLOR_F3F4F6,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: addSubjectController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 16.h,
          ),
          hintText: 'hint_name_subject'.tr,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
