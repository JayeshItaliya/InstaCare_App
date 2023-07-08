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
  State<EmployeeDashBoardScreen> createState() =>
      _EmployeeDashBoardScreenState();
}

class _EmployeeDashBoardScreenState extends State<EmployeeDashBoardScreen> {
  String bulletinn_text =
      'Hi all,\nJust a quick note that print office number one is currently out of action. Please use the print office at location #2.';

  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: ListView(
        padding:
            EdgeInsets.symmetric(horizontal: Reponsive_.crosslength * 0.015),
        children: [
          MontserratText(
              text: "Upcoming Shifts",
              color: AppColors.hintTextGrey,
              fontSize: Reponsive_.crosslength * 0.02,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center),
          SizedBox(
            height: Reponsive_.crosslength * 0.005,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Reponsive_.crosslength * 0.02),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(Reponsive_.crosslength * 0.01),
                    child: Row(
                      children: [
                        Container(
                          width: Reponsive_.crosslength * 0.08,
                          height: Reponsive_.crosslength * 0.08,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://cdn.assistedlivingcenter.com/wp-content/uploads/2020/11/elevate-care-riverwoods-il.jpg"),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Reponsive_.crosslength / 100,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InterText(
                                text: "Elevate Care North Branch",
                                fontWeight: FontWeight.w600,
                                fontSize: Reponsive_.px18,
                                color: AppColors.black,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength / 200,
                              ),
                              InterText(
                                text: "Tuesday, 21 March 2023",
                                fontWeight: FontWeight.w600,
                                fontSize: Reponsive_.px16,
                                color: AppColors.hintTextGrey,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength / 200,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_time_filled_rounded,
                                      color: AppColors.buttonColor,
                                      size: Reponsive_.crosslength * 0.018),
                                  SizedBox(
                                    width: Reponsive_.crosslength / 200,
                                  ),
                                  InterText(
                                    text: "Clock In at 7:00AM",
                                    fontWeight: FontWeight.w600,
                                    fontSize: Reponsive_.px16,
                                    color: AppColors.buttonColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
          SizedBox(
            height: Reponsive_.crosslength / 35,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: Reponsive_.crosslength / 8,
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
                        fontSize: Reponsive_.px16,
                        fontWeight: FontWeight.normal,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: Reponsive_.crosslength * 0.015,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    toPushNavigator(
                        PageName: EmployeeTimeCard(), context: context);
                  },
                  child: Container(
                    height: Reponsive_.crosslength / 8,
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
            height: Reponsive_.crosslength * 0.015,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: Reponsive_.crosslength / 8,
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
              SizedBox(
                width: Reponsive_.crosslength * 0.015,
              ),
              Expanded(
                child: Container(
                  height: Reponsive_.crosslength / 8,
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
                        fontSize: Reponsive_.px16,
                        fontWeight: FontWeight.normal,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength / 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(
                text: 'Instacare Bulletin',
                fontWeight: FontWeight.w700,
                fontSize: Reponsive_.px18,
                color: AppColors.black,
              ),
              InterText(
                text: 'View All',
                fontWeight: FontWeight.w400,
                fontSize: Reponsive_.px14,
                color: AppColors.blue,
              ),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.01,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(Reponsive_.crosslength * 0.02),
            ),
            margin: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsets.all(Reponsive_.crosslength * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InterText(
                    text: 'Print office #1 out of action',
                    fontWeight: FontWeight.w700,
                    fontSize: Reponsive_.px16,
                    color: AppColors.blue,
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.01,
                  ),
                  InterText(
                    text: bulletinn_text,
                    height: 1.5,
                    maxLines: bulletinn_text.length,
                    fontWeight: FontWeight.w400,
                    fontSize: Reponsive_.px14,
                    color: AppColors.hintTextGrey,
                    textOverflow: TextOverflow.clip,
                    // softWrap: true,
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterText(
                        text: 'Rossy Clantoriya',
                        fontWeight: FontWeight.w400,
                        fontSize: Reponsive_.px14,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: 'March 8, 2023  11:45AM',
                        fontWeight: FontWeight.w400,
                        fontSize: Reponsive_.px10,
                        color: AppColors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: Reponsive_.crosslength * 0.02,
          ),
        ],
      ),
    );
  }
}
