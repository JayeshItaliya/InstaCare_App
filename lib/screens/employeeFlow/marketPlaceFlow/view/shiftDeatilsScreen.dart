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
import 'package:instacare/screens/employeeFlow/marketPlaceFlow/view/startShiftScreen.dart';

class ShiftDeatilsScreen extends StatefulWidget {
  const ShiftDeatilsScreen({super.key});

  @override
  State<ShiftDeatilsScreen> createState() => _ShiftDeatilsScreenState();
}

class _ShiftDeatilsScreenState extends State<ShiftDeatilsScreen> {
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
                    text: "Apply for Shift",
                    onTap: (){
                      CommonBottonSheet(
                        context: context,
                        childView: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: Reponsive_.crosslength/60,
                            ),
                            MontserratText(
                              text: "Shift Details".toUpperCase(),
                              fontWeight: FontWeight.w400,
                              color: AppColors.blue,
                              fontSize: Reponsive_.px12,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/40,
                            ),
                            MontserratText(
                              text: "7:00AM - 3:00PM",
                              fontWeight: FontWeight.w700,
                              color: AppColors.blue,
                              fontSize: Reponsive_.px30,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            MontserratText(
                              text: "Saturday, March 11 2023",
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                              fontSize: Reponsive_.px18,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "Elevate Care North Branch",
                              fontWeight: FontWeight.w400,
                              color: AppColors.blue,
                              fontSize: Reponsive_.px14,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/80,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on,color: AppColors.yallow,size: 15),
                                InterText(
                                  text: "  Seattle Grace - 135 Ridgewood Ave.",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blue,
                                  fontSize: Reponsive_.px14,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ) ,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonContainer(
                                  bgcolor: AppColors.light_yallow,
                                  borderRadius: Reponsive_.crosslength*0.007,
                                  padding: Reponsive_.crosslength*0.008,
                                  marginleft: 2,
                                  marginright: 0.01,
                                  child: Row(
                                    children: [
                                      Image.asset('assets/x/direction.png',scale: 4,),
                                      InterText(text: ' 5.2 mi',fontSize: Reponsive_.crosslength*0.015,color:AppColors.yallow ,),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Reponsive_.crosslength/110,
                                ),
                                CommonContainer(
                                  bgcolor: AppColors.yallow,
                                  borderRadius: Reponsive_.crosslength*0.007,
                                  padding: Reponsive_.crosslength*0.008,
                                  marginleft: 2,
                                  marginright: 0.01,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InterText(text: 'Incentive +\$5/hr',fontSize: Reponsive_.crosslength*0.015,color:AppColors.black ,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/90,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.verified_user,color: AppColors.deepGreen,size: 10),
                                InterText(
                                  text: " Cancellation Guarantee",
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.black,
                                  fontSize: Reponsive_.px12,
                                )
                              ],
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/40,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: Reponsive_.crosslength/80,right: Reponsive_.crosslength/80),
                              child: Row(
                                children: [
                                  Expanded(
                                    child:CommonButton(
                                        text: "ACCEPT",
                                        onTap: (){
                                          toPushNavigator(context: context,PageName: StartShiftScreen());
                                        }
                                    ),
                                  ),
                                  SizedBox(
                                    width: Reponsive_.crosslength/80,
                                  ),
                                  Expanded(
                                    child:CommonButton(
                                      text: "CLOSE",
                                      onTap: (){
                                        onBack(context);
                                      },
                                      color: AppColors.allGray,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/80,
                            ),
                          ],
                        ),
                      );
                    },
                    color: AppColors.buttonColor,
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
