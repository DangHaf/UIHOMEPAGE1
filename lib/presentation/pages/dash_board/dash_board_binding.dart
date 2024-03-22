import 'package:get/get.dart';
import 'package:template/presentation/pages/account/account_controller.dart';
import 'package:template/presentation/pages/cart/cart_controller.dart';
import 'package:template/presentation/pages/dash_board/dash_board_controller.dart';
import 'package:template/presentation/pages/favorite/favorite_controller.dart';
import 'package:template/presentation/pages/home/home_controller.dart';
import 'package:template/presentation/pages/message/message_controller.dart';
import 'package:template/presentation/pages/student_management/student/student_management_controller.dart';
import 'package:template/presentation/pages/ui_home_page/ui_home_page1/home_page1_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashBoardController>(DashBoardController());
    Get.put<HomeController>(HomeController());
    Get.put<FavoriteController>(FavoriteController());
    Get.put<MessageController>(MessageController());
    Get.put<CartController>(CartController());
    Get.put<AccountController>(AccountController());
    Get.put<StudentManagementController>(StudentManagementController());
    Get.put<HomePage1Controller>(HomePage1Controller());

  }
}
