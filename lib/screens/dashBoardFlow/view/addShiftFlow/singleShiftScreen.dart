import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
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
              fontSize: Reponsive_.px16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: Reponsive_.crosslength*0.01),
            CommonDropDown(
                context: context,
                list: singleShiftController.selectFacility,
                mycontrollerValue: singleShiftController.selectFacilityValue,
                color: AppColors.white
            ),
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InterText(
              text: "Role",
              fontSize: Reponsive_.px16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: Reponsive_.crosslength*0.01),
            CommonDropDown(
                context: context,
                list: singleShiftController.selectRole,
                mycontrollerValue: singleShiftController.selectRoleValue,
                color: AppColors.white
            ),
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InterText(
              text: "Number of Positions (Open Shifts)",
              fontSize: Reponsive_.px16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: Reponsive_.crosslength*0.01),
            CommonDropDown(
                context: context,
                list: singleShiftController.selectNumber,
                mycontrollerValue: singleShiftController.selectNumberValue,
              color: AppColors.white
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
              fontSize: Reponsive_.px16,
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
                      fontSize: Reponsive_.px16,
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
              fontSize: Reponsive_.px16,
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
                                print(timeData[index].checkValue);
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: InterText(
                            text: timeData[index].timeShift,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: AppColors.black,
                          ),
                          onTap: (){
                            setState(() {
                              timeData[index].checkValue=!timeData[index].checkValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  );
                }),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: InterText(
                    text: "Start Time",
                    fontSize: Reponsive_.px16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Expanded(
                  child: InterText(
                    text: "End Time",
                    fontSize: Reponsive_.px16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                )
              ],
            ),
            const Gap(10),
            SizedBox(
              width: Reponsive_.w,
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: CommonDropDown(
                            context: context,
                            list: singleShiftController.timeData,
                            mycontrollerValue: singleShiftController.setTime,
                            color: AppColors.white
                        ),
                      ),
                      SizedBox(width: 8,),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: CommonDropDown(
                            context: context,
                            list: singleShiftController.timeZone,
                            mycontrollerValue: singleShiftController.setTimeZone,
                            color: AppColors.white
                        ),
                      ),
                      SizedBox(width: 8,),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: CommonDropDown(
                            context: context,
                            list: singleShiftController.timeData,
                            mycontrollerValue: singleShiftController.setTime,
                            color: AppColors.white
                        ),
                      ),
                      SizedBox(width: 8,),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: CommonDropDown(
                            context: context,
                            list: singleShiftController.timeZone,
                            mycontrollerValue: singleShiftController.setTimeZone,
                            color: AppColors.white
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Rate (per hour)",
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Reponsive_.px16,
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        height: 40,
                        child: AppWidget().getTextField(
                          hintText: "\$45",
                          filledColor: AppColors.white
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Cancellation Guarantee",
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Reponsive_.px16,
                      ),
                      SizedBox(height: 7,),
                      Row(
                        children: [
                          Radio(
                            value: BestTutorSite.javatpoint,
                            groupValue: _site,
                            activeColor: AppColors.buttonColor,
                            onChanged: (BestTutorSite? value) {
                              setState(() {
                                _site = value!;
                              });
                            },
                          ),
                          InterText(
                            text: "Yes",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                          Radio(
                            value: BestTutorSite.tutorialandexample,
                            groupValue: _site,
                            activeColor: AppColors.buttonColor,
                            onChanged: (BestTutorSite? value) {
                              setState(() {
                                _site = value!;
                              });
                            },
                          ),
                          InterText(
                            text: "NO",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Incentives",
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Reponsive_.px16,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Radio(
                            value: BestTutorSite.javatpoint,
                            groupValue: _site,
                            activeColor: AppColors.buttonColor,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: (BestTutorSite? value) {
                              setState(() {
                                _site = value!;
                              });
                            },
                          ),
                          InterText(
                            text: "Yes",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                          Radio(
                            value: BestTutorSite.tutorialandexample,
                            groupValue: _site,
                            activeColor: AppColors.buttonColor,
                            onChanged: (BestTutorSite? value) {
                              setState(() {
                                _site = value!;
                              });
                            },
                          ),
                          InterText(
                            text: "NO",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Incentive By",
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Reponsive_.px16,
                      ),
                      SizedBox(
                        width: 150,
                        height: 60,
                        child: CommonDropDown(
                            context: context,
                            list: singleShiftController.incentiveByList,
                            mycontrollerValue: singleShiftController.incentiveByValue,

                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Incentive Type",
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Reponsive_.px16,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Radio(
                            value: BestTutorSite.javatpoint,
                            groupValue: _site,
                            activeColor: AppColors.buttonColor,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: (BestTutorSite? value) {
                              setState(() {
                                _site = value!;
                              });
                            },
                          ),
                          InterText(
                            text: "Yes",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                          Radio(
                            value: BestTutorSite.tutorialandexample,
                            groupValue: _site,
                            activeColor: AppColors.buttonColor,
                            onChanged: (BestTutorSite? value) {
                              setState(() {
                                _site = value!;
                              });
                            },
                          ),
                          InterText(
                            text: "NO",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Incentive Amount",
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Reponsive_.px16,
                      ),
                      SizedBox(
                        width: 150,
                        height: 60,
                        child: CommonDropDown(
                          context: context,
                          list: singleShiftController.incentiveByList,
                          mycontrollerValue: singleShiftController.incentiveByValue,

                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Floor Number",
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Reponsive_.px16,
                      ),
                      SizedBox(
                        width: 150,
                        height: 60,
                        child: CommonDropDown(
                          context: context,
                          list: singleShiftController.incentiveByList,
                          mycontrollerValue: singleShiftController.incentiveByValue,

                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Supervisor",
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Reponsive_.px16,
                      ),
                      SizedBox(
                        width: 150,
                        height: 60,
                        child: CommonDropDown(
                          context: context,
                          list: singleShiftController.incentiveByList,
                          mycontrollerValue: singleShiftController.incentiveByValue,

                        ),
                      )
                    ],
                  ),
                )
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
                    fontSize: Reponsive_.px16,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            AppWidget().getTextField(
              filledColor: AppColors.white,
              maxLine: 5
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: CommonButton(
                        text: "Publish",
                         onTap: (){},
                      ),
                    ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: CommonButton(
                      text: "Assign",
                      onTap: (){},
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        )
      ],
    );
  }
  BestTutorSite _site = BestTutorSite.javatpoint;
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
            fontSize: Reponsive_.px16,
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
enum BestTutorSite { javatpoint, w3schools, tutorialandexample }