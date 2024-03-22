import 'package:get/get.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/core/utils/images_path.dart';
import 'package:template/data/model/home_page_1/item_category_model.dart';


class HomePage1Controller extends GetxController {
  final RxInt _currentTab = 0.obs;
  int get currentTab => _currentTab.value;

  void onChangeCurrentTab(int index) {
    if (index == currentTab) {
      return;
    }
    _currentTab.value = index;
  }

  // fake data
  final List<CategoryItem> categories = [
    CategoryItem(
        ImagesPath.imgNails, 'Đặt lịch Nails', ColorResources.COLOR_FF86CF),
    CategoryItem(
        ImagesPath.imgSpa, 'Đặt lịch Spa', ColorResources.COLOR_FE879A),
    CategoryItem(
        ImagesPath.imgSalon, 'Đặt lịch Salon', ColorResources.COLOR_FFAA8F),
    CategoryItem(ImagesPath.imgStore, 'Cửa hàng thân thiết',
        ColorResources.COLOR_ECAC92),
    CategoryItem(ImagesPath.imgSupport, 'Hỗ trợ khách hàng',
        ColorResources.COLOR_FFD18D),
    CategoryItem(ImagesPath.imgGame, 'Mini game', ColorResources.COLOR_ED7EFF),
  ];

  final List<StoreItem> listStoreAll = [
    StoreItem(
        name: 'Tiệm Nails A Tiệm Nails A',
        address:
            '111 Châu Thị Vĩnh Tế,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng 111 Châu Thị Vĩnh Tế,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng ',
        numberStar: 1,
        numberReviews: 10),
    StoreItem(
        name: 'Tiệm Salon B',
        address: '222 Hoang Dieu,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng',
        numberStar: 2,
        numberReviews: 20),
    StoreItem(
        name: 'Spa mẹ và bé C',
        address: '333 Châu Thị Vĩnh Tế,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng',
        numberStar: 3,
        numberReviews: 30),
    StoreItem(
        name: 'Tiệm Nails A Tiệm Nails A',
        address: '111 Châu Thị Vĩnh Tế,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng ',
        numberStar: 1,
        numberReviews: 10),
    StoreItem(
        name: 'Tiệm Salon B',
        address: '222 Hoang Dieu,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng',
        numberStar: 2,
        numberReviews: 20),
    StoreItem(
        name: 'Spa mẹ và bé C',
        address: '333 Châu Thị Vĩnh Tế,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng',
        numberStar: 3,
        numberReviews: 30),
  ];

  final List<StoreItem> listStoreSpaMessage = [
    StoreItem(
        name: 'Tiệm Nails A',
        address: '111 Châu Thị Vĩnh Tế,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng',
        numberStar: 1,
        numberReviews: 10),
    StoreItem(
        name: 'Tiệm Nails B',
        address: '222 Châu Thị Vĩnh Tế,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng',
        numberStar: 2,
        numberReviews: 20),
    StoreItem(
        name: 'Tiệm Nails C',
        address: '333 Châu Thị Vĩnh Tế,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng',
        numberStar: 3,
        numberReviews: 30),
  ];

  final List<StoreItem> listStoreNailsSalon = [
    StoreItem(
        name: 'Spa mẹ và bé A',
        address: '111 Châu Thị Vĩnh Tế,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng',
        numberStar: 1,
        numberReviews: 10),
    StoreItem(
        name: 'Spa mẹ và bé B',
        address: '222 Châu Thị Vĩnh Tế,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng',
        numberStar: 2,
        numberReviews: 20),
    StoreItem(
        name: 'Spa mẹ và bé C',
        address: '333 Châu Thị Vĩnh Tế,Ngũ Hành Sơn,Mỹ An,TP Đà Nẵng',
        numberStar: 3,
        numberReviews: 30),
  ];
}
