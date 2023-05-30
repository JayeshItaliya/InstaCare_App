import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cool_card_swiper/constants.dart';
import 'package:flutter_cool_card_swiper/data.dart';
import 'package:flutter_cool_card_swiper/widgets/cool_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonDrower.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/helper/date_conveter.dart';



class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final globalKey = GlobalKey<ScaffoldState>();
  DateTime currentDateTime=DateTime.now();
  final cx=Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      key: globalKey,
      appBar: CommonAppBar(
        title:  Image.asset(AppAssets.app),
        icon: InkWell(
          child: Builder(
              builder: (context) {
                return Image.asset(
                  AppAssets.menu,
                  width: 20,
                  height: 20,
                );
              }
          ),
          onTap: (){
            globalKey.currentState!.openDrawer();
          },
        ),
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              AppAssets.bell,
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: padding,
        children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               InkWell(
                 child:selectedDate==null?MontserratText(
                   text:DateConverter.formatDate(currentDateTime),
                   color: AppColors.hintTextGrey,
                   fontWeight: FontWeight.w700,
                 ):MontserratText(
                   text:selectedDate,
                   color: AppColors.hintTextGrey,
                   fontWeight: FontWeight.w700,
                 ),
                 onTap: (){
                   rangeDatePicker();
                 },
               ),
             ],
           ),
          Gap(10.h),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 15.w,right: 15.w),
            width:cx.width,
            height: cx.height/13,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(40.r)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InterText(
                  text: "Total Daily Shifts",
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: AppColors.white,
                ),
                InterText(
                  text: "54",
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                  color: AppColors.yallow,
                ),
              ],
            ),
          ),
          Gap(10.h),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 18,left: 15,bottom: 12),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.dallyShift)
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "24",
                            color: AppColors.yallow,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(10.h),
                          InterText(
                            text: "Open Shifts",
                            color: AppColors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(5.w),
                  Expanded(
                    child:  Container(
                      padding: EdgeInsets.only(top: 18,left: 15,bottom: 12),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.confirmShift)
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "30",
                            color: AppColors.yallow,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(10.h),
                          InterText(
                            text: "Confirmed Shifts",
                            color: AppColors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 18,left: 15,bottom: 12),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.confirmShift)
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "20",
                            color: AppColors.yallow,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(10.h),
                          InterText(
                            text: "Shifts in Progress",
                            color: AppColors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(5.w),
                  Expanded(
                    child:  Container(
                      padding: EdgeInsets.only(top: 18,left: 15,bottom: 12),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.completed)
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "8",
                            color: AppColors.yallow,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(10.h),
                          InterText(
                            text: "Completed Shifts",
                            color: AppColors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 18,left: 15,bottom: 12),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.callOffer)
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "4",
                            color: AppColors.yallow,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(10.h),
                          InterText(
                            text: "Call Offs Shifts",
                            color: AppColors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(5.w),
                  Expanded(
                    child:  Container(
                      padding: EdgeInsets.only(top: 18,left: 15,bottom: 12),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppAssets.createNew)
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.add,width: 50.w,height: 50.h),
                          Gap(10.h),
                          InterText(
                            text: "Create New Shift",
                            color: AppColors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 18,left: 15,bottom: 12),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.late)
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "0",
                            color: AppColors.yallow,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(10.h),
                          InterText(
                            text: "Facility Cancellation",
                            color: AppColors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(5.w),
                  Expanded(
                    child:  Container(
                      padding: EdgeInsets.only(top: 18,left: 15,bottom: 12),
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
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          Gap(10.h),
                          InterText(
                            text: "Late",
                            color: AppColors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(
                text: "News",
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
              InterText(
                text: "View All",
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.blue,
              ),
            ],
          ),
          Gap(100),
          Gap(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(
                text: "Reminder",
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: AppColors.black,
              ),
              Row(
                children: [
                  InterText(
                     text: "Create Remider",
                     fontWeight: FontWeight.w400,
                    fontSize: 17.sp,
                    color: AppColors.blue,
                  ),
                  Gap(30.w),
                  InterText(
                    text: "View All",
                    fontWeight: FontWeight.w400,
                    fontSize: 17.sp,
                    color: AppColors.blue,
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
                padding: EdgeInsets.only(left: 16,top: 15,right: 16,bottom: 8),
                margin: EdgeInsets.only(top: 10),
                width: cx.width,
                height: cx.height/6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    width: 2,
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
                          fontSize: 16,
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
          Gap(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(
                text: "Available Employees",
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: AppColors.black,
              ),
              InterText(
                text: "View All",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.blue,
              ),
            ],
          ),
          Gap(10.h),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                width: cx.width,
                height: cx.height/8,
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
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                              fit: BoxFit.cover
                          )
                      ),
                      height: 50,
                      width: 50,
                    ),
                    Gap(10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterText(
                              text: "Jasnah Kholin",
                              color: AppColors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            Gap(MediaQuery.of(context).size.width/4),
                            Row(
                              children: [
                                InterText(
                                  text: "Available",
                                  color: AppColors.hintTextGrey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                Gap(10),
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
                        Gap(10),
                        Row(
                          children: [
                            InterText(
                              text: "CNA",
                              color: AppColors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            Gap(MediaQuery.of(context).size.width/20),
                            InterText(
                              text: "Jasnah@outlook.com",
                              color: AppColors.hintTextGrey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            Gap(MediaQuery.of(context).size.width/20),
                            Container(
                              alignment: Alignment.center,
                              width: 62,
                              height: 26,
                              decoration:   BoxDecoration(
                                  color: AppColors.yallow,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InterText(
                                text: "0 pts",
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: AppColors.blue,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
          )
        ],
      ),
      drawer: const Drawer(
        width:  300,
        child: CommonDrawer(),
      ),
    );
  }
  List<DateTime?> rangeDatePickerValueWithDefaultValue = [];
  String? selectedDate;

  rangeDatePicker() async {
    var results = (await showCalendarDatePicker2Dialog(
      context: context,
      dialogBackgroundColor: AppColors.backGroundColor,
      barrierDismissible: false,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
        weekdayLabels:weekList,
         centerAlignModePicker: true,
        dayBorderRadius:BorderRadius.circular(20),
        selectedDayTextStyle: TextStyle(color: AppColors.white),
        selectedDayHighlightColor: AppColors.buttonColor,
        currentDate: DateTime.now(),
        dayTextStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color.fromRGBO(2, 5, 10, 1)
        ),
        lastDate: DateTime.now(),
      ),
      dialogSize: const Size(325, 400),
      //initialValue: rangeDatePickerValueWithDefaultValue,
      borderRadius: BorderRadius.circular(15),
    ));
    setState(() {
      selectedDate=DateConverter.formatDate(DateTime.parse(results![0].toString()));
      print("currentDate==>>${DateConverter.formatDate(DateTime.parse(results[0].toString()))}");
    });
  }
  List<String> weekList=[
    "SUN",
    "MON",
    "TUE",
    "WED",
    "THU",
    "FRI",
    "SAT",
  ];

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
}
class Remander{
  String? time;
  String? messages;
  Remander({this.time,this.messages});
}
