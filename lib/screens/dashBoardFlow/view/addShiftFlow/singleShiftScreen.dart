import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:get/get.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:instacare/screens/dashBoardFlow/controller/openShiftsScreenController.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/controller/singleShiftController.dart';
import 'package:intl/intl.dart';

class SingleShiftScreen extends StatefulWidget {
  const SingleShiftScreen({Key? key}) : super(key: key);

  @override
  State<SingleShiftScreen> createState() => _SingleShiftScreenState();
}

class _SingleShiftScreenState extends State<SingleShiftScreen> {
  final cx = Get.put(CommonController());
  final singleShiftController = Get.put(SingleShiftController());

  DateTime currentDateTime=DateTime.now();
  @override
  Widget build(BuildContext context) {
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
            Gap(10),
            Obx(() => InkWell(
              onTap: () {
                singleShiftController.popUpFacilityKey.currentState!.showButtonMenu();
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
                      text: singleShiftController.selectFacilityValue.value,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    PopupMenuButton<String>(
                      key: singleShiftController.popUpFacilityKey,
                      itemBuilder: (context) {
                        return singleShiftController.selectFacility.map((str) {
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
                      color: AppColors.backGroundColor,
                      onSelected: (v) {
                        singleShiftController.selectFacilityValue.value = v;
                      },
                    ),
                  ],
                ),
              ),
            ),),
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
            Gap(10),
            Obx(() => InkWell(
              onTap: () {
                singleShiftController.popUpRoleKey.currentState!.showButtonMenu();
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
                      text: singleShiftController.selectRoleValue.value,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    PopupMenuButton<String>(
                      key: singleShiftController.popUpRoleKey,
                      itemBuilder: (context) {
                        return singleShiftController.selectRole.map((str) {
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
                      color: AppColors.backGroundColor,
                      onSelected: (v) {
                        singleShiftController.selectRoleValue.value = v;
                      },
                    ),
                  ],
                ),
              ),
            ),),
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
            Gap(10),
            Obx(() => InkWell(
              onTap: () {
                singleShiftController.popUpNumberKey.currentState!.showButtonMenu();
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
                      text: singleShiftController.selectNumberValue.value,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    PopupMenuButton<String>(
                      key: singleShiftController.popUpNumberKey,
                      itemBuilder: (context) {
                        return singleShiftController.selectNumber.map((str) {
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
                      color: AppColors.backGroundColor,
                      onSelected: (v) {
                        singleShiftController.selectNumberValue.value = v;
                      },
                    ),
                  ],
                ),
              ),
            ),),
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
                  onTap: (){
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
                      text: selectedDate==null?DateConverter.dateMonthYear(currentDateTime):selectedDate.toString(),
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
              itemBuilder: (context,index){
                return Row(
                  children: [
                    Expanded(
                      flex:0,
                      child: Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          shape:   CircleBorder(),
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
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                );
              }
            ),
            const Gap(10),
            const Gap(10),
            Row(

              children: [
                InterText(
                  text: "Start Time",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InterText(
                      text: "End Time",
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 0,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:BorderRadius.circular(30)
                        ),
                        child:Row(
                          children: [
                            PopupMenuButton<String>(
                              itemBuilder: (context) {
                                return singleShiftController.timeData.map((str) {
                                  return PopupMenuItem(
                                    value: str,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                              icon: Image.asset(AppAssets.dropDown,width: 2,height: 2),
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
                      Gap(10),
                      Container(

                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:BorderRadius.circular(30)
                        ),
                        child:Row(
                          children: [
                            InterText(
                              text: singleShiftController.setTimeZone.value,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            PopupMenuButton<String>(
                              itemBuilder: (context) {
                                return singleShiftController.timeZone.map((str) {
                                  return PopupMenuItem(
                                    value: str,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                              icon: Image.asset(AppAssets.dropDown,),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
                              color: AppColors.backGroundColor,
                              onSelected: (v) {
                                singleShiftController.setTimeZone.value = v;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(10),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:BorderRadius.circular(30)
                        ),
                        child:Row(
                          children: [
                            PopupMenuButton<String>(
                              itemBuilder: (context) {
                                return singleShiftController.timeData.map((str) {
                                  return PopupMenuItem(
                                    value: str,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                              icon: Image.asset(AppAssets.dropDown,width: 2,height: 2),
                              color: AppColors.backGroundColor,
                              onSelected: (v) {
                                singleShiftController.setTime.value = v;
                              },
                            ),
                            InterText(
                              text: singleShiftController.setTime.value,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:BorderRadius.circular(30)
                        ),
                        child:Row(
                          children: [
                            InterText(
                              text: singleShiftController.setTimeZone.value,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            PopupMenuButton<String>(
                              key: singleShiftController.popUpRoleKey,
                              itemBuilder: (context) {
                                return singleShiftController.timeZone.map((str) {
                                  return PopupMenuItem(
                                    value: str,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                                  borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
                              color: AppColors.backGroundColor,
                              onSelected: (v) {
                                singleShiftController.setTimeZone.value = v;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Gap(10),
            Row(
              children: [
                InterText(
                  text: "",
                ),
                InterText(
                  text: "",
                )
              ],
            )
          ],
        )
      ],
    );
  }
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
        selectedDayHighlightColor: AppColors.blue,
        currentDate: DateTime.now(),
        dayTextStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: const Color.fromRGBO(2, 5, 10, 1)
        ),
        lastDate: DateTime.now(),
      ),
      dialogSize: const Size(325, 400),
      //initialValue: rangeDatePickerValueWithDefaultValue,
      borderRadius: BorderRadius.circular(15),
    ));
    setState(() {
      selectedDate=DateConverter.dateMonthYear(DateTime.parse(results![0].toString()));
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
  List<TimeShift> timeData=[
    TimeShift(
      timeShift:"Morning Shift:  7:00AM - 3:00PM",
      checkValue: false,
    ),
    TimeShift(
      timeShift:"Noon Shift:  3:00PM - 11:00PM",
      checkValue: false,
    ),
    TimeShift(
      timeShift:"Night Shift:  11:00PM - 7:00AM",
      checkValue: false,
    ),
    TimeShift(
      timeShift:"Custom",
      checkValue: false,
    ),
  ];
}

class TimeShift{
  String? timeShift;
  bool? checkValue;

  TimeShift({this.timeShift,this.checkValue});
}
