import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';


Widget CommonDropDown({required BuildContext context, required List<String> list, required RxString mycontrollerValue,Color? color}) {
  final cx=Get.put(CommonController());
  return Obx(() =>
      DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint:   Row(
            children: [
              Expanded(
                child: InterText(
                    text: mycontrollerValue.value,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          items:list
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style:   TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          //value:createReminderController.selectedValue.value,
          onChanged: (value) {
            mycontrollerValue.value = value as String;
          },
          buttonStyleData: ButtonStyleData(
            width: cx.width,
            height: cx.height/10,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:color??AppColors.white,
            ),
            elevation: 0,
          ),
          iconStyleData:   IconStyleData(
            icon: Image.asset(AppAssets.dropDown),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.white,
            ),
            elevation: 0,

            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all<double>(6),
              thumbVisibility: MaterialStateProperty.all<bool>(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      )
  );
}
