import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:template/config/routes/route_path/app_route.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/core/utils/images_path.dart';
import 'package:template/presentation/pages/student_management/student/student_management_controller.dart';
import 'package:template/presentation/pages/student_management/subject/widgets/widget_item_subject.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_header.dart';
import 'package:template/presentation/pages/student_management/student/widgets/widget_item_student.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_loading.dart';
import 'package:template/presentation/pages/student_management/widgets/widget_search.dart';

class StudentManagementPage extends GetView<StudentManagementController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 10.w, right: 20.w),
              child: Column(
                children: [
                  const Stack(
                    children: [
                      WidgetSearch(),
                      WidgetHeader(),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  buildListTab(),
                  SizedBox(height: 10.h),
                  buildTittleTab(context),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            Expanded(child: Obx(() => buildBody())),
          ],
        ),
        Obx(
          () => Visibility(
            visible: controller.isLoading,
            child: const WidgetLoading(),
          ),
        ),
      ],
    );
  }

  Widget buildListTab() {
    return Obx(() => Row(
          children: List.generate(
            controller.tabList.length,
            (index) => GestureDetector(
              onTap: () {
                controller.selectTab(index);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: controller.selectedIndex.value == index
                        ? ColorResources.COLOR_002184
                        : ColorResources.COLOR_F3F4F6,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    controller.tabList[index],
                    style: AppText.text12.copyWith(
                      color: controller.selectedIndex.value == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget buildBody() {
    return IndexedStack(
      index: controller.selectedIndex.value,
      children: [
        buildListStudent(),
        buildListSubject(),
        const SizedBox(),
        const SizedBox(),
      ],
    );
  }

  Widget buildListStudent() {
    return controller.listStudents.isEmpty
        ? Center(
            child: Text(
              'empty_data'.tr,
              style: AppText.text14.copyWith(
                color: ColorResources.COLOR_677275,
              ),
            ),
          )
        : SmartRefresher(
            controller: controller.refreshControllerStudent,
            onRefresh: () => controller.initDataStudent(isRefresh: true),
            child: ListView.builder(
              itemCount: controller.listStudents.length,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemBuilder: (context, index) {
                return WidgetItemStudent(
                  student: controller.listStudents[index],
                );
              },
            ),
          );
  }

  Widget buildListSubject() {
    return controller.listStudents.isEmpty
        ? Center(
            child: Text(
              'empty_data'.tr,
              style: AppText.text14.copyWith(
                color: ColorResources.COLOR_677275,
              ),
            ),
          )
        : SmartRefresher(
            controller: controller.refreshControllerSubject,
            onRefresh: () => controller.initDataSubject(isRefresh: true),
            child: ListView.builder(
              itemCount: controller.listSubject.length,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemBuilder: (context, index) {
                return WidgetItemSubject(
                  subjectModel: controller.listSubject[index],
                );
              },
            ),
          );
  }

  Widget buildTittleTab(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10.w,
        ),
        Text(
          "list_student".tr,
          style: AppText.text16.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        GestureDetector(
          onTap: () {
            switch (controller.selectedIndex.value) {
              case 0:
                Get.toNamed(AppRoute.ADD_STUDENT);
              case 1:
                Get.toNamed(AppRoute.ADD_SUBJECT_STUDENT);
              case 2:
                Get.toNamed(AppRoute.ADD_STUDENT);
              case 3:
                Get.toNamed(AppRoute.ADD_STUDENT);
            }
          },
          child: Container(
            width: 30.w,
            color: Colors.transparent,
            child: SvgPicture.asset(ImagesPath.icAdd),
          ),
        ),
        const Spacer(),
        Text(
          'view_all'.tr,
          style: AppText.text10.copyWith(
            color: ColorResources.COLOR_EDAC02,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        SvgPicture.asset(ImagesPath.icArroundDown),
      ],
    );
  }
}
