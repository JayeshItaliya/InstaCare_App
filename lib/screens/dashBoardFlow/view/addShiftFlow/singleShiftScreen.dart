import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:get/get.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/controller/singleShiftController.dart';

import '../../../../Utils/CommonDropDown.dart';


class SingleShiftScreen extends StatefulWidget {
  const SingleShiftScreen({Key? key}) : super(key: key);

  @override
  State<SingleShiftScreen> createState() => _SingleShiftScreenState();
}

class _SingleShiftScreenState extends State<SingleShiftScreen> {
  final cx = Get.put(CommonController());
  final singleShiftController = Get.put(SingleShiftController());

  DateTime currentDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return ListView(
      padding: padding,
      shrinkWrap: true,
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
                list: singleShiftController.selectFacility,
                mycontrollerValue: singleShiftController.selectFacilityValue,
                padding: EdgeInsets.zero
            ),
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
                list: singleShiftController.selectRole,
                mycontrollerValue: singleShiftController.selectRoleValue,
                padding: EdgeInsets.zero
            ),
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InterText(
              text: "Number of Positions (Open Shifts)",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            CommonDropDown(
                context: context,
                list: singleShiftController.selectNumber,
                mycontrollerValue: singleShiftController.selectNumberValue,
                padding: EdgeInsets.zero
            ),
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InterText(
              text: "Date",
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            Gap(10),
            InkWell(
              onTap: () {
                rangeDatePicker();
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
                          scale: 1.3,
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
                          fontSize: 17,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  );
                }),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: InterText(
                    text: "Start Time",
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InterText(
                    text: "End Time",
                  ),
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
                                key: singleShiftController.startTime,
                                itemBuilder: (context) {
                                  return singleShiftController.timeData
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
                                  singleShiftController.setTime.value = v;
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: InterText(
                                  text: singleShiftController.setTime.value,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          singleShiftController.startTime.currentState!
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
                                  text: singleShiftController.setTimeZone.value,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                              PopupMenuButton<String>(
                                key: singleShiftController.startTimeZone,
                                itemBuilder: (context) {
                                  return singleShiftController.timeZone
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
                                  singleShiftController.setTimeZone.value = v;
                                },
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          singleShiftController.startTimeZone.currentState!
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
                                key: singleShiftController.endTime,
                                itemBuilder: (context) {
                                  return singleShiftController.timeData
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
                                  singleShiftController.setTime.value = v;
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: InterText(
                                  text: singleShiftController.setTime.value,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          singleShiftController.endTime.currentState!
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
                                  text: singleShiftController.setTimeZone.value,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                              PopupMenuButton<String>(
                                key: singleShiftController.endTimeZone,
                                itemBuilder: (context) {
                                  return singleShiftController.timeZone
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
                                  singleShiftController.setTimeZone.value = v;
                                },
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          singleShiftController.endTimeZone.currentState!
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
                      controller: singleShiftController.rateController.value,
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
                SizedBox(width: Reponsive_.crosslength/9,),
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
                        width: Reponsive_.crosslength/4.5,
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
                              InterText(
                                text: singleShiftController
                                    .incentiveByValue.value,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                              PopupMenuButton<String>(
                                key: singleShiftController.incentiveBy,
                                itemBuilder: (context) {
                                  return singleShiftController.incentiveByList
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
                                  singleShiftController.incentiveByValue.value =
                                      v;
                                },
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          singleShiftController.incentiveBy.currentState!
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
                SizedBox(width: Reponsive_.crosslength/15,),
                InterText(
                  text: "Incentive Amount",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                )
              ],
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
                    padding: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: TextFormField(
                      controller: singleShiftController.rateController.value,
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
                                  text: singleShiftController
                                      .incentiveByValue.value,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                              PopupMenuButton<String>(
                                key: singleShiftController.floorNumberKey,
                                itemBuilder: (context) {
                                  return singleShiftController.incentiveByList
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
                                  singleShiftController.incentiveByValue.value =
                                      v;
                                },
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          singleShiftController.floorNumberKey.currentState!
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
                                  text: singleShiftController
                                      .incentiveByValue.value,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                              PopupMenuButton<String>(
                                key: singleShiftController.supervisorKey,
                                itemBuilder: (context) {
                                  return singleShiftController.incentiveByList
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
                                  singleShiftController.incentiveByValue.value =
                                      v;
                                },
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          singleShiftController.supervisorKey.currentState!
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
                controller: singleShiftController.rateController.value,
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

  String? selectedDate;
  final _status = [
    "Yes",
    "No",
  ];
  String _verticalGroupValue = "Pending";
  rangeDatePicker() async {
    var results = (await showCalendarDatePicker2Dialog(
      context: context,
      dialogBackgroundColor: AppColors.backGroundColor,
      barrierDismissible: false,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
        weekdayLabels: weekList,
        centerAlignModePicker: true,
        dayBorderRadius: BorderRadius.circular(20),
        selectedDayTextStyle: TextStyle(color: AppColors.white),
        selectedDayHighlightColor: AppColors.blue,
        currentDate: DateTime.now(),
        dayTextStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: const Color.fromRGBO(2, 5, 10, 1)),
        lastDate: DateTime.now(),
      ),
      dialogSize: const Size(325, 400),
      //initialValue: rangeDatePickerValueWithDefaultValue,
      borderRadius: BorderRadius.circular(15),
    ));
    setState(() {
      selectedDate =
          DateConverter.dateMonthYear(DateTime.parse(results![0].toString()));
      print(
          "currentDate==>>${DateConverter.formatDate(DateTime.parse(results[0].toString()))}");
    });
  }

  List<String> weekList = [
    "SUN",
    "MON",
    "TUE",
    "WED",
    "THU",
    "FRI",
    "SAT",
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

class TimeShift {
  String? timeShift;
  bool? checkValue;

  TimeShift({this.timeShift, this.checkValue});
}
