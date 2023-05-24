import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appColor.dart';

CommonBottonSheet({required Widget childView}){
 return Get.bottomSheet(
     shape: const RoundedRectangleBorder(
       borderRadius: BorderRadius.only(
         topLeft: Radius.circular(30),
         topRight: Radius.circular(30),
       ),
     ),
     backgroundColor: Colors.white,
     isDismissible: true,
     isScrollControlled: true,
     enableDrag: true,
     StatefulBuilder(builder: (BuildContext
     context,
         StateSetter
         setState /*You can rename this!*/) {
       return ListView(
         shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 3,
                  color: AppColors.yallow,
                )
              ],
            ),
            childView
          ],
       );
     }));
}