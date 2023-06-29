import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:instacare/screens/employeeFlow/myAvailabilityFlow/controllers/FacilitySelectionController.dart';
import 'package:instacare/screens/employeeFlow/timeCardFlow/controller/filterTimeCardController.dart';

class EmployeeFilterTimerScreen extends StatefulWidget {
  const EmployeeFilterTimerScreen({super.key});

  @override
  State<EmployeeFilterTimerScreen> createState() => _EmployeeFilterTimerScreenState();
}

class _EmployeeFilterTimerScreenState extends State<EmployeeFilterTimerScreen> {
  final facilityController=Get.put(FilterTimeCardController());
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
        body: SafeArea(
          child: ListView(
            padding: padding,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MontserratText(
                    text: "Apply Filter",
                    fontWeight: FontWeight.w700,
                    fontSize: Reponsive_.px30,
                    color: AppColors.black,
                  ),
                  GestureDetector(
                      child: const Icon(Icons.clear,color: AppColors.allGray,),
                     onTap: (){
                        onBack(context);
                     },
                  )
                ],
              ),
              SizedBox(height: Reponsive_.crosslength*0.040 ,),
                CommonDropDown(
                    context: context,
                    list: facilityController.facilityList,
                    mycontrollerValue: facilityController.facilityValue,
                  color: AppColors.white
                ),
              SizedBox(height: Reponsive_.crosslength*0.010,),
              Obx(() => GestureDetector(
                onTap: (){
                  DateConverter.RangeDatePicker(
                      context: context,
                      monthType: false,
                      dateRang: false,
                      dateType: true
                  ).then((value) {
                    print(value);
                    facilityController.selectDate.value=value.toString();
                    print(facilityController.selectDate.value);
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(left:Reponsive_.crosslength*0.020,right:Reponsive_.crosslength*0.020),
                  width: Reponsive_.w,
                  height: Reponsive_.crosslength*0.070,
                  decoration: ShapeDecoration(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterText(
                        text: facilityController.selectDate.value,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      Image.asset(AppAssets.dropDown)
                    ],
                  ),
                ),
              )
              )
            ],
          ),
        ) ,
    );
  }
}
