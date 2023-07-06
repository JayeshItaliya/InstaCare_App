import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/employeeFlow/marketPlaceFlow/view/AwesomeShiftDoneScreen.dart';
import 'package:instacare/screens/employeeFlow/marketPlaceFlow/view/doneShiftScreen.dart';

class ShiftSummaryScreen extends StatefulWidget {
  const ShiftSummaryScreen({super.key});

  @override
  State<ShiftSummaryScreen> createState() => _ShiftSummaryScreenState();
}

class _ShiftSummaryScreenState extends State<ShiftSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: Reponsive_.w,
            height: Reponsive_.crosslength/2.5,
            child: Stack(
              children: [
                Container(
                  margin:EdgeInsets.only(bottom: Reponsive_.crosslength*0.015),
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
                            text: "Summary",
                            fontWeight: FontWeight.w700,
                            fontSize: Reponsive_.px24,
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
                Positioned(
                  child: Image.asset("assets/x/downlodShift.png",scale: 3.5),
                  bottom: Reponsive_.crosslength*0.002,
                  right:Reponsive_.crosslength*0.015 ,
                ),
              ],
            ),
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
                    Row(
                      children: [
                        Image.asset(AppAssets.clockTimeEmp,height: 16,width: 16),
                        SizedBox(
                          width: Reponsive_.crosslength*0.01,
                        ),
                        InterText(
                          text: "Morning Shift - 8 Hours",
                          fontWeight: FontWeight.w400,
                          fontSize: Reponsive_.px16,
                          color: AppColors.black,
                          textAlign: TextAlign.start,
                        ),
                      ],
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
                      width: Reponsive_.crosslength/25,
                      height: Reponsive_.crosslength/25,
                      alignment: Alignment.center,
                      child: Image.asset(AppAssets.downlodLeft,scale: 3,),
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
                      text: "Clock-Out",
                      fontSize: Reponsive_.px20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    Container(
                      width: Reponsive_.crosslength/25,
                      height: Reponsive_.crosslength/25,
                      alignment: Alignment.center,
                      child: Image.asset(AppAssets.downlodLeft,scale: 3,),
                      decoration: BoxDecoration(
                          color: AppColors.redColor,
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
                      text: "3:25 AM",
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blue,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: Reponsive_.crosslength/80,
          ),
          Container(
            width: Reponsive_.w,
            height: Reponsive_.crosslength/17,
            margin: EdgeInsets.only(left: Reponsive_.crosslength/80,right: Reponsive_.crosslength/80),
            padding: EdgeInsets.only(left:Reponsive_.crosslength/80,right: Reponsive_.crosslength/80,),
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InterText(
                  text: "Total hours worked (8.25hrs)",
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                  fontSize: Reponsive_.px16,
                ),
                InterText(
                  text: "8:15",
                  fontWeight: FontWeight.w700,
                  color: AppColors.yallow,
                  fontSize: Reponsive_.px20,
                ),
              ],
            ),
          ),
          SizedBox(
            height: Reponsive_.crosslength/8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: "EXIT",
                    onTap: (){
                      toPushNavigator(context: context,PageName: DoneShiftScreen());
                    },
                    color: AppColors.redColor,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          )
        ],
      ),
    );
  }
}
