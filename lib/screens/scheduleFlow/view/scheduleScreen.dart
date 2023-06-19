import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
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
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: cx.width,
                      height: cx.height / 8,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(left: 32),
                            height: cx.height,
                            width: cx.width / 10,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                color: AppColors.greenDark),
                            child:  Checkbox(
                              shape: const CircleBorder(),
                              value: listItem[index].checkValue,
                              activeColor: AppColors.buttonColor,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  listItem[index].checkValue = newValue!;
                                });
                              },
                            )
                          ),
                          Gap(20.w),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: InterText(
                                          text: listItem[index].center,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
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
                                          )
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
              onPressed: () {},
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
  bool? checkValue;
  OpenShift({this.position, this.center, this.checkValue});
}
