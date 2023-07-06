import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';

import '../controller/scheduleFilterScreenController.dart';

class ScheduleFilterScreen extends StatefulWidget {
  const ScheduleFilterScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleFilterScreen> createState() => _ScheduleFilterScreenState();
}

class _ScheduleFilterScreenState extends State<ScheduleFilterScreen> {
  final scheduleFilterController = Get.put(ScheduleFilterController());
  final cx = Get.put(CommonController());
  bool selectedShiftMorning = false;
  bool selectedShiftAfternoon = false;
  bool selectedShiftNight = false;
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.02,vertical: Reponsive_.crosslength*0.04),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MontserratText(
                text: "Schedule Filter",
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: AppColors.black,
                textAlign: TextAlign.start,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.hintTextGrey,
                  )
              )
            ],
          ),
          SizedBox(height: Reponsive_.crosslength*0.02,),
          CommonDropDown(
            context: context,
              list: scheduleFilterController.facilities,
              mycontrollerValue: scheduleFilterController.facilitiesValue,
              color: AppColors.backGroundColor
          ),
          Gap(15),
          CommonDropDown(
            context: context,
              list: scheduleFilterController.employeeName,
              mycontrollerValue: scheduleFilterController.employeeNameValue,
              color: AppColors.backGroundColor
          ),
          Gap(15),
          CommonDropDown(
            context: context,
              list: scheduleFilterController.role,
              mycontrollerValue: scheduleFilterController.roleValue,
              color: AppColors.backGroundColor
          ),
          Gap(Reponsive_.crosslength*0.015),
          InterText(
            text: "Shift Time",
            color: AppColors.black,
            fontWeight: FontWeight.w700,
            fontSize: Reponsive_.px18,
          ),
          Gap(15),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: Reponsive_.crosslength*0.01),
                    decoration: BoxDecoration(
                        color: selectedShiftMorning == true
                            ? AppColors.buttonColor
                            : AppColors.greenDark,
                        border: selectedShiftMorning == false
                            ? Border.all(color: AppColors.buttonColor, width: 2)
                            : null,
                        borderRadius: BorderRadius.circular(Reponsive_.crosslength*0.02)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.sun,
                            color: selectedShiftMorning == false
                                ? Color.fromRGBO(126, 209, 230, 1)
                                : null),
                        SizedBox(width: 5,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Morning Shifts",
                              color: selectedShiftMorning == true
                                  ? AppColors.white
                                  : AppColors.buttonColor,
                              fontWeight: FontWeight.w600,
                              fontSize: Reponsive_.crosslength*0.0135,
                            ),
                            InterText(
                              text: "7:00AM - 3:00PM",
                              color: selectedShiftMorning == true
                                  ? AppColors.white
                                  : AppColors.buttonColor,
                              fontWeight: FontWeight.w600,
                              fontSize: Reponsive_.crosslength*0.0135,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedShiftMorning = !selectedShiftMorning;
                    });
                  },
                ),
              ),
              Gap(10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedShiftAfternoon = !selectedShiftAfternoon;
                    });
                  },
                  child: Container(
                   padding: EdgeInsets.symmetric(vertical: Reponsive_.crosslength*0.01),
                    decoration: BoxDecoration(
                        color: selectedShiftAfternoon == true
                            ? AppColors.buttonColor
                            : AppColors.greenDark,
                        border: selectedShiftAfternoon == false
                            ? Border.all(color: AppColors.buttonColor, width: 2)
                            : null,
                        borderRadius: BorderRadius.circular(Reponsive_.crosslength*0.02)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.sun,
                            color: selectedShiftAfternoon == false
                                ? Color.fromRGBO(126, 209, 230, 1)
                                : null),
                        SizedBox(width: 5,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Afternoon Shifts",
                              color: selectedShiftAfternoon == true
                                  ? AppColors.white
                                  : AppColors.buttonColor,
                              fontWeight: FontWeight.w600,
                              fontSize: Reponsive_.crosslength*0.0135,
                            ),
                            InterText(
                              text: "3:00PM - 11:00PM",
                              color: selectedShiftAfternoon == true
                                  ? AppColors.white
                                  : AppColors.buttonColor,
                              fontWeight: FontWeight.w600,
                              fontSize: Reponsive_.crosslength*0.0135,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Gap(Reponsive_.crosslength*0.007),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedShiftNight = !selectedShiftNight;
                    });
                  },
                  child: Container(
                   padding: EdgeInsets.symmetric(vertical: Reponsive_.crosslength*0.01),
                    decoration: BoxDecoration(
                        color: selectedShiftNight == true
                            ? AppColors.buttonColor
                            : AppColors.greenDark,
                        border: selectedShiftNight == false
                            ? Border.all(color: AppColors.buttonColor, width: 2)
                            : null,
                        borderRadius: BorderRadius.circular(Reponsive_.crosslength*0.02)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.night, color: selectedShiftNight == false ? Color.fromRGBO(126, 209, 230, 1) : null),
                        SizedBox(width: 5,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Night Shifts",
                              color: selectedShiftNight == true
                                  ? AppColors.white
                                  : AppColors.buttonColor,
                              fontWeight: FontWeight.w600,
                              fontSize: Reponsive_.crosslength*0.0135,
                            ),
                            InterText(
                              text: "11:00PM - 7:00AM",
                              color: selectedShiftNight == true
                                  ? AppColors.white
                                  : AppColors.buttonColor,
                              fontWeight: FontWeight.w600,
                              fontSize: Reponsive_.crosslength*0.0135,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Gap(10),
              Expanded(
                child: Container(
                 padding: EdgeInsets.symmetric(vertical: Reponsive_.crosslength*0.01),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(Reponsive_.crosslength*0.02)
                  ),
                ),
              )
            ],
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: Reponsive_.crosslength*0.06,
                  decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: InterText(
                    text: "APPLY",
                    color: AppColors.white,
                    fontSize: Reponsive_.px18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Gap(Reponsive_.crosslength*0.01),
            Expanded(
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: Reponsive_.crosslength*0.06,
                  decoration: BoxDecoration(
                      color: AppColors.hintTextGrey,
                      borderRadius: BorderRadius.circular(30)),
                  child: InterText(
                    text: "RESET",
                    color: AppColors.white,
                    fontSize: Reponsive_.px18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedShiftNight = false;
                    selectedShiftAfternoon = false;
                    selectedShiftMorning = false;
                    scheduleFilterController.roleValue.value = "Select";
                    scheduleFilterController.facilitiesValue.value = "Select";
                    scheduleFilterController.employeeNameValue.value = "Select";
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
