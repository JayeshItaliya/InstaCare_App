import 'package:flutter/material.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonController.dart';
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
  final cx=Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: Reponsive_.crosslength*0.30,
        leading: Padding(
          padding:   EdgeInsets.only(left:Reponsive_.crosslength*0.01,top:Reponsive_.crosslength*0.01),
          child: MontserratText(
            text: "Apply Filter",
            fontWeight: FontWeight.w700,
            fontSize: Reponsive_.px30,
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: padding,
              children: [
               cx.instacareLoginValue.toString().contains("instacare")?
                   Column(
                     children: [
                       CommonDropDown(
                         context: context,
                         hint: 'Select Facility',
                         list: peopleController.role,
                         mycontrollerValue: peopleController.roleValue,
                         color: AppColors.white,
                       ),
                       SizedBox(
                         height: Reponsive_.crosslength*0.01,
                       ),
                       CommonDropDown(
                         context: context,
                         hint: 'Select Employee',
                         list: peopleController.status,
                         mycontrollerValue: peopleController.statusValue,
                         color: AppColors.white,
                       ),
                       SizedBox(
                         height: Reponsive_.crosslength*0.01,
                       ),
                       CommonDropDown(
                         context: context,
                         hint: 'Select Role',
                         list: peopleController.rating,
                         mycontrollerValue: peopleController.ratingValue,
                         color: AppColors.white,
                       ),
                       SizedBox(
                         height: Reponsive_.crosslength*0.01,
                       ),
                       CommonDropDown(
                         context: context,
                         hint: 'Select Status',
                         list: peopleController.points,
                         mycontrollerValue: peopleController.pointsValue,
                         color: AppColors.white,
                       ),
                       SizedBox(
                         height: Reponsive_.crosslength*0.01,
                       ),
                     ],
                   ):cx.instacareLoginValue.toString().contains("faculty")?
               Column(
                 children: [
                   CommonDropDown(
                     context: context,
                     hint: 'Select Employee',
                     list: peopleController.status,
                     mycontrollerValue: peopleController.statusValue,
                     color: AppColors.white,
                   ),
                   SizedBox(
                     height: Reponsive_.crosslength*0.01,
                   ),
                   CommonDropDown(
                     context: context,
                     hint: 'Select Role',
                     list: peopleController.rating,
                     mycontrollerValue: peopleController.ratingValue,
                     color: AppColors.white,
                   ),
                   SizedBox(
                     height: Reponsive_.crosslength*0.01,
                   ),
                   CommonDropDown(
                     context: context,
                     hint: 'Select Status',
                     list: peopleController.points,
                     mycontrollerValue: peopleController.pointsValue,
                     color: AppColors.white,
                   ),
                   SizedBox(
                     height: Reponsive_.crosslength*0.01,
                   ),
                 ],
               ):cx.instacareLoginValue.toString().contains("employee")?
                   Column(
                     children: [
                       Column(
                         children: [
                           CommonDropDown (
                             context: context,
                             hint: 'Select Facility',
                             list: peopleController.role,
                             mycontrollerValue: peopleController.roleValue,
                             color: AppColors.white,
                           ),
                           SizedBox(
                             height: Reponsive_.crosslength*0.01,
                           ),
                           CommonDropDown(
                             context: context,
                             hint: 'Select Date',
                             list: peopleController.status,
                             mycontrollerValue: peopleController.statusValue,
                             color: AppColors.white,
                           ),
                         ],
                       )
                     ],
                   ):Container()
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.02),
            child: Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: "Apply",
                    onTap: (){
                      onBack(context);
                    },
                  ),
                ),
                SizedBox(width: Reponsive_.crosslength*0.01,),
                Expanded(
                  child: CommonButton(
                    text: "Reset",
                    color: AppColors.allGray,
                    onTap: (){
                      onBack(context);
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Reponsive_.crosslength*0.01,
          ),
        ],
      ),

    );
  }
}
