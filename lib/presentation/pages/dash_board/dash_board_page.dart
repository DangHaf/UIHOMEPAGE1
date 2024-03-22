import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/base_widget/izi_lazy_index_stack.dart';
import 'package:template/core/export/core_export.dart';
import 'package:template/presentation/pages/dash_board/dash_board_controller.dart';
import 'package:template/presentation/pages/dash_board/default_page.dart';
import 'package:template/presentation/pages/student_management/student/student_management_page.dart';
import 'package:template/presentation/pages/ui_home_page/ui_home_page1/home_page1_page.dart';

class DashBoardPage extends GetView<DashBoardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        return LazyIndexedStack(
            index: controller.currentIndex.value,
            children:  [
              const DefaultPage(),
              StudentManagementPage(),
              HomePage1(),
              const DefaultPage(),

            ]);
      }),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          color: ColorResources.COLOR_002184,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: _buildBottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            controller.onChangeDashboardPage(index: 0);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImagesPath.icHomeNavi,
                color: controller.currentIndex.value == 0
                    ? ColorResources.COLOR_EDAC02
                    : Colors.white,
                width: 28.r,
                height: 28.r,
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            controller.onChangeDashboardPage(index: 1);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImagesPath.icStudentManagement,
                color: controller.currentIndex.value == 1
                    ? ColorResources.COLOR_EDAC02
                    : Colors.white,
                width: 28.r,
                height: 28.r,
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            controller.onChangeDashboardPage(index: 2);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImagesPath.icSetting,
                color: controller.currentIndex.value == 2
                    ? ColorResources.COLOR_EDAC02
                    : Colors.white,
                width: 28.r,
                height: 28.r,
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            controller.onChangeDashboardPage(index: 3);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImagesPath.icAccount,
                color: controller.currentIndex.value == 3
                    ? ColorResources.COLOR_EDAC02
                    : Colors.white,
                width: 28.r,
                height: 28.r,
              ),
              const SizedBox(height: 6),

            ],
          ),
        ),
        // InkWell(
        //   onTap: () {
        //     controller.onChangeDashboardPage(index: 4);
        //   },
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Image.asset(
        //         ImagesPath.icAccount,
        //         color: controller.currentIndex.value == 4
        //             ? ColorResources.COLOR_EDAC02
        //             : Colors.white,
        //         width: 28.r,
        //         height: 28.r,
        //       ),
        //       const SizedBox(height: 6),
        //     ],
        //   ),
        // ),

      ],
    );
  }
}
