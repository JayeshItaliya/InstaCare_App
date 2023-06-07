import 'package:flutter/material.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonDropDown.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:get/get.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:instacare/screens/dashBoardFlow/availableEmployeesFlow/controller/filterController.dart';

class ApplyFilterScreen extends StatefulWidget {
  const ApplyFilterScreen({Key? key}) : super(key: key);

  @override
  State<ApplyFilterScreen> createState() => _ApplyFilterScreenState();
}

class _ApplyFilterScreenState extends State<ApplyFilterScreen> {
  final cx = Get.put(CommonController());
  final filterController = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MontserratText(
            text: "Apply Filter",
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        leadingWidth: cx.width / 1,
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
              list: filterController.roleList,
              mycontrollerValue: filterController.roleListValue),
          const SizedBox(
            height: 15,
          ),
          Obx(
            () => GestureDetector(
              child: Container(
                width: cx.width,
                height: cx.height / 10,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterText(
                      text: filterController.rangeDateValue.value,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    Image.asset(AppAssets.dropDown)
                  ],
                ),
              ),
              onTap: () {
                DateConverter.RangeDatePicker(
                        context: context, monthType: false, dateRang: true)
                    .then((value) {
                  filterController.rangeDateValue.value = value.toString();
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InterText(
            text: "Shift Time",
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: AppColors.black,
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(() => GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: cx.width,
                  height: cx.height / 10,
                  decoration: BoxDecoration(
                      color: filterController.morningShift.value == true
                          ? AppColors.buttonColor
                          : null,
                      borderRadius: BorderRadius.circular(30),
                      border: filterController.morningShift.value == false
                          ? Border.all(color: AppColors.buttonColor, width: 1)
                          : null),
                  child: InterText(
                    text: "Morning Shifts 7:00AM - 3:00PM",
                    color: filterController.morningShift.value == true
                        ? AppColors.white
                        : AppColors.buttonColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  filterController.morningShift.value =
                      !filterController.morningShift.value;
                },
              )),
          const SizedBox(
            height: 15,
          ),
          Obx(() => GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: cx.width,
                  height: cx.height / 10,
                  decoration: BoxDecoration(
                      color: filterController.afterNoonShift.value == true
                          ? AppColors.buttonColor
                          : null,
                      borderRadius: BorderRadius.circular(30),
                      border: filterController.afterNoonShift.value == false
                          ? Border.all(color: AppColors.buttonColor, width: 1)
                          : null),
                  child: InterText(
                    text: "Afternoon Shifts 3:00PM - 11:00PM",
                    color: filterController.afterNoonShift.value == true
                        ? AppColors.white
                        : AppColors.buttonColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  filterController.afterNoonShift.value =
                      !filterController.afterNoonShift.value;
                },
              )),
          const SizedBox(
            height: 15,
          ),
          Obx(() => GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: cx.width,
                  height: cx.height / 10,
                  decoration: BoxDecoration(
                      color: filterController.nightShift.value == true
                          ? AppColors.buttonColor
                          : null,
                      borderRadius: BorderRadius.circular(30),
                      border: filterController.nightShift.value == false
                          ? Border.all(color: AppColors.buttonColor, width: 1)
                          : null),
                  child: InterText(
                    text: "Night Shifts 11:00PM - 7:00AM",
                    color: filterController.nightShift.value == true
                        ? AppColors.white
                        : AppColors.buttonColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  filterController.nightShift.value =
                      !filterController.nightShift.value;
                },
              )),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: CommonButton(
                text: "Apply",
                onTap: () {},
                height: 60,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: CommonButton(
                text: "Reset",
                onTap: () {},
                height: 60,
                color: AppColors.allGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
