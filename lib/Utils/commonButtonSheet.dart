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
     backgroundColor: AppColors.backGroundColor,
     isDismissible: true,
     isScrollControlled: true,
     enableDrag: true,
     StatefulBuilder(builder: (BuildContext context, StateSetter setState ) {
       return ListView(
         shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    width: 100,
                    height: 5,
                    color: AppColors.yallow,
                  ),
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
            childView
          ],
       );
     }));
}