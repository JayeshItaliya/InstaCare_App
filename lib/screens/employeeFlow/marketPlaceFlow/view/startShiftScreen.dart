import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/employeeFlow/marketPlaceFlow/view/AwesomeShiftDoneScreen.dart';

class StartShiftScreen extends StatefulWidget {
  const StartShiftScreen({super.key});

  @override
  State<StartShiftScreen> createState() => _StartShiftScreenState();
}

class _StartShiftScreenState extends State<StartShiftScreen> {
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
                      text: "Current Rate",
                      fontSize: Reponsive_.px20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    InterText(
                      text: "\$85 USD/hr",
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blue,
                    ),

                  ],
                ),
                SizedBox(
                  height: Reponsive_.crosslength/90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterText(
                      text: "Total hours to complete:",
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength/80,
                    ),
                    InterText(
                      text: "8hrs",
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
          CommonContainer(
            padding: Reponsive_.crosslength/100,
            bgcolor: AppColors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: "Contact",
                      fontSize: Reponsive_.px20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength/100,
                    ),
                    InterText(
                      text: "Dr. Joel Newman",
                      fontSize: Reponsive_.px18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ],
                ),
                Image.asset(AppAssets.doctorPhoto)
              ],
            ),
          ),
          SizedBox(
            height: Reponsive_.crosslength/40,
          ),
          Padding(
            padding:   EdgeInsets.only(left: Reponsive_.crosslength/40,right: Reponsive_.crosslength/40,bottom: Reponsive_.crosslength/50),
            child: Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: "Clock-In",
                    onTap: (){
                        toPushNavigator(context: context,PageName: AwesomeShiftScreen());
                    },
                    color: AppColors.deepGreen,
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