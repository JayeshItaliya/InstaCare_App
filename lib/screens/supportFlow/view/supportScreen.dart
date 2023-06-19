import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/supportFlow/controller/supportController.dart';
class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final supportController=Get.put(SupportController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body:ListView(
        padding: padding,
        children: [
          InterText(
            text: "Select Reason",
            fontSize: 16,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
          CommonDropDown(
              context: context,
              list: supportController.supportList,
              mycontrollerValue: supportController.supportValue,
            padding: EdgeInsets.zero
          ),
          SizedBox(
            height: 10,
          ),
          InterText(
            text: "Note",
            fontSize: 16,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
          AppWidget().getTextField(
            hintText: "",
            filledColor: AppColors.white,
            maxLine: 10
          ),
          SizedBox(
            height: 10,
          ),
          CommonButton(
            text: "Submit",
            onTap: (){
              CommonBottonSheet(
                context: context,
                  childView: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MontserratText(
                            text: "Shift Detail".toUpperCase(),
                            fontWeight: FontWeight.normal,
                            color: AppColors.blue,
                            fontSize: 15,
                          ),
                          SizedBox(height: 20,),
                          MontserratText(
                            text: "Confirmation".toUpperCase(),
                            fontWeight: FontWeight.bold,
                            color: AppColors.deepGreen,
                            fontSize: 30,
                          ),
                          SizedBox(height: 10,),
                          InterText(
                            text: "Great, would you like to post these shifts?",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.black,
                          ),
                          SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CommonButton(
                                    text: "Yes",
                                    onTap: (){
                                      onBack(context);
                                    },
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: CommonButton(
                                    text: "No",
                                    onTap: (){},
                                    color: AppColors.allGray,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
              );
            },
          )
        ],
      ),
    );
  }
}
