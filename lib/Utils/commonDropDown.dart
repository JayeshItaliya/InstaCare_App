import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/screens/profileFlow/profileController.dart';

commonDropDown (BuildContext context,List<String> list,RxString mycontroller){
 final myController=Get.put(ProfileController());
  return Container(
    alignment: Alignment.center,
    // width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height/10,
    decoration: BoxDecoration(
        color: AppColors.backGroundColor,
        borderRadius: BorderRadius.circular(30)
    ),
    padding: EdgeInsets.only(left: 15,right: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Container(
            height: 100.h,
            alignment: Alignment.center,
            child: InterText(
              text: mycontroller.value,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              borderRadius:BorderRadius.circular(12),
              icon: Image.asset(AppAssets.dropDown),
              //value: exchangeValue2,
              onChanged: (String? newValue ) {
                mycontroller.value=newValue!;
                print("tapValue==>${mycontroller.value}");
              },
              items: list.map((String map) {
                return  DropdownMenuItem<String>(
                  value: map,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 180.h,
                          child: Text(
                            map.toString(),
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    ),
  );
}