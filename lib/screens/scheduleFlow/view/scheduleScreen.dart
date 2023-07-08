import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonDrower.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/addShiftScreenMain.dart';
import 'package:instacare/screens/dashBoardFlow/view/schedulefilterScreen.dart';
import 'package:instacare/screens/scheduleFlow/controller/scheduleController.dart';

import '../../../Utils/interText.dart';
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final scheduleController=Get.put(ScheduleController());
  final cx=Get.put(CommonController());
  final globalKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      key:globalKey ,
      body: Stack(
        children: [
          ListView(
            children: [
              // SizedBox(
              //   height: 140,
              //   child: ListView(
              //     physics: NeverScrollableScrollPhysics(),
              //     children: [
              //       EventCalendar(
              //         calendarType:  CalendarType.GREGORIAN,
              //         calendarLanguage: "en",
              //         showEvents: false,
              //         showLoadingForEvent: false,
              //         calendarOptions: CalendarOptions(
              //           headerMonthBackColor:AppColors.backGroundColor,
              //           viewType: ViewType.DAILY,
              //         ),
              //         onChangeDateTime: (value){
              //           print(value);
              //         },
              //         headerOptions:HeaderOptions(
              //           monthStringType: MonthStringTypes.FULL,
              //           weekDayStringType: WeekDayStringTypes.SHORT,
              //         ) ,
              //         dayOptions:DayOptions(
              //           selectedBackgroundColor: AppColors.yallow,
              //           showWeekDay: true,
              //           compactMode: true,
              //           unselectedBackgroundColor: AppColors.white,
              //           selectedTextColor: AppColors.black,
              //           weekDaySelectedColor: AppColors.yallow,
              //           unselectedTextColor: AppColors.hintTextGrey,
              //         ) ,
              //         events: null,
              //       ),
              //     ],
              //   ),
              // ),
              ListView.builder(
                padding: EdgeInsets.only(
                  top: 8,
                  right: 10,
                  left: 10
                ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listItem.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          listItem[index].checkValue=!listItem[index].checkValue;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: cx.width,
                        height: cx.height/9,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 20),
                                  height: cx.height,
                                  width: cx.width /20,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                      color: AppColors.greenDark),
                                ),
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    width: 20,
                                    height: 20,
                                    child: Checkbox(
                                        value: listItem[index].checkValue,
                                        shape: const CircleBorder(),
                                        activeColor: AppColors.buttonColor,
                                        onChanged: (val){
                                          setState(() {
                                            listItem[index].checkValue=val!;
                                          });
                                        }
                                    )
                                  ),
                                ),
                              ],
                            ),
                            Gap(20.w),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        InterText(
                                          text: listItem[index].position,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: AppColors.black,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: InterText(
                                            text: "7:00AM - 3:00PM",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: AppColors.hintTextGrey,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(width: 4,),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        InterText(
                                          text: listItem[index].center,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                        Row(
                                          children: [
                                             Image.asset(AppAssets.userImage),
                                            SizedBox(width: 4,),
                                             Image.asset(AppAssets.watch),

                                            SizedBox(width: 4,),
                                             Container(
                                              height: 16,
                                              width: 15,
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    126, 230, 155, 1),
                                              ),
                                            ),
                                             Container(
                                              height: 16,
                                              width: 15,
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 3,
                                                  color: const Color.fromRGBO(
                                                      243, 48, 71, 1),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 4,),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              Gap(cx.height/7)
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 10,right: 50),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       GestureDetector(
          //           child: Image.asset(AppAssets.filtetr),
          //         onTap: (){
          //           toPushNavigator(context: context,PageName: ScheduleFilterScreen());
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(left: 8, bottom: 10),
        width: cx.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 16,
                  width: 15,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Color.fromRGBO(243, 48, 71, 1),
                    ),
                  ),
                ),
                MontserratText(
                  text: "Open",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 16,
                  width: 15,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(126, 230, 155, 1),
                  ),
                ),
                MontserratText(
                  text: "Assigned",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                )
              ],
            ),
            Row(
              children: [
                Image.asset(AppAssets.flag),
                Gap(8),
                MontserratText(
                  text: "Incentive",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.verified_user,
                    color: Color.fromRGBO(126, 230, 155, 1)),
                MontserratText(
                  text: "Assigned",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Color.fromRGBO(243, 48, 71, 1),
              onPressed: () {
                CommonBottonSheet(
                  context: context,
                  childView:ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      MontserratText(
                        text: "Schedule",
                        color: AppColors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MontserratText(
                        text: "Confirmation",
                        color: AppColors.redColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      InterText(
                        text: "Do you really want to Delete shift(s)?",
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: AppColors.black,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: CommonButton(
                                text: "Yes",
                                onTap: (){},
                                color: AppColors.redColor,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Expanded(
                              child: CommonButton(
                                text: "No, Go Back",
                                onTap: (){
                                  onBack(context);
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ) ,

                );
              },
              child: Image.asset(AppAssets.delete),
            ),
            Gap(10),
            FloatingActionButton(
              backgroundColor: AppColors.yallow,
              onPressed: () {
                toPushNavigator(context: context,PageName: const AddShiftScreen());
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
  List<OpenShift> listItem = [
    OpenShift(
      position: "2 positions",
      center: "Care Center",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Elevate Care",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Elevate Care North Branch ",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Care Center",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Elevate Care",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Elevate Care North Branch ",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Care Center",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Elevate Care",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Elevate Care North Branch ",
      checkValue: false,
    ),
  ];
}
class OpenShift {
  String? position;
  String? center;
  bool checkValue;
  OpenShift({this.position, this.center, this.checkValue=false});
}
