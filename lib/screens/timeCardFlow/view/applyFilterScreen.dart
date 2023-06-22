import 'package:flutter/material.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:get/get.dart';
import 'package:instacare/screens/timeCardFlow/controller/controller/applayController.dart';

class ApplyFilterTimeCardScreen extends StatefulWidget {
  const ApplyFilterTimeCardScreen({super.key});

  @override
  State<ApplyFilterTimeCardScreen> createState() => _ApplyFilterTimeCardScreenState();
}

class _ApplyFilterTimeCardScreenState extends State<ApplyFilterTimeCardScreen> {
  final peopleController=Get.put(TimeCardApplyController());
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leadingWidth: Reponsive_.crosslength*0.30,
        leading: Padding(
          padding:   EdgeInsets.only(left:Reponsive_.crosslength*0.01,top:Reponsive_.crosslength*0.01),
          child: MontserratText(
            text: "Apply Filter",
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: AppColors.blue,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                onBack(context);
              },
              icon: Icon(Icons.clear,color: AppColors.hintTextGrey,),
          )
        ],
      ),
      body: ListView(
        padding: padding,
        children: [
          CommonDropDown(
              context: context,
              list: peopleController.role,
              mycontrollerValue: peopleController.roleValue,
              color: AppColors.white,
          ),
          const SizedBox(
            height: 8,
          ),
          CommonDropDown(
              context: context,
              list: peopleController.status,
              mycontrollerValue: peopleController.statusValue,
            color: AppColors.white,
          ),
          const SizedBox(
            height: 8,
          ),
          CommonDropDown(
              context: context,
              list: peopleController.rating,
              mycontrollerValue: peopleController.ratingValue,
            color: AppColors.white,
          ),
          const SizedBox(
            height: 8,
          ),
          CommonDropDown(
              context: context,
              list: peopleController.points,
              mycontrollerValue: peopleController.pointsValue,
            color: AppColors.white,
          ),
          const SizedBox(
            height: 8,
          ),
          CommonDropDown(
              context: context,
              list: peopleController.lastActive,
              mycontrollerValue: peopleController.activeValue,
            color: AppColors.white,
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CommonButton(
               text: "Apply",
                onTap: (){},
              ),
            ),
            SizedBox(width: 8,),
            Expanded(
              child: CommonButton(
                text: "Reset",
                color: AppColors.allGray,
                onTap: (){},
              ),
            )
          ],
        ),
      ),
    );
  }
}
