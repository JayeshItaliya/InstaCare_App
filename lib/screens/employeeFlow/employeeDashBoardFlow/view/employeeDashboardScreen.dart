import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/employeeFlow/timeCardFlow/view/employeeTimeCard.dart';

class EmployeeDashBoardScreen extends StatefulWidget {
  const EmployeeDashBoardScreen({super.key});

  @override
  State<EmployeeDashBoardScreen> createState() => _EmployeeDashBoardScreenState();
}

class _EmployeeDashBoardScreenState extends State<EmployeeDashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: ListView(
        padding: padding,
        children: [
            MontserratText(
              text: "Upcoming Shifts",
              color: AppColors.hintTextGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center
            ),
          SizedBox(height: Reponsive_.crosslength/30,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex:1,
                      child: Container(
                        width: Reponsive_.w/12,
                        height: Reponsive_.h/9,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: NetworkImage("https://cdn.assistedlivingcenter.com/wp-content/uploads/2020/11/elevate-care-riverwoods-il.jpg"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Reponsive_.crosslength/100,),
                    Expanded(
                      flex:3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "Elevate Care North Branch",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.black,
                          ),
                          SizedBox(height: Reponsive_.crosslength/200,),
                          InterText(
                            text: "Tuesday, 21 March 2023",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.hintTextGrey,
                          ),
                          SizedBox(height: Reponsive_.crosslength/200,),
                          Row(
                            children: [
                              const Icon(Icons.access_time_filled_rounded,color: AppColors.buttonColor,),
                              SizedBox(width: Reponsive_.crosslength/200,),
                              InterText(
                                text: "Clock In at 7:00AM",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColors.buttonColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          ),
          SizedBox(
            height: Reponsive_.crosslength/35,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: Reponsive_.crosslength/10,
                  height: Reponsive_.crosslength/8,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InterText(
                        text: "42",
                        color: AppColors.yallow,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      InterText(
                        text: "Marketplace",
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    toPushNavigator(PageName: EmployeeTimeCard(),context: context);
                  },
                  child: Container(
                    width: Reponsive_.crosslength/10,
                    height: Reponsive_.crosslength/8,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.calenderEmployee),
                        InterText(
                          text: "My Account",
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength/35,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: Reponsive_.crosslength/10,
                  height: Reponsive_.crosslength/8,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.settings),
                      SizedBox(
                        height: 8,
                      ),
                      InterText(
                        text: "My Availability",
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  width: Reponsive_.crosslength/10,
                  height: Reponsive_.crosslength/8,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.payroll),
                      SizedBox(
                        height: 8,
                      ),
                      InterText(
                        text: "My Account",
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
