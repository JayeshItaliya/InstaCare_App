import 'dart:convert';

import 'package:flutter/material.dart';
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
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/timeCardFlow/controller/controller/timecardDetailController.dart';

class TimeCardDetailScreen extends StatefulWidget {
  int index;

  TimeCardDetailScreen({super.key, required this.index});

  @override
  State<TimeCardDetailScreen> createState() => _TimeCardDetailScreenState();
}

class _TimeCardDetailScreenState extends State<TimeCardDetailScreen> {
  final timeDetailController = Get.put(TimeCardDetailController());
  final cx = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      resizeToAvoidBottomInset: false,
      appBar: CommonAppBar(
        title: MontserratText(
          text: "Timecard Detail",
          fontSize: Reponsive_.px24,
          fontWeight: FontWeight.w700,
          color: AppColors.blue,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Reponsive_.crosslength * 0.01),
        child: ListView(
          children: [
            SizedBox(
              height: Reponsive_.crosslength * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(Reponsive_.crosslength * 0.015))),
              padding: EdgeInsets.all(Reponsive_.crosslength * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InterText(
                    text: "Status",
                    color: AppColors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: Reponsive_.px16,
                  ),
                  widget.index == 1
                      ? Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: Reponsive_.crosslength * 0.03,
                              height: Reponsive_.crosslength * 0.03,
                              decoration: const BoxDecoration(
                                  color: AppColors.yallow,
                                  shape: BoxShape.circle),
                              child: Image.asset(AppAssets.loader1),
                            ),
                            SizedBox(
                              width: Reponsive_.crosslength / 80,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InterText(
                                  text: "Process",
                                  color: AppColors.yallow,
                                  fontSize: Reponsive_.px12,
                                  fontWeight: FontWeight.w600,
                                ),
                                InterText(
                                  text: "--",
                                  color: AppColors.hintTextGrey,
                                  fontSize: Reponsive_.px12,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: Reponsive_.crosslength * 0.03,
                              height: Reponsive_.crosslength * 0.03,
                              decoration: const BoxDecoration(
                                  color: AppColors.deepGreen,
                                  shape: BoxShape.circle),
                              child: Icon(Icons.check,
                                  color: AppColors.white, size: 20),
                            ),
                            SizedBox(
                              width: Reponsive_.crosslength / 80,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InterText(
                                  text: "Processed".toUpperCase(),
                                  color: AppColors.deepGreen,
                                  fontSize: Reponsive_.px12,
                                  fontWeight: FontWeight.bold,
                                ),
                                InterText(
                                  text: "on 16-Feb-2023",
                                  color: AppColors.hintTextGrey,
                                  fontSize: Reponsive_.px12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            )
                          ],
                        ),
                ],
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(Reponsive_.crosslength * 0.015))),
              padding: EdgeInsets.all(Reponsive_.crosslength * 0.015),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  InterText(
                    text: "Details",
                    fontWeight: FontWeight.w600,
                    fontSize: Reponsive_.px16,
                    color: AppColors.blue,
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "Worker",
                            fontSize: Reponsive_.px12,
                            fontWeight: FontWeight.normal,
                            color: AppColors.black,
                          ),
                          InterText(
                            text: "Granny Weatherwax",
                            fontSize: Reponsive_.px18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                            height: 1.5,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "Worker’s Documents",
                            fontSize: Reponsive_.px12,
                            fontWeight: FontWeight.normal,
                            color: AppColors.black,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                AppAssets.downodTimeCard,
                                height: Reponsive_.crosslength * 0.02,
                                width: Reponsive_.crosslength * 0.02,
                              ),
                              InterText(
                                text: "  Download",
                                fontSize: Reponsive_.px16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blue,
                                height: 1.5,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Start Date",
                              fontSize: Reponsive_.px12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: "Wed, Feb 01 2023",
                              fontSize: Reponsive_.px18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              height: 1.5,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Start Time",
                              fontSize: Reponsive_.px12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: "7:00AM",
                              fontSize: Reponsive_.px18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                              height: 1.5,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "End Date",
                              fontSize: Reponsive_.px12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: "Wed, Feb 01 2023",
                              fontSize: Reponsive_.px18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              height: 1.5,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Start Time",
                              fontSize: Reponsive_.px12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: "3:00AM",
                              fontSize: Reponsive_.px18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                              height: 1.5,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: Reponsive_.crosslength * 0.02),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "Duration",
                            fontSize: Reponsive_.px12,
                            fontWeight: FontWeight.normal,
                            color: AppColors.black,
                          ),
                          InterText(
                            text: "8 Hours 00 Minutes",
                            fontSize: Reponsive_.px18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                            height: 1.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.02,
                  ),
                  widget.index == 1
                      ? Container(
                          child: AppWidget().getTextField(
                            hintText: "Add Notes",
                            inputTextStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: Reponsive_.px16,
                                color: AppColors.black),
                            hintStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: Reponsive_.px16,
                                color: AppColors.hintTextGrey),
                            maxLine: 10,
                          ),
                        )
                      : Container(),
                  widget.index == 0
                      ? Wrap(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InterText(
                                  text: "Manager Notes",
                                  fontSize: Reponsive_.px12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                InterText(
                                  text:
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus finibus nibh in sem volutpat sagittis.",
                                  fontSize: Reponsive_.px18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                  maxLines: 10,
                                ),
                              ],
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
            widget.index == 0
                ? Padding(
                    padding:
                        EdgeInsets.only(top: Reponsive_.crosslength * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.downodTimeCard,
                          height: Reponsive_.crosslength * 0.022,
                          width: Reponsive_.crosslength * 0.022,
                        ),
                        InterText(
                          text: "  Download Timecard",
                          color: AppColors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: Reponsive_.px16,
                        )
                      ],
                    ),
                  )
                : Container(),
            cx.instacareLoginValue.toString().contains("instacare")? SizedBox(
              height: Reponsive_.crosslength*0.10,
            ):Container(),
            widget.index == 0
                ? Expanded(
                    child: SizedBox(),
                  )
                : SizedBox(
                    height: Reponsive_.crosslength * 0.02,
                  ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Reponsive_.crosslength * 0.015),
              child: Row(
                children: [
                 cx.instacareLoginValue.toString().contains("instacare")?
                 Expanded(
                    child: CommonButton(
                      text: widget.index == 1
                          ? "Process".toUpperCase()
                          : "un Process".toUpperCase(),
                      onTap: () {
                        if (widget.index == 1) {
                          confirmation_bottomsheet(
                                                      context,
                                                      "Yes, Process",
                                                      'Cancel',
                                                      () {onBack(context);},
                                                      () {onBack(context);});
                        }else{
                          confirmation_bottomsheet(
                              context,
                              "UnProcess",
                              'Cancel',
                                  () {onBack(context);},
                                  () {onBack(context);});
                        }
                      },
                    ),
                  ):
                  Container(),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CommonButton(
                      text: "Report".toUpperCase(),
                      color: AppColors.allGray,
                      onTap: () {
                        CommonBottonSheet(
                            context: context,
                            childView: ListView(
                              shrinkWrap: true,
                              children: [
                                SizedBox(
                                  height: Reponsive_.crosslength / 25,
                                ),
                                InterText(
                                  text: "Confirmation",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: InterText(
                                    text:
                                        "Do you want to “Report” all the selected shifts timecards?",
                                    maxLines: 2,
                                    color: AppColors.black,
                                    fontSize: Reponsive_.px18,
                                    fontWeight: FontWeight.normal,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CommonDropDown(
                                      context: context,
                                      list: timeDetailController.timeZone,
                                      mycontrollerValue:
                                          timeDetailController.timeZoneValue),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                AppWidget().getTextField(
                                    hintText: "Add Notes", maxLine: 5),
                                SizedBox(
                                  height: Reponsive_.crosslength / 25,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CommonButton(
                                          text: "UnProcess".toUpperCase(),
                                          onTap: () {
                                            onBack(context);
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: CommonButton(
                                          text: "Cancel".toUpperCase(),
                                          onTap: () {
                                            onBack(context);
                                          },
                                          color: AppColors.allGray,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  confirmation_bottomsheet(
    BuildContext context,

    String btn1_label,
    String btn2_label,
    Function tap1,
    Function tap2,
  ) {
    CommonBottonSheet(
        context: context,
        childView: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: Reponsive_.crosslength*0.025, left: Reponsive_.crosslength*0.02, right: Reponsive_.crosslength*0.02),
          children: [

            InterText(
              text: "Confirmation",
              fontSize: Reponsive_.px30,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Reponsive_.crosslength*0.02,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent

                style: GoogleFonts.inter(color: AppColors.hintTextGrey,
                  fontSize: Reponsive_.px18,
                  fontWeight: FontWeight.w500,height: 1.5),
                children: <TextSpan>[
                  TextSpan(text: "Do you want to  "),
                  TextSpan(text: widget.index == 1?'Processed ':'Unprocess ', style: GoogleFonts.inter(color: AppColors.black,
                    fontSize: Reponsive_.px18,
                    fontWeight: FontWeight.w500,)),
                  TextSpan(text: 'all the selected shifts timecards?'),
                ],
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength / 25,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: btn1_label.toUpperCase(),
                      onTap: () {
                        tap1();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: CommonButton(
                      text: btn2_label.toUpperCase(),
                      onTap: () {
                        tap2();
                      },
                      color: AppColors.allGray,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
