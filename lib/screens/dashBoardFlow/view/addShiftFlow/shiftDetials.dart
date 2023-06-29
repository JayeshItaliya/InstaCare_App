import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/view/dashBoardMainScreen.dart';

class ShiftDeatils extends StatefulWidget {
  const ShiftDeatils({Key? key}) : super(key: key);

  @override
  State<ShiftDeatils> createState() => _ShiftDeatilsState();
}

class _ShiftDeatilsState extends State<ShiftDeatils> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      body: ListView(
        padding: padding,
        children: [
          SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Image.asset(AppAssets.calendarCheck),
              InterText(
                text: "Awesome!",
                fontWeight: FontWeight.w300,
                fontSize: Reponsive_.px30,
                color: AppColors.blue,
              ),
              SizedBox(height: 10,),
              InterText(
                text: "You successfully booked the shifts.\nYour shifts details are:",
                fontWeight: FontWeight.w400,
                fontSize: Reponsive_.px16,
                color: AppColors.black,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10,),
              InterText(
                text: "Care Center",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColors.blue,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10,),
              InterText(
                text: "2 Open shifts for LPN",
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: AppColors.black,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              InterText(
                text: "Monday Feb 20, 2023",
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px18,
                color: AppColors.blue,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.sun,color: AppColors.yallow),
                  InterText(
                    text: "7:00 aM - 3:00 PM",
                    fontWeight: FontWeight.w700,
                    fontSize: Reponsive_.px16,
                    color: AppColors.black,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              SizedBox(height: 20,),
              InterText(
                text: "Tuesday Feb 21, 2023",
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px18,
                color: AppColors.blue,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.sun,color: AppColors.yallow),
                  InterText(
                    text: "7:00 aM - 3:00 PM",
                    fontWeight: FontWeight.w700,
                    fontSize: Reponsive_.px16,
                    color: AppColors.black,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),


              SizedBox(height: 20,),
              InterText(
                text: "Wednesday Feb 22, 2023",
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px18,
                color: AppColors.blue,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.sun,color: AppColors.yallow),
                  InterText(
                    text: "7:00 aM - 3:00 PM",
                    fontWeight: FontWeight.w700,
                    fontSize: Reponsive_.px16,
                    color: AppColors.black,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              SizedBox(height: 20,),
              InterText(
                text: "Thursday Feb 23, 2023",
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px18,
                color: AppColors.blue,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.sun,color: AppColors.yallow),
                  InterText(
                    text: "7:00 aM - 3:00 PM",
                    fontWeight: FontWeight.w700,
                    fontSize: Reponsive_.px16,
                    color: AppColors.black,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              SizedBox(height: 20,),
              InkWell(
                child: InterText(
                  text: "Go to Dashboard",
                  fontWeight: FontWeight.w400,
                  fontSize: Reponsive_.px16,
                  color: AppColors.blue,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                onTap: (){
                  toPushNavigator(context: context,PageName: DashBoardScreen());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
