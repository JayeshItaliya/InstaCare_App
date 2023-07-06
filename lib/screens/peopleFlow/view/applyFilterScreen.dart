import 'package:flutter/material.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:get/get.dart';
import 'package:instacare/screens/peopleFlow/controller/controller.dart';
class ApplyFilterPeopleScreen extends StatefulWidget {
  const ApplyFilterPeopleScreen({super.key});

  @override
  State<ApplyFilterPeopleScreen> createState() => _ApplyFilterPeopleScreenState();
}

class _ApplyFilterPeopleScreenState extends State<ApplyFilterPeopleScreen> {
  final peopleController=Get.put(PeopleControllerFilter());
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leadingWidth: Reponsive_.crosslength*0.30,
        leading: Padding(
          padding:   EdgeInsets.only(left:Reponsive_.crosslength*0.01,top:Reponsive_.crosslength*0.01),
          child: MontserratText(
            text: "  Apply Filter",
            fontWeight: FontWeight.w700,
            fontSize: Reponsive_.px30,
            color: AppColors.black,
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
            color: AppColors.backGroundColor,
            hint: "Select"
          ),
          SizedBox(
            height: 10,
          ),
          CommonDropDown(
              context: context,
              list: peopleController.status,
              mycontrollerValue: peopleController.statusValue,
              color: AppColors.backGroundColor,
              hint: "Select"
          ),
          SizedBox(
            height: 10,
          ),
          CommonDropDown(
              context: context,
              list: peopleController.rating,
              mycontrollerValue: peopleController.ratingValue,
              color: AppColors.backGroundColor,
              hint: "Select"
          ),
          SizedBox(
            height: 10,
          ),
          CommonDropDown(
              context: context,
              list: peopleController.points,
              mycontrollerValue: peopleController.pointsValue,
              color: AppColors.backGroundColor,
              hint: "Select"
          ),
          SizedBox(
            height: 10,
          ),
          CommonDropDown(
              context: context,
              list: peopleController.lastActive,
              mycontrollerValue: peopleController.activeValue,
              color: AppColors.backGroundColor,
              hint: "Select"
          ),
        ],
      ),
      bottomSheet: Container(
        margin: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.02,vertical: Reponsive_.crosslength*0.02),
        height: Reponsive_.crosslength*0.06,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: CommonButton(
               text: "APPLY",
                onTap: (){},
              ),
            ),
            SizedBox(width: 8,),
            Expanded(
              flex: 1,
              child: CommonButton(
                text: "RESET",
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
