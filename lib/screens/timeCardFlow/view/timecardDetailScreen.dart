import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
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
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: "Timecard Detail",
          fontSize: Reponsive_.px24,
          fontWeight: FontWeight.w600,
          color: AppColors.blue,
        ),
      ),
      body: ListView(
        padding: padding,
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(
                text: "Status",
                color: AppColors.blue,
                fontWeight: FontWeight.w600,
                fontSize:Reponsive_.px12,
              ),
              widget.index == 1
                  ? Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                              color: AppColors.yallow, shape: BoxShape.circle),
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
                              fontWeight: FontWeight.w600,
                            )
                          ],
                        )
                      ],
                    )
                  : Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
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
                              fontWeight: FontWeight.w400,
                            ),
                            InterText(
                              text: "on 16-Feb-2023",
                              color: AppColors.hintTextGrey,
                              fontSize: Reponsive_.px18,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        )
                      ],
                    ),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength / 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InterText(
                text: "Details",
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px18,
                color: AppColors.blue,
              ),
              SizedBox(
                height: Reponsive_.crosslength / 30,
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
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InterText(
                        text: "Granny Weatherwax",
                        fontSize: Reponsive_.px18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Worker’s Documents",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Image.asset(AppAssets.downodTimeCard),
                          InterText(
                            text: "Download",
                            fontSize: Reponsive_.px18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: Reponsive_.crosslength / 30,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Start Date",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InterText(
                        text: "Wed, Feb 01 2023",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: Reponsive_.crosslength / 18,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Start Time",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InterText(
                        text: "7:00AM",
                        fontSize: Reponsive_.px18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: Reponsive_.crosslength / 30,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "End Date",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InterText(
                        text: "Wed, Feb 01 2023",
                        fontSize: Reponsive_.px18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: Reponsive_.crosslength / 18,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Start Time",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InterText(
                        text: "3:00AM",
                        fontSize: Reponsive_.px18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: Reponsive_.crosslength / 30,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Duration",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InterText(
                        text: "8 Hours 00 Minutes",
                        fontSize: Reponsive_.px18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: Reponsive_.crosslength / 30,
              ),
              widget.index == 1
                  ? AppWidget().getTextField(
                      hintText: "Add Notes",
                      maxLine: 8,
                    )
                  : Container(),
              SizedBox(
                height: Reponsive_.crosslength / 30,
              ),
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
              SizedBox(
                height: Reponsive_.crosslength / 30,
              ),
              widget.index == 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.downodTimeCard),
                        InterText(
                          text: "Download Timecard",
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        )
                      ],
                    )
                  : Container(),
                SizedBox(
                  height: Reponsive_.crosslength/40,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CommonButton(
                      text: widget.index == 1
                          ? "Process".toUpperCase()
                          : "un Process".toUpperCase(),
                      onTap: () {
                        if (widget.index == 1) {
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
                                    fontSize: Reponsive_.px30,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.only(top: 10, left: 10, right: 10),
                                    child: InterText(
                                      text:
                                      "Do you want to “Processed” all the selected shifts timecards?",
                                      maxLines: 2,
                                      color: AppColors.black,
                                      fontSize: Reponsive_.px18,
                                      fontWeight: FontWeight.normal,
                                      textAlign: TextAlign.center,
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
                                            text: "Yes, Process".toUpperCase(),
                                            onTap: () {
                                              onBack(context);
                                            },
                                          ),
                                        ),
                                        SizedBox(
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
                        } else {
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
                                    fontSize: Reponsive_.px30,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.only(top: 10, left: 10, right: 10),
                                    child: InterText(
                                      text:
                                      "Do you want to “UnProcess” all the selected shifts timecards?",
                                      maxLines: 2,
                                      color: AppColors.black,
                                      fontSize: Reponsive_.px18,
                                      fontWeight: FontWeight.normal,
                                      textAlign: TextAlign.center,
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
                                            text: "UnProcess".toUpperCase(),
                                            onTap: () {
                                              onBack(context);
                                            },
                                          ),
                                        ),
                                        SizedBox(
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
                        }
                      },
                    ),
                  ),
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
                                  fontSize: Reponsive_.px30,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
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
                                AppWidget()
                                    .getTextField(hintText: "Add Notes", maxLine: 5),
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
              )
            ],
          )
        ],
      ),

    );
  }
}
