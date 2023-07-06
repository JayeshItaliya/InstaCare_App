import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonDropDown.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:get/get.dart';
import 'package:instacare/helper/date_conveter.dart';

import 'controller/recurringShiftController.dart';
class RecurringShiftsScreen extends StatefulWidget {
  const RecurringShiftsScreen({Key? key}) : super(key: key);

  @override
  State<RecurringShiftsScreen> createState() => _RecurringShiftsScreenState();
}

class _RecurringShiftsScreenState extends State<RecurringShiftsScreen> {
  final recurringShiftController=Get.put(RecurringShiftController());
  final cx=Get.put(CommonController());
  String _verticalGroupValue = "Pending";
  String? selectedDate;
  DateTime currentDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
     Reponsive_.init(context);
    return ListView(
      padding: padding,
      children: [
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
              child: InterText(
                text: "Facility",
                fontSize: Reponsive_.px16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength/80,
            ),
            CommonDropDown(
                context: context,
                list: recurringShiftController.selectFacility,
                mycontrollerValue: recurringShiftController.selectFacilityValue,
                //padding: EdgeInsets.zero,
              color: AppColors.white
            )
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
              child: InterText(
                text: "Role",
                fontSize: Reponsive_.px16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength/80,
            ),
            CommonDropDown(
                context: context,
                list: recurringShiftController.selectRole,
                mycontrollerValue: recurringShiftController.selectRoleValue,
               // padding: EdgeInsets.zero,
                color: AppColors.white
            ),
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
              child: InterText(
                text: "Number of Positions",
                fontSize: Reponsive_.px16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 10,),
            CommonDropDown(
                context: context,
                list: recurringShiftController.selectNumber,
                mycontrollerValue: recurringShiftController.selectNumberValue,
              // padding: EdgeInsets.zero
                color: AppColors.white
            ),
          ],
        ),
        SizedBox(height: 15,),
        Padding(
          padding: EdgeInsets.only(left: Reponsive_.crosslength/60,),
          child: InterText(
            text: "Select Recurring Days",
            fontSize: Reponsive_.px16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        SizedBox(
          height:Reponsive_.crosslength/80 ,
        ),
        SizedBox(
          height: Reponsive_.crosslength/9.5,
          child: ListView.builder(
            itemCount: weekDayList.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              WeekDay weekDay=weekDayList[index];
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 8,right: 8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        shape: CircleBorder(),
                        value: weekDay.dayValue,
                        activeColor: AppColors.buttonColor,
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: AppColors.buttonColor),
                        ),
                        onChanged: (bool? newValue) {
                          setState(() {
                            weekDay.dayValue = newValue!;
                            if(weekDay.dayValue==true){
                              recurringShiftController.selectDayName.value=weekDay.dayName!;
                              print(recurringShiftController.selectDayName.value);
                            }
                          });
                        },
                      ),
                    ),
                    GestureDetector(
                      child: InterText(
                        text: weekDay.dayName,
                        fontWeight: FontWeight.w400,
                        fontSize: Reponsive_.px18,
                        color: AppColors.hintTextGrey,
                      ),
                      onTap: (){
                        setState(() {
                          weekDay.dayValue = !weekDay.dayValue!;
                          if(weekDay.dayValue==true){
                            recurringShiftController.selectDayName.value=weekDay.dayName!;
                            print(recurringShiftController.selectDayName.value);
                          }
                        });
                      },
                    ),
                  ],
                ),
              );
            }
          ),
        ),

        SizedBox(
          height: 10,
        ),

        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
              child: InterText(
                text: "Date",
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px16,
                color: AppColors.black,
              ),
            ),
            SizedBox(width: Reponsive_.crosslength/6,),
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength/100),
              child: InterText(
                text: "Duration",
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px16,
                color: AppColors.black,
              ),
            )
          ],
        ),
        Gap(10),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                 DateConverter.RangeDatePicker(
                   context: context,
                   dateRang: false,
                   monthType: false,
                   dateType: true
                 ).then((value){
                   setState(() {
                     selectedDate=value;
                     print(selectedDate);
                   });
                 });
                },
                child: Container(
                  width: Reponsive_.crosslength/10,
                  height: Reponsive_.crosslength/20,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterText(
                        text: selectedDate == null
                            ? DateConverter.dateMonthYear(currentDateTime)
                            : selectedDate.toString(),
                        fontSize: Reponsive_.px16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(AppAssets.dropDown),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            SizedBox(
              width: Reponsive_.crosslength/5.5,
              height: Reponsive_.crosslength/20,
              child: CommonDropDown(context: context,
                list: recurringShiftController.durationList,
                mycontrollerValue: recurringShiftController.durationValue,
                color: AppColors.white
              ),
            )
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
              child: InterText(
                text: "Shift Time",
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px16,
              ),
            ),
            ListView.builder(
                itemCount: timeData.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            shape: CircleBorder(),
                            value: timeData[index].checkValue,
                            activeColor: AppColors.buttonColor,
                            side: MaterialStateBorderSide.resolveWith(
                                  (states) => BorderSide(width: 1.0, color: AppColors.buttonColor),
                            ),
                            onChanged: (bool? newValue) {
                              setState(() {
                                timeData[index].checkValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: InterText(
                            text: timeData[index].timeShift,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: AppColors.black,
                          ),
                          onTap: (){
                            setState(() {
                              timeData[index].checkValue=!timeData[index].checkValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  );
                }),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
                    child: InterText(
                      text: "Start Time",
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: InterText(
                    text: "End Time",
                    fontSize: Reponsive_.px16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                )
              ],
            ),
            const Gap(10),
            SizedBox(
              width: Reponsive_.w,
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: CommonDropDown(
                            context: context,
                            list: recurringShiftController.timeData,
                            mycontrollerValue: recurringShiftController.setTime,
                            color: AppColors.white
                        ),
                      ),
                      SizedBox(width: 8,),
                      SizedBox(
                        width: Reponsive_.crosslength/10,
                        height: Reponsive_.crosslength/20,
                        child: CommonDropDown(
                            context: context,
                            list: recurringShiftController.timeZone,
                            mycontrollerValue: recurringShiftController.setTimeZone,
                            color: AppColors.white
                        ),
                      ),
                      SizedBox(width: 8,),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: CommonDropDown(
                            context: context,
                            list: recurringShiftController.timeData,
                            mycontrollerValue: recurringShiftController.setTime,
                            color: AppColors.white
                        ),
                      ),
                      SizedBox(width: 8,),
                      SizedBox(
                        width: Reponsive_.crosslength/10,
                        height: Reponsive_.crosslength/20,
                        child: CommonDropDown(
                            context: context,
                            list: recurringShiftController.timeZone,
                            mycontrollerValue: recurringShiftController.setTimeZone,
                            color: AppColors.white
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
                        child: InterText(
                          text: "Rate (per hour)",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(height: Reponsive_.crosslength/80,),
                      SizedBox(
                        width: Reponsive_.crosslength/5.5,
                        height: Reponsive_.crosslength/20,
                        child: AppWidget().getTextField(
                            hintText: "\$45",
                            filledColor: AppColors.white
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
                        child: InterText(
                          text: "Cancellation Guarantee",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(height: Reponsive_.crosslength/80,),
                      Row(
                        children: [
                          Theme(
                            data: ThemeData(unselectedWidgetColor: AppColors.buttonColor),
                            child: Radio(
                              value: BestTutorSite.javatpoint,
                              groupValue: _site,

                              activeColor: AppColors.buttonColor,
                              onChanged: (BestTutorSite? value) {
                                setState(() {
                                  _site = value!;
                                });
                              },
                            ),
                          ),
                          InterText(
                            text: "Yes",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                          Theme(
                            data: ThemeData(unselectedWidgetColor: AppColors.buttonColor),
                            child: Radio(
                              value: BestTutorSite.tutorialandexample,
                              groupValue: _site,
                              activeColor: AppColors.buttonColor,
                              onChanged: (BestTutorSite? value) {
                                setState(() {
                                  _site = value!;
                                });
                              },
                            ),
                          ),
                          InterText(
                            text: "NO",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
                        child: InterText(
                          text: "Incentives",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(height: Reponsive_.crosslength/80,),
                      Row(
                        children: [
                          Theme(
                            data: ThemeData(unselectedWidgetColor: AppColors.buttonColor),
                            child: Radio(
                              value: BestTutorSite.javatpoint,
                              groupValue: _site,
                              activeColor: AppColors.buttonColor,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              onChanged: (BestTutorSite? value) {
                                setState(() {
                                  _site = value!;
                                });
                              },
                            ),
                          ),
                          InterText(
                            text: "Yes",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                          Theme(
                            data: ThemeData(unselectedWidgetColor: AppColors.buttonColor),
                            child: Radio(
                              value: BestTutorSite.tutorialandexample,
                              groupValue: _site,
                              activeColor: AppColors.buttonColor,
                              onChanged: (BestTutorSite? value) {
                                setState(() {
                                  _site = value!;
                                });
                              },
                            ),
                          ),
                          InterText(
                            text: "NO",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
                        child: InterText(
                          text: "Incentive By",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(height: Reponsive_.crosslength/80,),
                      SizedBox(
                        width: Reponsive_.crosslength/5.5,
                        height: Reponsive_.crosslength/20,
                        child: CommonDropDown(
                          context: context,
                          list: recurringShiftController.incentiveByList,
                          mycontrollerValue: recurringShiftController.incentiveByValue,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
                        child: InterText(
                          text: "Incentive Type",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(height: Reponsive_.crosslength/80,),
                      Row(
                        children: [
                          Theme(
                            data: ThemeData(unselectedWidgetColor: AppColors.buttonColor),
                            child: Radio(
                              value: BestTutorSite.javatpoint,
                              groupValue: _site,
                              activeColor: AppColors.buttonColor,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              onChanged: (BestTutorSite? value) {
                                setState(() {
                                  _site = value!;
                                });
                              },
                            ),
                          ),
                          InterText(
                            text: "Yes",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                          Theme(
                            data: ThemeData(unselectedWidgetColor: AppColors.buttonColor),
                            child: Radio(
                              value: BestTutorSite.tutorialandexample,
                              groupValue: _site,
                              activeColor: AppColors.buttonColor,
                              onChanged: (BestTutorSite? value) {
                                setState(() {
                                  _site = value!;
                                });
                              },
                            ),
                          ),
                          InterText(
                            text: "NO",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
                        child: InterText(
                          text: "Incentive Amount",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/45,
                      ),
                      SizedBox(
                        width: Reponsive_.crosslength/5.5,
                        height: Reponsive_.crosslength/20,
                        child: CommonDropDown(
                          context: context,
                          list: recurringShiftController.incentiveByList,
                          mycontrollerValue: recurringShiftController.incentiveByValue,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
                        child: InterText(
                          text: "Floor Number",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/80,
                      ),
                      SizedBox(
                        width: Reponsive_.crosslength/5.5,
                        height: Reponsive_.crosslength/20,
                        child: CommonDropDown(
                          context: context,
                          list: recurringShiftController.incentiveByList,
                          mycontrollerValue: recurringShiftController.incentiveByValue,
                          color: AppColors.white,

                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
                        child: InterText(
                          text: "Supervisor",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/80,
                      ),
                      SizedBox(
                        width: Reponsive_.crosslength/5.5,
                        height: Reponsive_.crosslength/20,
                        child: CommonDropDown(
                          context: context,
                          list: recurringShiftController.incentiveByList,
                          mycontrollerValue: recurringShiftController.incentiveByValue,
                          color: AppColors.white,

                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength/60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InterText(
                    text: "Notes",
                    fontWeight: FontWeight.w600,
                    fontSize: Reponsive_.px16,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            AppWidget().getTextField(
                filledColor: AppColors.white,
                maxLine: 5
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: "PUBLISH",
                    onTap: (){},
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: CommonButton(
                    text: "ASSIGN",
                    onTap: (){},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        )
      ],
    );
  }

  BestTutorSite _site = BestTutorSite.javatpoint;
  final _status = [
    "Yes",
    "No",
  ];

  List<WeekDay> weekDayList=[
    WeekDay(
      dayName: "Mon",
      dayValue: false,
    ),
    WeekDay(
      dayName: "Tue",
      dayValue: false,
    ),
    WeekDay(
      dayName: "Wed",
      dayValue: false,
    ),
    WeekDay(
      dayName: "Thu",
      dayValue: false,
    ),
    WeekDay(
      dayName: "Fri",
      dayValue: false,
    ),
    WeekDay(
      dayName: "Sat",
      dayValue: false,
    ),
    WeekDay(
      dayName: "Sun",
      dayValue: false,
    ),
  ];
  List<TimeShift> timeData = [
    TimeShift(
      timeShift: "Morning Shift:  7:00AM - 3:00PM",
      checkValue: false,
    ),
    TimeShift(
      timeShift: "Noon Shift:  3:00PM - 11:00PM",
      checkValue: false,
    ),
    TimeShift(
      timeShift: "Night Shift:  11:00PM - 7:00AM",
      checkValue: false,
    ),
    TimeShift(
      timeShift: "Custom",
      checkValue: false,
    ),
  ];
}

class WeekDay{
  String? dayName;
  bool?   dayValue;

  WeekDay({this.dayName,this.dayValue});
}
class TimeShift {
  String? timeShift;
  bool? checkValue;

  TimeShift({this.timeShift, this.checkValue});
}
enum BestTutorSite { javatpoint, w3schools, tutorialandexample }
