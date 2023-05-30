import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/screens/profileFlow/profileController.dart';

commonDropDown(BuildContext context, List<String> list, RxString mycontroller) {
  final myController = Get.put(ProfileController());
  return Obx(() => Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
            color: AppColors.backGroundColor,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InterText(
              text: mycontroller.value,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              textOverflow: TextOverflow.ellipsis,
            ),
            PopupMenuButton<String>(
              itemBuilder: (context) {
                return list.map((str) {
                  return PopupMenuItem(
                    value: str,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Gap(10.w),
                        InterText(
                          text: str.toString(),
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  );
                }).toList();
              },
              icon: Image.asset(AppAssets.dropDown),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
              color: AppColors.blue,
              onSelected: (v) {
                print('!!!===== $v');
                mycontroller.value = v;
              },
            ),
          ],
        ),
      ));
}
