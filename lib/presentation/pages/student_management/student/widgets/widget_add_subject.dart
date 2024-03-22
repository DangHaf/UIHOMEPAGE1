import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_button_confirm.dart';

class WidgetAddSubject extends StatefulWidget {
  final List<String> initData;
  final void Function(List<String>) saveListSubject;

  const WidgetAddSubject(
      {super.key, required this.saveListSubject, this.initData = const []});

  @override
  State<WidgetAddSubject> createState() => _WidgetAddSubjectState();
}

class _WidgetAddSubjectState extends State<WidgetAddSubject> {
  List<String> listSubjects = [
    'history',
    'programming_techniques',
    'calculus_2',
    'linear_algebra',
    'general_physics'
  ];
  List<String> listSelected = [];

  void onSelected(bool selected, String dataName) {
    setState(() {
      if (selected == true) {
        listSelected.add(dataName);
      } else {
        listSelected.remove(dataName);
      }
    });
  }

  @override
  void initState() {
    if (widget.initData.isNotEmpty) {
      listSelected.addAll(widget.initData);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 400.h),
      child: Container(
        height: 250.h,
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
                'choose_subject'.tr,
                style: AppText.text16.copyWith(
                  color: ColorResources.COLOR_002184,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.h),
              buildListItemSubject(),
              SizedBox(height: 20.h),
              WidgetButtonConfirm(
                callBack: () {
                  widget.saveListSubject(listSelected);
                },
                width: 63,
                textColor: ColorResources.COLOR_002184,
                backgroundSave: ColorResources.COLOR_FFD566,
                backgroundCancel: Colors.white,
                padding: 4,
                borderRadius: 12,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListItemSubject() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            childAspectRatio: 5,
            crossAxisSpacing: 5),
        itemCount: listSubjects.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            title: Text(
              listSubjects[index].tr,
              style: AppText.text12.copyWith(
                color: ColorResources.COLOR_EDAC02,
                fontWeight: FontWeight.w600,
              ),
            ),
            checkColor: ColorResources.COLOR_EDAC02,
            activeColor: ColorResources.COLOR_EDAC02,
            controlAffinity: ListTileControlAffinity.leading,
            tileColor: ColorResources.COLOR_EDAC02,
            value: listSelected.contains(listSubjects[index]),
            onChanged: (value) {
              setState(() {
                if (listSelected.contains(listSubjects[index])) {
                  listSelected.remove(listSubjects[index]);
                } else {
                  listSelected.add(listSubjects[index]);
                }
              });
            },
          );
        },
      ),
    );
  }
}
