import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Commonwidgets.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:instacare/model/employeeModel.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/controller/getEmployeeData.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/controller/singleShiftController.dart';
import 'package:instacare/screens/employeeFlow/employeeSelectionFlow/controller/FacilityEmployeeSelectionController.dart';

class SingleShiftScreen extends StatefulWidget {
  const SingleShiftScreen({Key? key}) : super(key: key);

  @override
  State<SingleShiftScreen> createState() => _SingleShiftScreenState();
}

class _SingleShiftScreenState extends State<SingleShiftScreen> {
  final cx = Get.put(CommonController());
  final singleShiftController = Get.put(SingleShiftController());
  final employeeEmployeeController = Get.put(EmployeeDataController());
  final FacilityEmployeeSelectionController c =
      Get.put(FacilityEmployeeSelectionController());
  DateTime currentDateTime = DateTime.now();
@override
  void initState() {
    // TODO: implement initState
  singleShiftController.selectedFacility.value="Select Facility";
  singleShiftController.selectRoleValue.value = "Select Role";
  singleShiftController.selectedNumberOfPosition.value = "01";
    super.initState();
  }
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
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength / 60),
              child: InterText(
                text: "Facility",
                fontSize: Reponsive_.px16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: Reponsive_.crosslength * 0.01),
            CommonDropDown(
                context: context,
                list: singleShiftController.facilityArr,
                mycontrollerValue: singleShiftController.selectedFacility,
                color: AppColors.white,
              hint: "Select Facility",
            ),
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
            SizedBox(height: Reponsive_.crosslength * 0.01),
            CommonDropDown(
                context: context,
                list: singleShiftController.rolesArr,
                mycontrollerValue: singleShiftController.selectRoleValue,
                color: AppColors.white,
              hint: "Select Role",
            ),
          ],
        ),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength / 60),
              child: InterText(
                text: "Number of Positions (Open Shifts)",
                fontSize: Reponsive_.px16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: Reponsive_.crosslength * 0.01),
            CommonDropDown(
                context: context,
                list: singleShiftController.Number_of_Positions_Arr,
                mycontrollerValue:
                    singleShiftController.selectedNumberOfPosition,
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
                text: "Date",
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px16,
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                DateConverter.RangeDatePicker(
                        context: context,
                        monthType: false,
                        dateRang: false,
                        dateType: true)
                    .then((value) {
                  setState(() {
                    singleShiftController.selectedDate.value = value!;
                    print('date>>> $value');
                  });
                });
              },
              child: Container(
                width: cx.width,
                height: cx.height / 13,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterText(
                      text: singleShiftController.selectedDate.value == null ?DateConverter.dateMonthYear(DateTime.parse(singleShiftController.selectedDate.value)) : singleShiftController.selectedDate.value,
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
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength / 60),
              child: InterText(
                text: "Shift Time",
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.px16,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ListView.builder(
                itemCount: timeData.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 35,
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 0,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  singleShiftController.selected_shift_index = index;
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                    shape: BoxShape.circle
                                  ),
                                  child: Image.asset(
                                      singleShiftController
                                                  .selected_shift_index ==
                                              index
                                          ? "assets/x/checkshift.png"
                                          : "assets/x/unchecksift.png",
                                      scale: 3.8,color:singleShiftController.selected_shift_index!=index? AppColors.white:null))),
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
                                singleShiftController.selected_shift_index = index;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            const Gap(10),
            if (singleShiftController.selected_shift_index == 3) ...{
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
                              list: singleShiftController.timeData,
                              mycontrollerValue:
                                  singleShiftController.startTime,
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
                              list: singleShiftController.timeZone,
                              mycontrollerValue:
                                  singleShiftController.startTimeZone,
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
                              list: singleShiftController.timeData,
                              mycontrollerValue: singleShiftController.endTime,
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
                              list: singleShiftController.timeZone,
                              mycontrollerValue:
                                  singleShiftController.endTimeZone,
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
                        height: 10,
                      ),
                      SizedBox(
                        width: Reponsive_.crosslength / 5.5,
                        height: Reponsive_.crosslength / 20,
                        child: AppWidget().getTextField(
                            hintText: "\$45",
                            keyboardType: TextInputType.number,
                            filledColor: AppColors.white,
                            textEditingController:
                                singleShiftController.rateController.value),
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
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Radio(
                            value: "0",
                            groupValue: singleShiftController.calcellation_radio_value.value,
                            fillColor: MaterialStateColor.resolveWith((states) => AppColors.buttonColor),
                            activeColor: AppColors.buttonColor,
                            onChanged: (value) {
                              setState(() {
                                singleShiftController
                                    .calcellation_radio_value.value = "0";
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
                            value: "1",
                            groupValue: singleShiftController.calcellation_radio_value.value,
                            activeColor: AppColors.buttonColor,
                            fillColor: MaterialStateColor.resolveWith((states) => AppColors.buttonColor),
                            onChanged: (value) {
                              setState(() {
                                singleShiftController
                                    .calcellation_radio_value.value = "1";
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
                          Radio(
                            value: "1",
                            groupValue: singleShiftController.incentive_radio_value.value,
                            fillColor: MaterialStateColor.resolveWith((states) => AppColors.buttonColor),
                            activeColor: AppColors.buttonColor,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              setState(() {
                                singleShiftController
                                    .incentive_radio_value.value = "1";
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
                            value: "0",
                            groupValue: singleShiftController.incentive_radio_value.value,
                            fillColor: MaterialStateColor.resolveWith((states) => AppColors.buttonColor),
                            activeColor: AppColors.buttonColor,
                            onChanged: (value) {
                              setState(() {
                                singleShiftController
                                    .incentive_radio_value.value = "0";
                              });
                            },
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

                            list: singleShiftController.incentiveByArr,
                            mycontrollerValue:
                                singleShiftController.selectedIncentiveBy,
                            color: AppColors.white),
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
                          Radio(
                            value: "1",
                            groupValue: singleShiftController.incentive_type_radio_value.value,
                            fillColor: MaterialStateColor.resolveWith((states) => AppColors.buttonColor),
                            activeColor: AppColors.buttonColor,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              setState(() {
                                singleShiftController.incentive_type_radio_value.value = "1";
                              });
                            },
                          ),
                          InterText(
                            text: "\$/hr",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.hintTextGrey,
                          ),
                          Radio(
                            value: "0",
                            groupValue: singleShiftController.incentive_type_radio_value.value,
                            fillColor: MaterialStateColor.resolveWith((states) => AppColors.buttonColor),
                            activeColor: AppColors.buttonColor,
                            onChanged: (value) {
                              setState(() {
                                singleShiftController.incentive_type_radio_value.value = "0";
                              });
                            },
                          ),
                          InterText(
                            text: "Fixed",
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
                        height: Reponsive_.crosslength / 80,
                      ),
                      SizedBox(
                        width: Reponsive_.crosslength / 5.5,
                        height: Reponsive_.crosslength / 20,
                        child: AppWidget().getTextField(
                            filledColor: AppColors.white,
                            keyboardType: TextInputType.number,
                            hintText: "40",
                            textEditingController: singleShiftController
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
                            list: singleShiftController.floorNumberArr,
                            mycontrollerValue:
                                singleShiftController.selectedFloorNo,
                            color: AppColors.white),
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
                            list: singleShiftController.supervisorArr,
                            mycontrollerValue:
                                singleShiftController.selectedSupervisor,
                            color: AppColors.white),
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
              height: 5,
            ),
            AppWidget().getTextField(
                filledColor: AppColors.white,
                maxLine: 5,
                textEditingController:
                    singleShiftController.notesController.value),
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
                        singleShiftController.storeSingleShift(context);
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
                    onTap: () {
                      CommonBottonSheet(
                          context: context,
                          childView: ListView(
                            padding: padding,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              MontserratText(
                                text: "Assign Shift(s)",
                                fontSize: Reponsive_.px24,
                                color: AppColors.blue,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength / 45,
                              ),
                              InterText(
                                text:
                                    "Please select the person to whom you want to assign shift(s).",
                                fontSize: Reponsive_.px16,
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                                maxLines: 2,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength / 20,
                              ),
                              Obx(
                                () =>
                                    employeeEmployeeController
                                                .loadingData.value ==
                                            true
                                        ? Center(
                                            child: CircularProgressIndicator(
                                                color: AppColors.buttonColor),
                                          )
                                        : ListView.builder(
                                            padding: EdgeInsets.only(
                                                top: Reponsive_.crosslength *
                                                    0.01),
                                            itemCount:
                                                employeeEmployeeController
                                                    .employeeList.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              EmployeeList data =
                                                  employeeEmployeeController
                                                      .employeeList[index];
                                              return Obx(() => InkWell(
                                                    onTap: () {
                                                      c.singleSelect(index);
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                        top: Reponsive_
                                                                .crosslength *
                                                            0.018,
                                                        left: Reponsive_
                                                                .crosslength *
                                                            0.015,
                                                        right: Reponsive_
                                                                .crosslength *
                                                            0.015,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            c.facility_emp_selection_arr[
                                                                    index]
                                                                ? 'assets/x/check.png'
                                                                : 'assets/x/uncheck.png',
                                                            height: Reponsive_
                                                                    .crosslength *
                                                                0.028,
                                                          ),
                                                          SizedBox(
                                                            width: Reponsive_
                                                                    .crosslength *
                                                                0.02,
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  height: Reponsive_
                                                                          .crosslength *
                                                                      0.04,
                                                                  width: Reponsive_
                                                                          .crosslength *
                                                                      0.04,
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape.circle,
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(
                                                                            data.imageUrl,
                                                                          ),
                                                                          fit: BoxFit.cover)),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InterText(
                                                                    text:
                                                                        '   ${data.fullname}',
                                                                    color: AppColors
                                                                        .black,
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontSize:
                                                                        Reponsive_.crosslength *
                                                                            0.015,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (index != 0) ...{
                                                            SizedBox(
                                                              width: Reponsive_
                                                                      .crosslength *
                                                                  0.12,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            Reponsive_.crosslength *
                                                                                0.02,
                                                                        vertical:
                                                                            Reponsive_.crosslength *
                                                                                0.007),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(Reponsive_.crosslength *
                                                                                0.02),
                                                                        border: Border.all(
                                                                            color: getBorderColor(c.emp_position_arr[
                                                                                index])),
                                                                        color: getBgColor(
                                                                            c.emp_position_arr[index])),
                                                                    child:
                                                                        InterText(
                                                                      text: data
                                                                          .role,
                                                                      color: getBorderColor(
                                                                          employeeEmployeeController
                                                                              .employeeList[index]),
                                                                      fontSize:
                                                                          Reponsive_.crosslength *
                                                                              0.013,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          }
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                            },
                                          ),
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength * 0.02,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: CommonButton(
                                          text: 'SELECT',
                                          onTap: () {
                                            onBack(context);
                                          },
                                          height:
                                              Reponsive_.crosslength * 0.06)),
                                  SizedBox(
                                    width: Reponsive_.crosslength * 0.01,
                                  ),
                                  Expanded(
                                      child: CommonButton(
                                    text: 'CANCEL',
                                    onTap: () {
                                      onBack(context);
                                    },
                                    color: AppColors.allGray,
                                    height: Reponsive_.crosslength * 0.06,
                                  )),
                                ],
                              ),
                              SizedBox(
                                width: Reponsive_.crosslength * 0.01,
                              ),
                            ],
                          ));
                    },
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

  Color getBorderColor(position) {
    if (position == 'rn') {
      return AppColors.buttonColor;
    } else if (position == 'lpn') {
      return AppColors.dark_purple;
    } else {
      return AppColors.dark_green;
    }
  }

  Color getBgColor(position) {
    if (position == 'Staff') {
      return AppColors.light_yallow;
    } else if (position == 'Manager') {
      return AppColors.light_purple;
    } else {
      return AppColors.light_green;
    }
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
