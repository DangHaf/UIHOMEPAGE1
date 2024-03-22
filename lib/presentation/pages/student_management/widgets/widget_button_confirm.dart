import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:template/core/helper/izi_size_util.dart';
import 'package:template/core/utils/color_resources.dart';
import 'package:template/presentation/widgets/custom_button.dart';

class WidgetButtonConfirm extends StatelessWidget {
  final Function() callBack;
  final int width;
  final Color textColor;
  final Color backgroundSave;
  final Color backgroundCancel;
  final double padding;
  final double borderRadius;

  const WidgetButtonConfirm(
      {super.key,
      required this.callBack,
      required this.width,
      required this.textColor,
      required this.backgroundSave,
      required this.padding,
      required this.borderRadius,
      required this.backgroundCancel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
          label: 'save'.tr,
          width: width.w,
          backgroundColor: backgroundSave,
          style: TextStyle(
              color: ColorResources.COLOR_002184,
              fontWeight: FontWeight.w700,
              fontSize: IZISizeUtil.BODY_LARGE_FONT_SIZE),
          paddingHorizontal: padding,
          paddingVertical: padding,
          borderRadius: borderRadius,
          callBack: () {
            callBack();
            Get.back();
          },
        ),
        SizedBox(width: 20.w),
        CustomButton(
          label: 'cancel'.tr,
          width: width.w,
          backgroundColor: backgroundCancel,
          colorBorder: Colors.white,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: IZISizeUtil.BODY_LARGE_FONT_SIZE),
          paddingHorizontal: padding,
          paddingVertical: padding,
          borderRadius: borderRadius,
          callBack: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
