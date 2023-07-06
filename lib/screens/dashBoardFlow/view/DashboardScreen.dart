import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/addShiftScreenMain.dart';
import 'package:instacare/screens/dashBoardFlow/view/availableEmployeesFlow/view/availableEmployeesScreen.dart';
import 'package:instacare/screens/dashBoardFlow/view/createReminderFlow/view/createReminderScreen.dart';
import 'package:instacare/screens/dashBoardFlow/view/newsFlow/view/newsScreen.dart';
import 'package:instacare/screens/dashBoardFlow/view/openShiftsScreen.dart';
import 'package:instacare/screens/dashBoardFlow/view/peopleDashBoardFlow/view/peopleScreenDetial.dart';
import 'package:instacare/screens/dashBoardFlow/view/reminderFlow/view/reminderScreen.dart';
import '../../../Utils/appAssets.dart';
import '../../../Utils/appColor.dart';
import '../../../Utils/commonController.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Remander> item=[
    Remander(
        time: "Today 11:45AM",
        messages: "Team meeting, brainstorming for the new application scheduling process."
    ),
    Remander(
        time: "19 March 2023   12:00PM",
        messages: "Have to post message to the group."
    ),
  ];
  String? selectedDate;

  DateTime currentDateTime=DateTime.now();
  final cx=Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: ListView(
        shrinkWrap: true,
         padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.02),
        children: [
          SizedBox(
            height: Reponsive_.crosslength/100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child:selectedDate==null?MontserratText(
                  text:DateConverter.formatDate(currentDateTime),
                  color: AppColors.hintTextGrey,
                  fontWeight: FontWeight.w700,
                  fontSize: Reponsive_.px20,
                ):MontserratText(
                  text:selectedDate,
                  color: AppColors.hintTextGrey,
                  fontWeight: FontWeight.w700,
                  fontSize: Reponsive_.px20,
                ),
                onTap: (){
                  DateConverter.RangeDatePicker(
                    context: context,
                    dateRang: false,
                    monthType: true,
                  ).then((value){
                    setState(() {
                      selectedDate=value;
                    });
                  });
                },
              ),
            ],
          ),
          SizedBox(height: Reponsive_.crosslength*0.001,),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 13.w,),
            width:cx.width,
            decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(20.r)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InterText(
                  text: "Total Daily Shifts",
                  fontWeight: FontWeight.w600,
                  fontSize: Reponsive_.px18,
                  color: AppColors.white,
                ),
                InterText(
                  text: "54",
                  fontWeight: FontWeight.w700,
                  fontSize: Reponsive_.px24,
                  color: AppColors.yallow,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: Reponsive_.crosslength*0.01,left: Reponsive_.crosslength*0.01,bottom: Reponsive_.crosslength*0.015),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.dallyShift)
                          ),
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            InterText(
                              text: "24",
                              color: AppColors.yallow,
                              fontSize: Reponsive_.px40,
                              fontWeight: FontWeight.w700,
                            ),
                            Gap(10.h),
                            InterText(
                              text: "Open Shifts",
                              color: AppColors.white,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        toPushNavigator(context: context,PageName:  OpenShiftsScreen(
                          title: "Open Shifts",
                          headerText1: "24 ",
                          headerText2: "Open Shifts Found",
                          enableCheckBox: true,
                          showTime: false,
                          openIcon: true,
                          watchIcon: false,
                          userIcon: false,
                          bodyColor: false,
                          assignedIcon: false,
                          incentiveIcon: false,
                        ));
                      },
                    ),
                  ),
                  Gap(5.w),
                  Expanded(
                    child:  InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: Reponsive_.crosslength*0.01,left: Reponsive_.crosslength*0.01,bottom: Reponsive_.crosslength*0.015),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppAssets.confirmShift)
                            )
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            InterText(
                              text: "30",
                              color: AppColors.yallow,
                              fontSize: Reponsive_.px40,
                              fontWeight: FontWeight.w700,
                            ),
                            Gap(10.h),
                            InterText(
                              text: "Confirmed Shifts",
                              color: AppColors.white,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        toPushNavigator(context: context,PageName:  OpenShiftsScreen(
                          title: "Confirmed Shifts",
                          headerText1: "14 ",
                          headerText2: "Assigned",
                          enableCheckBox: true,
                          showTime: true,
                          openIcon: false,
                          watchIcon: false,
                          userIcon: true,
                          bodyColor: false,
                          assignedIcon: true,
                          incentiveIcon: true,
                        ));
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Reponsive_.crosslength*0.005,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: Reponsive_.crosslength*0.01,left: Reponsive_.crosslength*0.01,bottom: Reponsive_.crosslength*0.015),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.confirmShift)
                          ),
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            InterText(
                              text: "20",
                              color: AppColors.yallow,
                              fontSize: Reponsive_.px40,
                              fontWeight: FontWeight.w700,
                            ),
                            Gap(10.h),
                            InterText(
                              text: "Shifts in Progress",
                              color: AppColors.white,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        toPushNavigator(context: context,PageName:  OpenShiftsScreen(
                          title: "Shifts in Progress",
                          headerText1: "6 ",
                          headerText2: "completed Shifts Found",
                          enableCheckBox: true,
                          showTime: true,
                          openIcon: false,
                          watchIcon: true,
                          userIcon: false,
                          bodyColor: false,
                          assignedIcon: true,
                          incentiveIcon: false,
                        ));
                      },
                    ),
                  ),
                  Gap(5.w),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: Reponsive_.crosslength*0.01,left: Reponsive_.crosslength*0.01,bottom: Reponsive_.crosslength*0.015),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppAssets.completed)
                            )
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            InterText(
                              text: "8",
                              color: AppColors.yallow,
                              fontSize: Reponsive_.px40,
                              fontWeight: FontWeight.w700,
                            ),
                            Gap(10.h),
                            InterText(
                              text: "Completed Shifts",
                              color: AppColors.white,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        toPushNavigator(context: context,PageName:  OpenShiftsScreen(
                          title: "Completed Shifts",
                          headerText1: "8 ",
                          headerText2: "completed Shifts Found",
                          enableCheckBox: false,
                          showTime: true,
                          openIcon: false,
                          watchIcon: false,
                          userIcon: true,
                          bodyColor: true,
                          assignedIcon: true,
                          incentiveIcon: false,
                        ));
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Reponsive_.crosslength*0.005,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: Reponsive_.crosslength*0.01,left: Reponsive_.crosslength*0.01,bottom: Reponsive_.crosslength*0.015),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.callOffer)
                          ),
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            InterText(
                              text: "4",
                              color: AppColors.yallow,
                              fontSize: Reponsive_.px40,
                              fontWeight: FontWeight.w700,
                            ),
                            Gap(10.h),
                            InterText(
                              text: "Call Offs Shifts",
                              color: AppColors.white,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        toPushNavigator(context: context,PageName:  OpenShiftsScreen(
                          title: "Call Offs Shifts",
                          headerText1: "24",
                          headerText2: "CallOffs Shifts Found",
                          enableCheckBox: true,
                          showTime: false,
                          openIcon: false,
                          watchIcon: true,
                          userIcon: false,
                          bodyColor: false,
                          assignedIcon: true,
                          incentiveIcon: false,
                        ));
                      },
                    ),
                  ),
                  Gap(5.w),
                  Expanded(
                    child:  InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: Reponsive_.crosslength*0.01,left: Reponsive_.crosslength*0.01,bottom: Reponsive_.crosslength*0.015),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppAssets.createNew)
                            )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppAssets.add,width: 50.w,height: 50.h),
                              ],
                            ),
                            Gap(10.h),
                            InterText(
                              text: "Create New Shift",
                              color: AppColors.white,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        toPushNavigator(context: context,PageName: AddShiftScreen());
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Reponsive_.crosslength*0.005,
              ),
              cx.instacareLoginValue.toString().contains("instacare")?
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: Reponsive_.crosslength*0.01,left: Reponsive_.crosslength*0.01,bottom: Reponsive_.crosslength*0.015),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.late)
                        ),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          InterText(
                            text: "0",
                            color: AppColors.yallow,
                            fontSize: Reponsive_.px40,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(10.h),
                          InterText(
                            text: "Facility Cancellation",
                            color: AppColors.white,
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(5.w),
                  Expanded(
                    child:  Container(
                      padding: EdgeInsets.only(top: Reponsive_.crosslength*0.01,left: Reponsive_.crosslength*0.01,bottom: Reponsive_.crosslength*0.015),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.late)
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "0",
                            color: AppColors.yallow,
                            fontSize: Reponsive_.px40,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(10.h),
                          InterText(
                            text: "Late",
                            color: AppColors.white,
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ):Container(),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength/50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(
                text: "News",
                fontSize: Reponsive_.px18,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
              InkWell(
                child: InterText(
                  text: "View All",
                  fontSize: Reponsive_.px18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blue,
                ),
                onTap: (){
                  toPushNavigator(context: context,PageName:NewsScreen());
                },
              ),
            ],
          ),
          Stack(
            children: [
              Image.asset("assets/x/news.png",fit: BoxFit.fitWidth,),
              Container(
                padding: EdgeInsets.all(Reponsive_.crosslength*0.03),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    InterText(
                      text: "Print office #1 out of action",
                      fontWeight: FontWeight.w700,
                      color: AppColors.blue,
                      fontSize: Reponsive_.px16,
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength/80,
                    ),
                    InterText(
                      text: "Hi all, Just a quick note that print office number one is currently out of action. Please use the print office at location #2.",
                      fontSize: Reponsive_.px14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                      maxLines: 10,
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength/80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InterText(
                          text: "Rossy Clantoriya",
                          fontWeight: FontWeight.w400,
                          fontSize: Reponsive_.px14,
                          color: AppColors.black,
                        ),
                        InterText(
                          text: "March 8, 2023  11:45AM",
                          fontWeight: FontWeight.w400,
                          fontSize: Reponsive_.px10,
                          color: AppColors.black,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(
                text: "Reminder",
                fontWeight: FontWeight.w700,
                fontSize: Reponsive_.px18,
                color: AppColors.black,
              ),
              Row(
                children: [
                  GestureDetector(
                    child: InterText(
                      text: "Create Remider",
                      fontWeight: FontWeight.w400,
                      fontSize: Reponsive_.px14,
                      color: AppColors.blue,
                    ),
                    onTap: (){
                      toPushNavigator(context: context , PageName: const CreateReminderScreen());
                    },
                  ),
                  Gap(30.w),
                  GestureDetector(
                    child:InterText(
                      text: "View All",
                      fontWeight: FontWeight.w400,
                      fontSize: Reponsive_.px14,
                      color: AppColors.blue,
                    ),
                    onTap: (){
                      toPushNavigator(context: context,PageName: ReminderScreen());
                    },
                  ),
                ],
              )
            ],
          ),
          Gap(10.h),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: item.length,
              itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.only(left: 16,top: 15,right: 16,bottom: 15),
                  margin: EdgeInsets.only(top: 5),
                  width: cx.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                          width: 1,
                          color: AppColors.yallow
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: item[index].time,
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blue,
                          ),
                          Icon(Icons.notifications_active,color: AppColors.yallow,)
                        ],
                      ),
                      Gap(10.h),
                      InterText(
                        text: item[index].messages,
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                );
              }
          ),
          Gap(30.h),
          cx.instacareLoginValue.toString().contains("instacare")? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InterText(
                    text: "Available Employees",
                    fontWeight: FontWeight.w700,
                    fontSize: Reponsive_.px18,
                    color: AppColors.black,
                  ),
                  GestureDetector(
                    child: InterText(
                      text: "View All",
                      fontWeight: FontWeight.w400,
                      fontSize: Reponsive_.px16,
                      color: AppColors.blue,
                    ),
                    onTap: (){
                      toPushNavigator(context: context,PageName: AvailableEmployeesScreen());
                    },
                  ),
                ],
              ),
              Gap(10.h),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.all(10),
                        width: cx.width,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.buttonColor,
                                    width: 3,
                                  ),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                                      fit: BoxFit.cover
                                  )
                              ),
                              height: 50,
                              width: 50,
                            ),
                            Gap(10),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InterText(
                                        text: "Jasnah Kholin",
                                        color: AppColors.black,
                                        fontSize: Reponsive_.px18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      Row(
                                        children: [
                                          InterText(
                                            text: "Available ",
                                            color: AppColors.hintTextGrey,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(126, 230, 155, 1)
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Gap(8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          InterText(
                                            text: "CNA",
                                            color: AppColors.black,
                                            fontSize: Reponsive_.px16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: InterText(
                                              text: "Jasnah@outlook.com",
                                              color: AppColors.blue,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(

                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                            decoration:   BoxDecoration(
                                              color: AppColors.yallow,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: InterText(
                                              text: "0 pts",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                              color: AppColors.blue,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: (){
                        toPushNavigator(context: context,PageName: PeopleScreenDetil());
                      },
                    );
                  }
              ),
              SizedBox(height: 30,),
            ],
          ):Container()
        ],
      ),
    );
  }
}
