import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/employeeFlow/marketPlaceFlow/controllers/shiftInProcessController.dart';
import 'package:instacare/screens/employeeFlow/marketPlaceFlow/view/endShiftInScreen.dart';

class RunningShiftInScreen extends StatefulWidget {
  const RunningShiftInScreen({super.key});

  @override
  State<RunningShiftInScreen> createState() => _RunningShiftInScreenState();
}

class _RunningShiftInScreenState extends State<RunningShiftInScreen> {
  final shiftController=Get.put(ShiftInProcessController());
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: ListView(
        padding: EdgeInsets.zero,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Reponsive_.w,
            height: Reponsive_.crosslength/2.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.shiftBackGroundScreen),
                fit: BoxFit.cover,
                colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
              )
            ),
            padding:EdgeInsets.only(top: Reponsive_.crosslength/30,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back,color: AppColors.white),
                      onPressed: (){
                        onBack(context);
                      },
                    ),
                    MontserratText(
                      text: "Shift In Process",
                      fontWeight: FontWeight.w600,
                      fontSize: Reponsive_.px18,
                      color:AppColors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: Reponsive_.crosslength/100),
                      child: Image.asset(AppAssets.bell,width: 25,height: 25,color: AppColors.white,),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Padding(
                  padding: EdgeInsets.only(left: Reponsive_.crosslength/80,right: Reponsive_.crosslength/80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Saturday, 18 March 2023",
                            fontWeight: FontWeight.w600,
                            fontSize: Reponsive_.px20,
                            color: AppColors.white,
                          ),
                          Row(
                            children: [
                              Image.asset(AppAssets.senderEmp),
                              SizedBox(
                                width: Reponsive_.crosslength/110,
                              ),
                              InterText(
                                text: "5.2 mi",
                                fontWeight: FontWeight.w400,
                                fontSize: Reponsive_.px14,
                                color: AppColors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/60,
                      ),
                      MontserratText(
                        text: "Elevate Care North Branch - CNA",
                        fontSize: Reponsive_.px24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/35,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Reponsive_.crosslength/80,
          ),
          CommonContainer(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.clockTimeEmp,height: 16,width: 16),
                    InterText(
                      text: "Morning Shift - 8 Hours",
                      fontWeight: FontWeight.w400,
                      fontSize: Reponsive_.px16,
                      color: AppColors.black,
                    ),
                    Row(
                      children: [
                        Image.asset(AppAssets.sun,color: AppColors.yallow,),
                        SizedBox(
                          width: 5,
                        ),
                        InterText(
                          text: "7:00AM - 3:00PM",
                          fontSize: Reponsive_.px14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: Reponsive_.crosslength/90,
                ),
                Row(
                  children: [
                    Image.asset(AppAssets.location,color: AppColors.blue),
                    SizedBox(
                      width: Reponsive_.crosslength/100,
                    ),
                    InterText(
                      text: "Seattle Grace - 135 Ridgewood Ave.",
                      fontWeight: FontWeight.w400,
                      fontSize: Reponsive_.px16,
                      color: AppColors.black,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: Reponsive_.crosslength/80,
          ),
          CommonContainer(
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InterText(
                       text: "Clock-In",
                       fontSize: Reponsive_.px20,
                       fontWeight: FontWeight.w600,
                       color: AppColors.black,
                     ),
                     Container(
                       width: Reponsive_.crosslength/35,
                       height: Reponsive_.crosslength/35,
                       padding: EdgeInsets.all(Reponsive_.crosslength*0.007),
                       alignment: Alignment.center,
                       child: Image.asset(AppAssets.downlodLeft,),
                       decoration: BoxDecoration(
                         color: AppColors.deepGreen,
                         shape: BoxShape.circle
                       ),
                     )
                   ],
                 ),
                SizedBox(
                  height: Reponsive_.crosslength/90,
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     InterText(
                       text: "Shift starts at",
                       fontSize: Reponsive_.px16,
                       fontWeight: FontWeight.w400,
                       color: AppColors.black,
                     ),
                     SizedBox(
                       height: Reponsive_.crosslength/80,
                     ),
                     InterText(
                       text: "7:00 AM",
                       fontSize: Reponsive_.px16,
                       fontWeight: FontWeight.w700,
                       color: AppColors.blue,
                     ),
                   ],
                 )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.access_time_rounded,color: AppColors.allGray),
                onPressed:(){},
              )
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength/90,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InterText(
                text: "Shift in Process".toUpperCase(),
                fontSize: Reponsive_.px12,
                fontWeight: FontWeight.w400,
                color: AppColors.allGray,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left:Reponsive_.crosslength/90 ,right:Reponsive_.crosslength/90 ,top: Reponsive_.crosslength/10,bottom:Reponsive_.crosslength/50 ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    child: Container(
                      height: Reponsive_.crosslength/18,
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.coffee),
                          SizedBox(width: Reponsive_.crosslength/100,),
                          MontserratText(
                            text: "Take Break".toUpperCase(),
                            fontWeight: FontWeight.w400,
                            fontSize: Reponsive_.px16,
                            color: AppColors.white,
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      CommonBottonSheet(
                        context: context,
                        childView: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            CommonContainer(
                              child: ListView(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  ListTile(
                                    onTap: (){
                                      shiftController.lunchBreakValue.value=!shiftController.lunchBreakValue.value;
                                      if(shiftController.lunchBreakValue.value==true) {
                                        shiftController.lunchValue.value="Lunch Break";
                                        print(shiftController.lunchValue.value);
                                      }
                                    },
                                    leading: Transform.scale(
                                      scale: 1.3,
                                      child: Obx(
                                            ()=> Checkbox(
                                          shape: CircleBorder(),
                                              side: MaterialStateBorderSide.resolveWith(
                                                    (states) => BorderSide(width: 1.0, color: AppColors.buttonColor),
                                              ),
                                          value: shiftController.lunchBreakValue.value,
                                          activeColor: AppColors.buttonColor,
                                          onChanged: (bool? newValue) {
                                            shiftController.lunchBreakValue.value=newValue!;
                                            if(shiftController.lunchBreakValue.value==true) {
                                              shiftController.lunchValue.value="Lunch Break";
                                              print(shiftController.lunchValue.value);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    title: InterText(
                                      text: "Lunch Break",
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                      fontSize: Reponsive_.px18,
                                    ),
                                    subtitle: InterText(
                                      text: "1 hour",
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                      fontSize: Reponsive_.px18,
                                    ),
                                    trailing: Image.asset(AppAssets.lunchBrake,width: 30,height: 30),
                                    contentPadding: EdgeInsets.zero,

                                  ),
                                ],
                              ),
                              bgcolor: AppColors.backGroundColor,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/80,
                            ),
                            CommonContainer(
                              child: ListView(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  ListTile(
                                    onTap: (){
                                      shiftController.coffeeValue.value=!shiftController.coffeeValue.value;
                                      if(shiftController.lunchBreakValue.value==true) {
                                        shiftController.lunchValue.value="Coffee Break";
                                        print(shiftController.lunchValue.value);
                                      }
                                    },
                                    leading: Transform.scale(
                                      scale: 1.3,
                                      child: Obx(
                                            ()=> Checkbox(
                                          shape: CircleBorder(),
                                              side: MaterialStateBorderSide.resolveWith(
                                                    (states) => BorderSide(width: 1.0, color: AppColors.buttonColor),
                                              ),
                                          value: shiftController.coffeeValue.value,
                                          activeColor: AppColors.buttonColor,
                                          onChanged: (bool? newValue) {
                                            shiftController.coffeeValue.value=newValue!;
                                            if(shiftController.lunchBreakValue.value==true) {
                                              shiftController.lunchValue.value="Coffee Break";
                                              print(shiftController.lunchValue.value);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                    title: InterText(
                                      text: "Coffee Break",
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                      fontSize: Reponsive_.px18,
                                    ),
                                    subtitle: InterText(
                                      text: "15 minutes",
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                      fontSize: Reponsive_.px18,
                                    ),
                                    trailing: Image.asset(AppAssets.coffee,width: 30,height: 30),
                                  ),
                                ],
                              ),
                              bgcolor: AppColors.backGroundColor,
                            ),

                            SizedBox(
                              height: Reponsive_.crosslength/80,
                            ),
                            CommonContainer(
                              child: ListView(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    onTap: (){
                                      shiftController.otherBrake.value=!shiftController.otherBrake.value;
                                      if(shiftController.lunchBreakValue.value==true) {
                                        shiftController.lunchValue.value="Other Break";
                                        print(shiftController.lunchValue.value);
                                      }
                                    },
                                    leading: Transform.scale(
                                      scale: 1.3,
                                      child: Obx(
                                            ()=> Checkbox(
                                          shape: CircleBorder(),
                                          value: shiftController.otherBrake.value,
                                              side: MaterialStateBorderSide.resolveWith(
                                                    (states) => BorderSide(width: 1.0, color: AppColors.buttonColor),
                                              ),
                                          activeColor: AppColors.buttonColor,
                                          onChanged: (bool? newValue) {
                                            shiftController.otherBrake.value=newValue!;
                                            if(shiftController.lunchBreakValue.value==true) {
                                              shiftController.lunchValue.value="Other Break";
                                              print(shiftController.lunchValue.value);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    title: Column(
                                      children: [
                                        InterText(
                                          text: "Other Break",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.black,
                                          fontSize: Reponsive_.px18,
                                        ),
                                        SizedBox(
                                          height: Reponsive_.crosslength/90,
                                        ),
                                        Container(
                                          height: Reponsive_.crosslength/30,
                                          width: Reponsive_.crosslength/7,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.circular(30)
                                          ),
                                          child: InterText(
                                            text: "Break Start Time",
                                            fontSize: Reponsive_.px14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: Reponsive_.crosslength/100,
                                        ),
                                        Container(
                                          height: Reponsive_.crosslength/30,
                                          width: Reponsive_.crosslength/7,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          child: InterText(
                                            text: "Break End Time",
                                            fontSize: Reponsive_.px14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    ),
                                    trailing: Image.asset(AppAssets.other,width: 30,height: 30),
                                  ),
                                ],
                              ),
                              bgcolor: AppColors.backGroundColor,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/80,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CommonButton(
                                      text: "Add Break Time",
                                      onTap: (){
                                        onBack(context);
                                      },
                                    ),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            )
                          ],
                        )
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: Reponsive_.crosslength/110,
                ),
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: (){
                      toPushNavigator(context: context,PageName: ShiftSummaryScreen());
                    },
                    child: Container(
                      height: Reponsive_.crosslength/18,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(243, 48, 71, 0.1),
                        border: Border.all(
                          color: AppColors.redColor,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.clocseShift),
                          SizedBox(width: Reponsive_.crosslength/100,),
                          MontserratText(
                            text: "End Shift".toUpperCase(),
                            fontWeight: FontWeight.w400,
                            fontSize: Reponsive_.px16,
                            color: AppColors.redColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Reponsive_.crosslength/110,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: Reponsive_.crosslength/15,
                    decoration: BoxDecoration(
                        color: AppColors.yallow,
                      shape: BoxShape.circle
                    ),
                    child: Image.asset(AppAssets.messages),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
