import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:instacare/Utils/Commonwidgets.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonDropDown.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:get/get.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/controller/recurringShiftController.dart';

class RecurringShiftsScreen extends StatefulWidget {
  const RecurringShiftsScreen({Key? key}) : super(key: key);

  @override
  State<RecurringShiftsScreen> createState() => _RecurringShiftsScreenState();
}

class _RecurringShiftsScreenState extends State<RecurringShiftsScreen> {
  final recurringShiftController = Get.put(RecurringShiftController());
  final cx = Get.put(CommonController());
  String _verticalGroupValue = "Pending";
  String? selectedDate;
  DateTime currentDateTime = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    recurringShiftController.selectedFacility.value="Select Facility";
    recurringShiftController.selectRoleValue.value = "Select Role";
    recurringShiftController.selectedNumberOfPosition.value = "01";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return ListView(
      padding: padding,
      children: [
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength / 60),
              child: InterText(
                text: "Facility",
                fontSize: Reponsive_.px16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength / 80,
            ),
            CommonDropDown(
                context: context,
                list: recurringShiftController.facilityArr,
                mycontrollerValue: recurringShiftController.selectedFacility,
                hint: "Select Facility",
                //padding: EdgeInsets.zero,
                color: AppColors.white)
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength / 60),
              child: InterText(
                text: "Role",
                fontSize: Reponsive_.px16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength / 80,
            ),
            CommonDropDown(
                context: context,
                list: recurringShiftController.rolesArr,
                mycontrollerValue: recurringShiftController.selectRoleValue,
                hint: "Select Role",
                // padding: EdgeInsets.zero,
                color: AppColors.white),
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength / 60),
              child: InterText(
                text: "Number of Positions",
                fontSize: Reponsive_.px16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CommonDropDown(
                context: context,
                list: recurringShiftController.Number_of_Positions_Arr,
                mycontrollerValue:
                    recurringShiftController.selectedNumberOfPosition,
                // padding: EdgeInsets.zero
                color: AppColors.white),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: Reponsive_.crosslength / 60,
          ),
          child: InterText(
            text: "Select Recurring Days",
            fontSize: Reponsive_.px16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        SizedBox(
          height: Reponsive_.crosslength / 80,
        ),
        SizedBox(
          height: Reponsive_.crosslength / 9.5,
          child: ListView.builder(
              itemCount: weekDayList.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                WeekDay weekDay = weekDayList[index];
                return Obx(
                  () => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!recurringShiftController.selected_week_days
                            .contains(recurringShiftController
                                .weekDayList[index]
                                .toLowerCase())) {
                          recurringShiftController.selected_week_days.add(
                              recurringShiftController.weekDayList[index]
                                  .toLowerCase());
                        } else {
                          recurringShiftController.selected_week_days.remove(
                              recurringShiftController.weekDayList[index]
                                  .toLowerCase());
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 2, right: 2),
                      padding: EdgeInsets.symmetric(
                          horizontal: Reponsive_.crosslength * 0.009),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              recurringShiftController.selected_week_days
                                      .contains(recurringShiftController
                                          .weekDayList[index]
                                          .toLowerCase())
                                  ? "assets/x/checkshift.png"
                                  : "assets/x/unchecksift.png",
                              scale: 3.5),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            child: InterText(
                              text: weekDay.dayName,
                              fontWeight: FontWeight.w400,
                              fontSize: Reponsive_.px18,
                              color: AppColors.hintTextGrey,
                            ),
                            onTap: () {
                              setState(() {
                                weekDay.dayValue = !weekDay.dayValue!;
                                if (weekDay.dayValue == true) {
                                  recurringShiftController.selectedDate.value =
                                      weekDay.dayName!;
                                  print(recurringShiftController
                                      .selectedDate.value);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength / 60),
              child: InterText(
                text: "Date",
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px16,
                color: AppColors.black,
              ),
            ),
            SizedBox(
              width: Reponsive_.crosslength / 6,
            ),
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength / 100),
              child: InterText(
                text: "Duration",
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px16,
                color: AppColors.black,
              ),
            )
          ],
        ),
        Gap(10),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  DateConverter.RangeDatePicker(
                          context: context,
                          dateRang: false,
                          monthType: false,
                          dateType: true)
                      .then((value) {
                    setState(() {
                      recurringShiftController.selectedDate.value = value!;
                      print(selectedDate);
                    });
                  });
                },
                child: Container(
                  width: Reponsive_.crosslength / 10,
                  height: Reponsive_.crosslength / 20,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterText(
                        text: recurringShiftController.selectedDate.value == null ? DateConverter.dateMonthYear(DateTime.parse(recurringShiftController.selectedDate.value)) : recurringShiftController.selectedDate.value,
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
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: Reponsive_.crosslength / 5.5,
              height: Reponsive_.crosslength / 20,
              child: CommonDropDown(
                  context: context,
                  list: recurringShiftController.durationList,
                  mycontrollerValue: recurringShiftController.durationValue,
                  color: AppColors.white),
            )
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Reponsive_.crosslength / 60, bottom: 10),
              child: InterText(
                text: "Shift Time",
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px16,
              ),
            ),
            ListView.builder(
                itemCount: timeData.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 35,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  recurringShiftController.selected_shift_index = index;
                                });
                              },
                              child: Image.asset(
                                recurringShiftController.selected_shift_index ==
                                        index
                                    ? "assets/x/checkshift.png"
                                    : "assets/x/unchecksift.png",
                                scale: 3.8,
                                color:recurringShiftController.selected_shift_index!=index? AppColors.white:null,

                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: InterText(
                                text: timeData[index].timeShift,
                                fontWeight: FontWeight.w400,
                                fontSize: Reponsive_.px18,
                                color: AppColors.black,
                              ),
                              onTap: () {
                                setState(() {
                                  recurringShiftController.selected_shift_index = index;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            const Gap(10),
            if (recurringShiftController.selected_shift_index == 3) ...{
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: Reponsive_.crosslength / 60),
                      child: InterText(
                        text: "Start Time",
                        fontSize: Reponsive_.px16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
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
                              list: recurringShiftController.timeData,
                              mycontrollerValue:
                                  recurringShiftController.startTime,
                              color: AppColors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: Reponsive_.crosslength / 10,
                          height: Reponsive_.crosslength / 20,
                          child: CommonDropDown(
                              context: context,
                              list: recurringShiftController.timeZone,
                              mycontrollerValue:
                                  recurringShiftController.startTimeZone,
                              color: AppColors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: CommonDropDown(
                              context: context,
                              list: recurringShiftController.timeData,
                              mycontrollerValue:
                                  recurringShiftController.endTime,
                              color: AppColors.white),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: Reponsive_.crosslength / 10,
                          height: Reponsive_.crosslength / 20,
                          child: CommonDropDown(
                              context: context,
                              list: recurringShiftController.timeZone,
                              mycontrollerValue:
                                  recurringShiftController.endTimeZone,
                              color: AppColors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Gap(10),
            },
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: Reponsive_.crosslength / 60),
                        child: InterText(
                          text: "Rate (per hour)",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength / 80,
                      ),
                      SizedBox(
                        width: Reponsive_.crosslength / 5.5,
                        height: Reponsive_.crosslength / 20,
                        child: AppWidget().getTextField(
                            hintText: "\$45",
                            keyboardType: TextInputType.number,
                            filledColor: AppColors.white,
                            textEditingController:
                                recurringShiftController.rateController.value),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: Reponsive_.crosslength / 60),
                        child: InterText(
                          text: "Cancellation Guarantee",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength / 80,
                      ),
                      Row(
                        children: [
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: AppColors.buttonColor),
                            child: Radio(
                              value: "1",
                              groupValue: recurringShiftController
                                  .calcellation_radio_value.value,
                              activeColor: AppColors.buttonColor,
                              onChanged: (value) {
                                setState(() {
                                  recurringShiftController
                                      .calcellation_radio_value.value = "1";
                                });
                              },
                            ),
                          ),
                          InterText(
                            text: "Yes",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: AppColors.buttonColor),
                            child: Radio(
                              value: "0",
                              groupValue: recurringShiftController
                                  .calcellation_radio_value.value,
                              activeColor: AppColors.buttonColor,
                              onChanged: (value) {
                                setState(() {
                                  recurringShiftController
                                      .calcellation_radio_value.value = "0";
                                });
                              },
                            ),
                          ),
                          InterText(
                            text: "No",
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
                      Padding(
                        padding:
                            EdgeInsets.only(left: Reponsive_.crosslength / 60),
                        child: InterText(
                          text: "Incentives",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength / 80,
                      ),
                      Row(
                        children: [
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: AppColors.buttonColor),
                            child: Radio(
                              value: "1",
                              groupValue: recurringShiftController
                                  .incentive_radio_value.value,
                              activeColor: AppColors.buttonColor,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (value) {
                                setState(() {
                                  recurringShiftController
                                      .incentive_radio_value.value = "1";
                                });
                              },
                            ),
                          ),
                          InterText(
                            text: "Yes",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: AppColors.buttonColor),
                            child: Radio(
                              value: "0",
                              groupValue: recurringShiftController
                                  .incentive_radio_value.value,
                              activeColor: AppColors.buttonColor,
                              onChanged: (value) {
                                setState(() {
                                  recurringShiftController
                                      .incentive_radio_value.value = "0";
                                });
                              },
                            ),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: Reponsive_.crosslength / 60),
                        child: InterText(
                          text: "Incentive By",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength / 80,
                      ),
                      SizedBox(
                        width: Reponsive_.crosslength / 5.5,
                        height: Reponsive_.crosslength / 20,
                        child: CommonDropDown(
                          context: context,
                          list: recurringShiftController.incentiveByArr,
                          mycontrollerValue:
                              recurringShiftController.selectedIncentiveBy,
                          color: AppColors.white,
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
                      Padding(
                        padding:
                            EdgeInsets.only(left: Reponsive_.crosslength / 60),
                        child: InterText(
                          text: "Incentive Type",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength / 80,
                      ),
                      Row(
                        children: [
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: AppColors.buttonColor),
                            child: Radio(
                              value: "1",
                              groupValue: recurringShiftController
                                  .incentive_type_radio_value.value,
                              activeColor: AppColors.buttonColor,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (value) {
                                setState(() {
                                  recurringShiftController
                                      .incentive_type_radio_value.value = "1";
                                });
                              },
                            ),
                          ),
                          InterText(
                            text: "\$/hr",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor: AppColors.buttonColor),
                            child: Radio(
                              value: "0",
                              groupValue: recurringShiftController
                                  .incentive_type_radio_value.value,
                              activeColor: AppColors.buttonColor,
                              onChanged: (value) {
                                setState(() {
                                  recurringShiftController
                                      .incentive_type_radio_value.value = "0";
                                });
                              },
                            ),
                          ),
                          InterText(
                            text: "Flat",
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: Reponsive_.crosslength / 60),
                        child: InterText(
                          text: "Incentive Amount",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/45,
                      ),
                      SizedBox(
                        width: Reponsive_.crosslength/5.5,
                        height: Reponsive_.crosslength/20,
                        child: AppWidget().getTextField(
                            filledColor: AppColors.white,
                            hintText: "40",
                            keyboardType: TextInputType.number,
                            textEditingController: recurringShiftController
                                .incentiveAmountController.value),
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
                      Padding(
                        padding:
                            EdgeInsets.only(left: Reponsive_.crosslength / 60),
                        child: InterText(
                          text: "Floor Number",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength / 80,
                      ),
                      SizedBox(
                        width: Reponsive_.crosslength / 5.5,
                        height: Reponsive_.crosslength / 20,
                        child: CommonDropDown(
                          context: context,
                          list: recurringShiftController.facilityArr,
                          mycontrollerValue:
                              recurringShiftController.selectedFloorNo,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: Reponsive_.crosslength / 60),
                        child: InterText(
                          text: "Supervisor",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Reponsive_.px16,
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength / 80,
                      ),
                      SizedBox(
                        width: Reponsive_.crosslength / 5.5,
                        height: Reponsive_.crosslength / 20,
                        child: CommonDropDown(
                          context: context,
                          list: recurringShiftController.supervisorArr,
                          mycontrollerValue:
                              recurringShiftController.selectedSupervisor,
                          color: AppColors.white,
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
              padding: EdgeInsets.only(left: Reponsive_.crosslength / 60),
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
            SizedBox(
              height: 8,
            ),
            AppWidget().getTextField(
                filledColor: AppColors.white,
                maxLine: 5,
                textEditingController:
                    recurringShiftController.notesController.value),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: "PUBLISH",
                    onTap: () {
                      Commonwidgets.confirmationDialog(context, () {
                        recurringShiftController.storeRecurringShift(context);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: CommonButton(
                    text: "ASSIGN",
                    onTap: () {},
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
  late final _statusArr = [
    "Yes",
    "No",
  ];
  List<WeekDay> weekDayList = [
    WeekDay(
      dayName: "Mon",
      dayValue: false,
    ),
    WeekDay(
      dayName: "Tue",
      dayValue: false,
    ),
    WeekDay(
      dayName: "Wed",
      dayValue: false,
    ),
    WeekDay(
      dayName: "Thu",
      dayValue: false,
    ),
    WeekDay(
      dayName: "Fri",
      dayValue: false,
    ),
    WeekDay(
      dayName: "Sat",
      dayValue: false,
    ),
    WeekDay(
      dayName: "Sun",
      dayValue: false,
    ),
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

class WeekDay {
  String? dayName;
  bool? dayValue;

  WeekDay({this.dayName, this.dayValue});
}

class TimeShift {
  String? timeShift;
  bool? checkValue;

  TimeShift({this.timeShift, this.checkValue});
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }
