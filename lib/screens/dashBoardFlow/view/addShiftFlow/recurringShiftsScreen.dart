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
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonDropDown.dart';
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
            InterText(
              text: "Facility",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            CommonDropDown(
                context: context,
                list: recurringShiftController.selectFacility,
                mycontrollerValue: recurringShiftController.selectFacilityValue,
                padding: EdgeInsets.zero
            )
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InterText(
              text: "Role",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            CommonDropDown(
                context: context,
                list: recurringShiftController.selectRole,
                mycontrollerValue: recurringShiftController.selectRoleValue,
                padding: EdgeInsets.zero
            ),
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InterText(
              text: "Number of Positions",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            CommonDropDown(
                context: context,
                list: recurringShiftController.selectNumber,
                mycontrollerValue: recurringShiftController.selectNumberValue,
              padding: EdgeInsets.zero
            ),
          ],
        ),
        SizedBox(height: 15,),
        InterText(
          text: "Select Recurring Days",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),

        SizedBox(
          width: cx.width,
          height: 120,
          child: ListView.builder(
            itemCount: weekDayList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              WeekDay weekDay=weekDayList[index];
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                width: 80,
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
                    InterText(
                      text: weekDay.dayName,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColors.hintTextGrey,
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
            InterText(
              text: "Date",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.black,
            ),
            SizedBox(width: Reponsive_.crosslength/6,),
            InterText(
              text: "Duration",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.black,
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
                 ).then((value){
                   setState(() {
                     selectedDate=value;
                   });
                 });
                },
                child: Container(
                  width: cx.width/2,

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
                        fontSize: 16,
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
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
                child:Obx(
                      () => InkWell(
                    onTap: () {
                      recurringShiftController.durationKey.currentState!
                          .showButtonMenu();
                    },
                    child: Container(
                      width: cx.width,
                      height: cx.height / 12,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: recurringShiftController.durationValue.value,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          PopupMenuButton<String>(
                            key: recurringShiftController.durationKey,
                            itemBuilder: (context) {
                              return recurringShiftController.durationList.map((str) {
                                return PopupMenuItem(
                                  value: str,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Gap(10.w),
                                      InterText(
                                        text: str.toString(),
                                        color: AppColors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList();
                            },
                            icon: Image.asset(AppAssets.dropDown),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r))),
                            color: AppColors.backGroundColor,
                            onSelected: (v) {
                              recurringShiftController.durationValue.value = v;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InterText(
              text: "Shift Time",
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
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
                            onChanged: (bool? newValue) {
                              setState(() {
                                timeData[index].checkValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: InterText(
                          text: timeData[index].timeShift,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  );
                }),
            const Gap(10),
            Row(
              children: [
                InterText(
                  text: "Start Time",
                ),
                SizedBox(width: Reponsive_.crosslength/11,),
                InterText(
                  text: "End Time",
                )
              ],
            ),
            const Gap(10),
            SizedBox(
              width: cx.width,
              height: 50,
              child: Obx(() => ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          PopupMenuButton<String>(
                            key: recurringShiftController.startTime,
                            itemBuilder: (context) {
                              return recurringShiftController.timeData
                                  .map((str) {
                                return PopupMenuItem(
                                  value: str,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: <Widget>[
                                      InterText(
                                        text: str.toString(),
                                        color: AppColors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList();
                            },
                            padding: EdgeInsets.zero,
                            icon: Image.asset(AppAssets.dropDown,
                                width: 2, height: 2),
                            color: AppColors.backGroundColor,
                            onSelected: (v) {
                              recurringShiftController.setTime.value = v;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: InterText(
                              text: recurringShiftController.setTime.value,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      recurringShiftController.startTime.currentState!
                          .showButtonMenu();
                    },
                  ),
                  Gap(10),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InterText(
                              text: recurringShiftController.setTimeZone.value,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          PopupMenuButton<String>(
                            key: recurringShiftController.startTimeZone,
                            itemBuilder: (context) {
                              return recurringShiftController.timeZone
                                  .map((str) {
                                return PopupMenuItem(
                                  value: str,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: <Widget>[
                                      InterText(
                                        text: str.toString(),
                                        color: AppColors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList();
                            },
                            padding: EdgeInsets.zero,
                            icon: Image.asset(
                              AppAssets.dropDown,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0.r))),
                            color: AppColors.backGroundColor,
                            onSelected: (v) {
                              recurringShiftController.setTimeZone.value = v;
                            },
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      recurringShiftController.startTimeZone.currentState!
                          .showButtonMenu();
                    },
                  ),
                  Gap(10),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          PopupMenuButton<String>(
                            key: recurringShiftController.endTime,
                            itemBuilder: (context) {
                              return recurringShiftController.timeData
                                  .map((str) {
                                return PopupMenuItem(
                                  value: str,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: <Widget>[
                                      InterText(
                                        text: str.toString(),
                                        color: AppColors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList();
                            },
                            padding: EdgeInsets.zero,
                            icon: Image.asset(AppAssets.dropDown,
                                width: 2, height: 2),
                            color: AppColors.backGroundColor,
                            onSelected: (v) {
                              recurringShiftController.setTime.value = v;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: InterText(
                              text: recurringShiftController.setTime.value,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      recurringShiftController.endTime.currentState!
                          .showButtonMenu();
                    },
                  ),
                  Gap(10),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InterText(
                              text: recurringShiftController.setTimeZone.value,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          PopupMenuButton<String>(
                            key: recurringShiftController.endTimeZone,
                            itemBuilder: (context) {
                              return recurringShiftController.timeZone
                                  .map((str) {
                                return PopupMenuItem(
                                  value: str,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: <Widget>[
                                      InterText(
                                        text: str.toString(),
                                        color: AppColors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList();
                            },
                            padding: EdgeInsets.zero,
                            iconSize: 2,
                            icon: Image.asset(AppAssets.dropDown),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0.r))),
                            color: AppColors.backGroundColor,
                            onSelected: (v) {
                              recurringShiftController.setTimeZone.value = v;
                            },
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      recurringShiftController.endTimeZone.currentState!
                          .showButtonMenu();
                    },
                  ),
                ],
              )),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InterText(
                  text: "Rate (per hour)",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                ),
                InterText(
                  text: "Cancellation Guarantee",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                )
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 80,
                    height: 50,
                    margin: EdgeInsets.only(left: 12),
                    padding: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextFormField(
                      controller: recurringShiftController.rateController.value,
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: cx.width / 30,
                ),
                Expanded(
                  flex: 0,
                  child: Row(
                    children: [
                      SizedBox(
                        width: cx.width / 2,
                        height: 50,
                        child: Transform.scale(
                          scale: 1,
                          child: RadioGroup<String>.builder(
                            direction: Axis.horizontal,
                            groupValue: _verticalGroupValue,
                            onChanged: (value) => setState(() {
                              _verticalGroupValue = value ?? '';
                            }),
                            items: _status,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            fillColor: AppColors.buttonColor,
                            horizontalAlignment: MainAxisAlignment.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Gap(10),
            Row(
              children: [
                InterText(
                  text: "Incentives",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                ),
                SizedBox(width: Reponsive_.crosslength/10,),
                InterText(
                  text: "Incentive By",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 0,
                  child: Row(
                    children: [
                      SizedBox(
                        width: cx.width / 2.5,
                        height: 50,
                        child: Transform.scale(
                          scale: 1,
                          child: RadioGroup<String>.builder(
                            direction: Axis.horizontal,
                            groupValue: _verticalGroupValue,
                            onChanged: (value) => setState(() {
                              _verticalGroupValue = value ?? '';
                            }),
                            items: _status,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            fillColor: AppColors.buttonColor,
                            horizontalAlignment: MainAxisAlignment.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() => InkWell(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InterText(
                              text: recurringShiftController
                                  .incentiveByValue.value,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          PopupMenuButton<String>(
                            key: recurringShiftController.incentiveBy,
                            itemBuilder: (context) {
                              return recurringShiftController.incentiveByList
                                  .map((str) {
                                return PopupMenuItem(
                                  value: str,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: <Widget>[
                                      InterText(
                                        text: str.toString(),
                                        color: AppColors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList();
                            },
                            padding: EdgeInsets.zero,
                            iconSize: 2,
                            icon: Image.asset(AppAssets.dropDown),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0.r))),
                            color: AppColors.backGroundColor,
                            onSelected: (v) {
                              recurringShiftController.incentiveByValue.value =
                                  v;
                            },
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      recurringShiftController.incentiveBy.currentState!
                          .showButtonMenu();
                    },
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(

              children: [
                InterText(
                  text: "Incentive Type",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                ),
                SizedBox(width: Reponsive_.crosslength/16,),
                InterText(
                  text: "Incentive Amount",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 0,
                  child: Row(
                    children: [
                      SizedBox(
                        width: cx.width / 2,
                        height: 50,
                        child: Transform.scale(
                          scale: 1,
                          child: RadioGroup<String>.builder(
                            direction: Axis.horizontal,
                            groupValue: _verticalGroupValue,
                            onChanged: (value) => setState(() {
                              _verticalGroupValue = value ?? '';
                            }),
                            items: _status,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            fillColor: AppColors.buttonColor,
                            horizontalAlignment: MainAxisAlignment.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: cx.width / 30,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 80,
                    height: 50,

                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextFormField(
                      controller: recurringShiftController.rateController.value,
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InterText(
                  text: "Floor Number",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                ),
                SizedBox(width: Reponsive_.crosslength/12,),
                InterText(
                  text: "Supervisor",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Obx(() => InkWell(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InterText(
                              text: recurringShiftController
                                  .incentiveByValue.value,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          PopupMenuButton<String>(
                            key: recurringShiftController.floorNumberKey,
                            itemBuilder: (context) {
                              return recurringShiftController.incentiveByList
                                  .map((str) {
                                return PopupMenuItem(
                                  value: str,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: <Widget>[
                                      InterText(
                                        text: str.toString(),
                                        color: AppColors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList();
                            },
                            icon: Image.asset(AppAssets.dropDown),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0.r))),
                            color: AppColors.backGroundColor,
                            onSelected: (v) {
                              recurringShiftController.incentiveByValue.value =
                                  v;
                            },
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      recurringShiftController.floorNumberKey.currentState!
                          .showButtonMenu();
                    },
                  )),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Obx(() => InkWell(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InterText(
                              text: recurringShiftController
                                  .incentiveByValue.value,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                          PopupMenuButton<String>(
                            key: recurringShiftController.supervisorKey,
                            itemBuilder: (context) {
                              return recurringShiftController.incentiveByList
                                  .map((str) {
                                return PopupMenuItem(
                                  value: str,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: <Widget>[
                                      InterText(
                                        text: str.toString(),
                                        color: AppColors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList();
                            },
                            icon: Image.asset(AppAssets.dropDown),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0.r))),
                            color: AppColors.backGroundColor,
                            onSelected: (v) {
                              recurringShiftController.incentiveByValue.value =
                                  v;
                            },
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      recurringShiftController.supervisorKey.currentState!
                          .showButtonMenu();
                    },
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InterText(
                    text: "Notes",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: cx.width,
              height: 100,
              margin: EdgeInsets.only(left: 12),
              padding: EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                controller: recurringShiftController.rateController.value,
                maxLines: 10,
                style: GoogleFonts.inter(
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 65,
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: InterText(
                        text: "Publish",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 65,
                    decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: InterText(
                      text: "Assign",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(50),
          ],
        )
      ],
    );
  }


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
