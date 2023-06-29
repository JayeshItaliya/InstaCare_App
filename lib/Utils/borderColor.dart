import 'package:flutter/material.dart';
import 'package:instacare/Utils/appColor.dart';

class BorderColorAll{
 static Color getBorderColor(position) {
    if(position=='Staff'){
      return AppColors.yallow;
    }else if(position=='Manager'){
      return AppColors.dark_purple;
    }else{
      return AppColors.dark_green;
    }
  }

 static  Color getBgColor(position) {
   if(position=='Staff'){
     return AppColors.light_yallow;
   }else if(position=='Manager'){
     return AppColors.light_purple;
   }else{
     return AppColors.light_green;
   }
 }
}