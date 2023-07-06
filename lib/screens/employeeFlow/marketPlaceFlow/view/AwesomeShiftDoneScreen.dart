import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/employeeFlow/marketPlaceFlow/view/runningShiftInScreen.dart';

class AwesomeShiftScreen extends StatefulWidget {
  const AwesomeShiftScreen({super.key});

  @override
  State<AwesomeShiftScreen> createState() => _AwesomeShiftScreenState();
}

class _AwesomeShiftScreenState extends State<AwesomeShiftScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: Reponsive_.crosslength/10 ,
          ),
          Image.asset(AppAssets.calendarCheck,height: Reponsive_.crosslength/15,width: Reponsive_.crosslength/15,),
          SizedBox(
            height: Reponsive_.crosslength/30 ,
          ),
          InterText(
            text: "Awesome!",
            color: AppColors.blue,
            fontSize: Reponsive_.px30,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Reponsive_.crosslength/60,
          ),
          InterText(
            text: "You successfully booked the shift.",
            color: AppColors.black,
            fontSize: Reponsive_.px16,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(
            height: Reponsive_.crosslength/100,
          ),
          InterText(
            text: "Your shift details are:",
            color: AppColors.black,
            fontSize: Reponsive_.px16,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(
            height: Reponsive_.crosslength/30,
          ),
          InterText(
            text: "Saturday 18, 2023",
            color: AppColors.blue,
            fontSize: Reponsive_.px20,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(
            height: Reponsive_.crosslength/80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.sun,color: AppColors.yallow),
              SizedBox(
                width: Reponsive_.crosslength/100,
              ),
              InterText(
                text: "7:00 AM - 3:00 PM",
                color: AppColors.blue,
                fontSize: Reponsive_.px16,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength/50,
          ),
          GestureDetector(
            onTap: (){
              toPushNavigator(context: context,PageName: RunningShiftInScreen());
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: Reponsive_.crosslength/60,
              ),
              margin: EdgeInsets.symmetric(horizontal:Reponsive_.crosslength/9.2 ),
              decoration: BoxDecoration(
                color: AppColors.deepGreen,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.downlodLeft,height: Reponsive_.crosslength/40,width: Reponsive_.crosslength/40,),
                  SizedBox(
                    width: Reponsive_.crosslength/100,
                  ),
                  MontserratText(
                    text: "Clock In",
                    color: AppColors.white,
                    fontSize: Reponsive_.px16,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Reponsive_.crosslength/15,
          ),
          InterText(
            text: "Go to Dashboard",
            fontSize: Reponsive_.px16,
            fontWeight: FontWeight.w400,
            color: AppColors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
