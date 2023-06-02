import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/controller/openShiftsScreenController.dart';

import 'schedulefilterScreen.dart';

class OpenShiftsScreen extends StatefulWidget {
  String? title, headerText;
  bool? enableCheckBox,
      showTime,
      bodyColor,
      openIcon,
      assignedIcon,
      incentiveIcon,
      userIcon,
      watchIcon;
  OpenShiftsScreen(
      {Key? key,
      this.title,
      this.bodyColor,
      this.enableCheckBox,
      this.headerText,
      this.showTime,
      this.assignedIcon,
      this.incentiveIcon,
      this.openIcon,
      this.watchIcon,
      this.userIcon})
      : super(key: key);

  @override
  State<OpenShiftsScreen> createState() => _OpenShiftsScreenState();
}

class _OpenShiftsScreenState extends State<OpenShiftsScreen> {
  final openShiftController = Get.put(OpenShiftsScreenController());
  final cx = Get.put(CommonController());
  @override
  void initState() {
    openShiftController.openShiftValue.value = openShiftController.openShift[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: widget.title,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.blue,
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
        padding: padding,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(
                text: widget.headerText,
                color: AppColors.blue,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              Gap(10.w),
              Obx(() => Row(
                    children: [
                      MontserratText(
                        text: openShiftController.openShiftValue.value,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.hintTextGrey,
                      ),
                      PopupMenuButton<String>(
                        itemBuilder: (context) {
                          return openShiftController.openShift.map((str) {
                            return PopupMenuItem(
                              value: str,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Gap(10.w),
                                  InterText(
                                    text: str.toString(),
                                    color: AppColors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            );
                          }).toList();
                        },
                        icon: Image.asset(AppAssets.dropDown,
                            color: AppColors.hintTextGrey),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r))),
                        color: AppColors.white,
                        onSelected: (v) {
                          openShiftController.openShiftValue.value = v;
                        },
                      ),
                      InkWell(
                        child: Image.asset(AppAssets.filtetr),
                        onTap: () {
                          toPushNavigator(context: context,PageName: ScheduleFilterScreen());
                        },
                      )
                    ],
                  )),
            ],
          ),
          Gap(15),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listItem.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: cx.width,
                  height: cx.height / 8,
                  decoration: BoxDecoration(
                      color: widget.bodyColor == true
                          ? Color.fromRGBO(220, 246, 233, 1)
                          : AppColors.white,
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
                        child: widget.enableCheckBox == true
                            ? Checkbox(
                                shape: const CircleBorder(),
                                value: listItem[index].checkValue,
                                activeColor: AppColors.buttonColor,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    listItem[index].checkValue = newValue!;
                                  });
                                },
                              )
                            : null,
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
                                  widget.showTime == true
                                      ? Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: InterText(
                                            text: "7:00AM - 3:00PM",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: AppColors.hintTextGrey,
                                          ),
                                        )
                                      : Container(),
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
                                      widget.userIcon == true
                                          ? Image.asset(AppAssets.userImage)
                                          : Container(),
                                      widget.watchIcon == true
                                          ? Image.asset(AppAssets.watch)
                                          : Container(),
                                      widget.assignedIcon == true
                                          ? Container(
                                              height: 16,
                                              width: 15,
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    126, 230, 155, 1),
                                              ),
                                            )
                                          : Container(),
                                      widget.openIcon == true
                                          ? Container(
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
                                          : Container(),
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
          Gap(MediaQuery.of(context).size.width / 4.5),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          backgroundColor: Color.fromRGBO(243, 48, 71, 1),
          onPressed: () {},
          child: Image.asset(AppAssets.delete),
        ),
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
