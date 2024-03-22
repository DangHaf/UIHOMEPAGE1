import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/core/utils/images_path.dart';
import 'package:template/data/model/home_page_1/item_category_model.dart';
import 'home_page1_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage1 extends GetView<HomePage1Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_F6F6F7,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              buildHeader(),
              SizedBox(height: 15.h),
              buildSearch(),
              SizedBox(height: 15.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Image.asset(
                    ImagesPath.imgBannerSpa,
                    width: Get.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              buildCategory(),
              SizedBox(height: 15.h),
              buildBeautyGuide(),
              SizedBox(height: 15.h),
              buildListService(),
              SizedBox(height: 15.h),
              buildNearbyStore(),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(ImagesPath.imgAvatarUser),
          radius: 25,
        ),
        SizedBox(width: 10.w),
        Text(
          'Xin chào, Đăng Hà',
          style: AppText.text14.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Stack(
          children: [
            Container(
              width: 40.w,
              decoration: BoxDecoration(
                  color: ColorResources.COLOR_E6E6E6,
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(ImagesPath.imgBell),
            ),
            Positioned(
              top: 5.h,
              right: 8.w,
              child: Container(
                width: 15.w,
                decoration: BoxDecoration(
                    color: ColorResources.COLOR_FF1B1A,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  '2',
                  textAlign: TextAlign.center,
                  style: AppText.text10.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildSearch() {
    return SizedBox(
      height: 40.h,
      child: Row(
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Tìm theo tên cửa hàng , dịch vụ',
                        hintStyle: AppText.text12.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(bottom: 12.h, left: 16.w),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Container(
            width: 50.w,
            decoration: BoxDecoration(
              color: ColorResources.COLOR_DC4B64,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Image.asset(
                ImagesPath.icSearch,
                color: Colors.white,
                width: 20.w,
                // height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Danh mục',
          style: AppText.text16.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.white,
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
            ),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return buildItemCategory(controller.categories[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget buildItemCategory(CategoryItem category) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: category.backgroundColor,
            ),
            child: Center(
              child: Image.asset(
                category.imagePath,
                width: 30.w,
                color: Colors.white,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          category.description,
          textAlign: TextAlign.center,
          style: AppText.text11.copyWith(
            color: Colors.black87,
            letterSpacing: -0.7,
          ),
        ),
      ],
    );
  }

  Widget buildBeautyGuide() {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cẩm nang làm đẹp',
            style: AppText.text16.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 140.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: buildItemBeautyGuide(),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget buildItemBeautyGuide() {
    return Container(
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 4.h, left: 4.w, right: 4.w),
        child: Column(
          children: [
            Container(
              height: 85.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  ImagesPath.imgBannerSpa,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              'Cách chăm sóc da mặt cho da dầu',
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppText.text12.copyWith(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListService() {
    return Row(
      children: [
        buildItemService('Tất cả dịch vụ', 0),
        const SizedBox(width: 10),
        buildItemService('Spa/Massage', 1),
        const SizedBox(width: 10),
        buildItemService('Nail Salon', 2),
      ],
    );
  }

  Widget buildItemService(String tittle, int index) {
    return GestureDetector(
        onTap: () {
          controller.onChangeCurrentTab(index);
        },
        child: Obx(
          () => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: controller.currentTab == index
                  ? Colors.white
                  : ColorResources.COLOR_FBE4E8,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                tittle.tr,
                textAlign: TextAlign.center,
                style: AppText.text12.copyWith(
                  color: ColorResources.COLOR_E57585,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ));
  }

  Widget buildNearbyStore() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Cửa hàng gần đây',
              style: AppText.text16.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              'Xem tất cả >',
              textAlign: TextAlign.center,
              style: AppText.text12.copyWith(
                color: ColorResources.COLOR_E57585,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Obx(() => IndexedStack(
              index: controller.currentTab,
              children: [
                buildListAll(),
                buildListMassage(),
                buildListNails(),
              ],
            ))
      ],
    );
  }

  Widget buildListAll() {
    return ListView.builder(
      itemCount: controller.listStoreAll.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return buildItemStore(controller.listStoreAll[index]);
      },
    );
  }

  Widget buildListMassage() {
    return ListView.builder(
      itemCount: controller.listStoreSpaMessage.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return buildItemStore(controller.listStoreSpaMessage[index]);
      },
    );
  }

  Widget buildListNails() {
    return ListView.builder(
      itemCount: controller.listStoreNailsSalon.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return buildItemStore(controller.listStoreNailsSalon[index]);
      },
    );
  }

  Widget buildItemStore(StoreItem storeItem) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Container(
        height: 90.h,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  ImagesPath.imgBannerSpa,
                  width: 80.w,
                  height: Get.height,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 170.w,
                      child: Text(
                        storeItem.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.text12.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          ImagesPath.imgLocation,
                          color: ColorResources.COLOR_FF1B1A,
                          height: 16.h,
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(width: 5.w),
                        SizedBox(
                          width: 170.w,
                          child: Text(
                            storeItem.address,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppText.text11.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          ImagesPath.imgStar,
                          height: 16,
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          storeItem.numberStar.toString(),
                          textAlign: TextAlign.center,
                          style: AppText.text11.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '(${storeItem.numberReviews.toString().tr} đánh giá)',
                          textAlign: TextAlign.center,
                          style: AppText.text11.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
