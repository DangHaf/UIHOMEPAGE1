import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:template/core/helper/app_text.dart';
import 'package:template/core/utils/color_resources.dart';

class WidgetTextInput extends StatelessWidget {
  final String tittle;
  final double? width;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const WidgetTextInput(
      {super.key,
      required this.tittle,
      this.width,
      required this.textEditingController,
      required this.keyboardType,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tittle.tr,
            style: AppText.text16.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: width ?? Get.width,
            height: 39,
            decoration: BoxDecoration(
              color: ColorResources.COLOR_F3F4F6,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              controller: textEditingController,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 16,
                ),
                hintStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
