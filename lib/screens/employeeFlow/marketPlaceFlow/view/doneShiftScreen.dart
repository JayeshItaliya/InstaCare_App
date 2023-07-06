import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/view/dashBoardMainScreen.dart';

class DoneShiftScreen extends StatefulWidget {
  const DoneShiftScreen({super.key});

  @override
  State<DoneShiftScreen> createState() => _DoneShiftScreenState();
}

class _DoneShiftScreenState extends State<DoneShiftScreen> {
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
            text: "Thank you!",
            color: AppColors.blue,
            fontSize: Reponsive_.px30,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Reponsive_.crosslength/60,
          ),
          InterText(
            text: "You successfully completed your shift.",
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
            height: Reponsive_.crosslength/30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.access_time_rounded,color: AppColors.blue,),
              SizedBox(width: 10,),
              MontserratText(
                text: "8:15",
                fontSize: Reponsive_.px30,
                color: AppColors.blue,
                fontWeight: FontWeight.w700,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          MontserratText(
            text: "Hours Total worked",
            fontSize: Reponsive_.px12,
            color: AppColors.black,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Reponsive_.crosslength/15,
          ),
          GestureDetector(
            onTap: (){
              toPushNavigator(context: context,PageName: DashBoardScreen());
            },
            child: InterText(
              text: "Go to Dashboard",
              fontSize: Reponsive_.px16,
              fontWeight: FontWeight.w400,
              color: AppColors.blue,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
