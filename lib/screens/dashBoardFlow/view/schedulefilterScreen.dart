import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
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
  final GlobalKey<PopupMenuButtonState> popUpKey1 = GlobalKey();
  final GlobalKey<PopupMenuButtonState> popUpKey2 = GlobalKey();
  final GlobalKey<PopupMenuButtonState> popUpKey3 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: null,
        title: MontserratText(
          text: "Schedule Filter",
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: AppColors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.clear,
                color: AppColors.hintTextGrey,
              ))
        ],
      ),
      body: ListView(
        padding: padding,
        children: [
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
          Gap(20),
          InterText(
            text: "Shift Time",
            color: AppColors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          Gap(15),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    height: cx.height / 11,
                    decoration: BoxDecoration(
                        color: selectedShiftMorning == true
                            ? AppColors.buttonColor
                            : AppColors.greenDark,
                        border: selectedShiftMorning == false
                            ? Border.all(color: AppColors.buttonColor, width: 2)
                            : null,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.sun,
                            color: selectedShiftMorning == false
                                ? Color.fromRGBO(126, 209, 230, 1)
                                : null),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InterText(
                              text: "Morning Shifts",
                              color: selectedShiftMorning == true
                                  ? AppColors.white
                                  : AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            InterText(
                              text: "7:00AM - 3:00PM",
                              color: selectedShiftMorning == true
                                  ? AppColors.white
                                  : AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
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
                    height: cx.height / 11,
                    decoration: BoxDecoration(
                        color: selectedShiftAfternoon == true
                            ? AppColors.buttonColor
                            : AppColors.greenDark,
                        border: selectedShiftAfternoon == false
                            ? Border.all(color: AppColors.buttonColor, width: 2)
                            : null,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.sun,
                            color: selectedShiftMorning == false
                                ? Color.fromRGBO(126, 209, 230, 1)
                                : null),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InterText(
                              text: "Afternoon Shifts",
                              color: selectedShiftAfternoon == true
                                  ? AppColors.white
                                  : AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            InterText(
                              text: "3:00PM - 11:00PM",
                              color: selectedShiftAfternoon == true
                                  ? AppColors.white
                                  : AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
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
          Gap(15),
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
                    alignment: Alignment.center,
                    height: cx.height / 11,
                    decoration: BoxDecoration(
                        color: selectedShiftNight == true
                            ? AppColors.buttonColor
                            : AppColors.greenDark,
                        border: selectedShiftNight == false
                            ? Border.all(color: AppColors.buttonColor, width: 2)
                            : null,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.night,
                            color: selectedShiftMorning == false
                                ? Color.fromRGBO(126, 209, 230, 1)
                                : null),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InterText(
                              text: "Night Shifts",
                              color: selectedShiftNight == true
                                  ? AppColors.white
                                  : AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            InterText(
                              text: "11:00PM - 7:00AM",
                              color: selectedShiftNight == true
                                  ? AppColors.white
                                  : AppColors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
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
                  height: cx.height / 11,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30)),
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
                  height: 60,
                  decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: InterText(
                    text: "Apply",
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Gap(20),
            Expanded(
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                      color: AppColors.hintTextGrey,
                      borderRadius: BorderRadius.circular(30)),
                  child: InterText(
                    text: "Reset",
                    color: AppColors.white,
                    fontSize: 18,
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
