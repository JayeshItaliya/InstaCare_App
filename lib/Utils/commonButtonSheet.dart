import 'package:flutter/material.dart';
import 'package:instacare/Utils/appColor.dart';


CommonBottonSheet({required Widget childView,required BuildContext context,bool? topIcon=true,Color? backGroundColor}){
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    backgroundColor:backGroundColor?? AppColors.white,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          setState(() {});
          return Padding(
            padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
               topIcon==true?Row(
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
                ):Container(),
                childView
              ],
            ),
          );
        },
      );
    },
  );
}