import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/controller/openShiftsScreenController.dart';

import 'schedulefilterScreen.dart';

class OpenShiftsScreen extends StatefulWidget {
  String? title, headerText1,headerText2;
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
      this.headerText1,
      this.headerText2,
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
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: widget.title,
          fontSize:  Reponsive_.px24,
          fontWeight: FontWeight.w700,
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
        padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.02,),
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InterText(
                      text: widget.headerText1,
                      color: AppColors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: Reponsive_.px18,
                    ),
                    InterText(
                      text: widget.headerText2,
                      color: AppColors.blue,
                      softWrap: true,
                      fontWeight: FontWeight.w400,
                      fontSize: Reponsive_.px18,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CommonDropDown(
                              context: context,
                              list: openShiftController.openShift,
                              mycontrollerValue: openShiftController.openShiftValue
                          ),
                        ),
                        InkWell(
                          child: Image.asset(AppAssets.filtetr,scale: 1.3,),
                          onTap: () {
                            toPushNavigator(context: context,PageName: ScheduleFilterScreen());
                          },
                        )
                      ],
                    )
                ),
            ],
          ),
          Gap(15),
          ListView.builder(
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
                    height: cx.height/10,
                    decoration: BoxDecoration(
                        color: widget.bodyColor == true
                            ? Color.fromRGBO(220, 246, 233, 1)
                            : AppColors.white,
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
                                child: widget.enableCheckBox == true
                                    ?
                                Checkbox(
                                    value: listItem[index].checkValue,
                                    shape: const CircleBorder(),
                                    activeColor: AppColors.buttonColor,
                                    onChanged: (val){
                                      setState(() {
                                        listItem[index].checkValue=val!;
                                      });
                                    }
                                )
                                    : null,
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
                                      fontSize: Reponsive_.px18,
                                      color: AppColors.black,
                                    ),
                                    widget.showTime == true
                                        ? Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: InterText(
                                              text: "7:00AM - 3:00PM",
                                              fontWeight: FontWeight.w600,
                                              fontSize: Reponsive_.px12,
                                              color: AppColors.hintTextGrey,
                                            ),
                                          )
                                        : Container(),
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
                                      fontSize: Reponsive_.px14,
                                      color: AppColors.black,
                                    ),
                                    Row(
                                      children: [
                                        widget.userIcon == true
                                            ? Image.asset(AppAssets.userImage)
                                            : Container(),
                                        SizedBox(width: 4,),
                                        widget.watchIcon == true
                                            ? Image.asset(AppAssets.watch)
                                            : Container(),
                                        SizedBox(width: 4,),
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
          Gap(MediaQuery.of(context).size.width / 4.5),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
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
                      text: "Schedule".toUpperCase(),
                      color: AppColors.blue,
                      fontSize: Reponsive_.px12,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MontserratText(
                      text: "Confirmation",
                      color: AppColors.redColor,
                      fontSize: Reponsive_.px30,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength*0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Do you really want to',
                                  style: GoogleFonts.inter(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: Reponsive_.px16,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Delete ',
                                  style: GoogleFonts.inter(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Reponsive_.px16,
                                  ),
                                ),
                                TextSpan(
                                  text: 'shift(s)?',
                                  style: GoogleFonts.inter(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: Reponsive_.px16,
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength*0.07,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CommonButton(
                              text: "YES",
                              onTap: (){},
                              color: AppColors.redColor,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            child: CommonButton(
                              text: "NO, GO BACK",
                              onTap: (){},
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
                  fontSize: Reponsive_.px12,
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
                  fontSize: Reponsive_.px12,
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
                  fontSize: Reponsive_.px12,
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
                  fontSize: Reponsive_.px12,
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
  bool checkValue;
  OpenShift({this.position, this.center, this.checkValue=false});
}
