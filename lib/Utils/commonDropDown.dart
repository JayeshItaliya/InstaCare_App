import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/screens/profileFlow/profileController.dart';

commonDropDown (BuildContext context,List<String> list){
 final myController=Get.put(ProfileController());
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height/10,
    decoration: BoxDecoration(
        color: AppColors.backGroundColor,
        borderRadius: BorderRadius.circular(30)
    ),
    padding: EdgeInsets.only(left: 13,right: 13),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InterText(
          text: myController.countryController.value,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              borderRadius:BorderRadius.circular(12),
              icon: Image.asset(AppAssets.dropDown),
              //value: exchangeValue2,
              onChanged: (String? newValue ) {
                myController.countryController.value=newValue!;
                print("tapValue==>${myController.countryController.value}");
              },
              items: list.map((String map) {
                return  DropdownMenuItem<String>(
                  value: map,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            map.toString(),
                            textAlign: TextAlign.right,
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