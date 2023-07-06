import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Commonwidgets.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:intl/intl.dart';

import '../controller/controller/timecardEditController.dart';

class TimecardEdit extends StatefulWidget {
  bool newTimeCard;
  TimecardEdit({this.newTimeCard=false,super.key});

  @override
  State<TimecardEdit> createState() => _TimecardEditState();
}

class _TimecardEditState extends State<TimecardEdit> {
  final timecardEditController = Get.put(TimeCardEditController());


  TextEditingController _notesController = TextEditingController(
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus finibus nibh in sem volutpat sagittis.');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.newTimeCard) {
      timecardEditController.startDateController.value=TextEditingController(text: '');
      timecardEditController.endDateController.value=TextEditingController(text: '');
      timecardEditController.startTimeController.value=TextEditingController(text: '');
      timecardEditController.endTimeController.value=TextEditingController(text: '');
      timecardEditController.selectedShift.value='';
      timecardEditController.selectedFacility.value='';
      timecardEditController.selectedEmp.value='';
      timecardEditController.selectedAddress.value='';
    }else{
      timecardEditController.startDateController.value=TextEditingController(text: 'Wed, Feb 01 2023');
      timecardEditController.endDateController.value=TextEditingController(text: 'Wed, Feb 16 2023');
      timecardEditController.startTimeController.value=TextEditingController(text: '7:00 AM');
      timecardEditController.endTimeController.value=TextEditingController(text: '3:00 PM');
      timecardEditController.selectedShift.value='12 March, 2023  07:00AM - 03:00PM';
      timecardEditController.selectedFacility.value='Care Center - LPN';
      timecardEditController.selectedEmp.value='Emp1';
      timecardEditController.selectedAddress.value='Address1';
    }
  }

  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text:widget.newTimeCard==true?'Add Timecard':"Timecard Edit" ,
          fontSize: Reponsive_.px24,
          fontWeight: FontWeight.w700,
          color: AppColors.blue,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: Reponsive_.crosslength * 0.02,
            vertical: Reponsive_.crosslength * 0.02),
        children: [
          SizedBox(
            height: Reponsive_.crosslength * 0.01,
          ),
          InterText(
            text: '    Facility',
            fontSize: Reponsive_.px16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.005,
          ),
          CommonDropDown(
              context: context,
              list: timecardEditController.facilityArr,
              mycontrollerValue: timecardEditController.selectedFacility,
              hint: 'Select Facility',
              color: AppColors.white),
          SizedBox(
            height: Reponsive_.crosslength * 0.015,
          ),
          InterText(
            text: '    Employee',
            fontSize: Reponsive_.px16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.005,
          ),
          CommonDropDown(
              context: context,
              list: timecardEditController.empArr,
              mycontrollerValue: timecardEditController.selectedEmp,
              hint: 'Select Employee',
              color: AppColors.white),
          SizedBox(
            height: Reponsive_.crosslength * 0.015,
          ),
          InterText(
            text: '    Accepted Shifts',
            fontSize: Reponsive_.px16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.005,
          ),
          CommonDropDown(
              context: context,
              list: timecardEditController.shiftsArr,
              mycontrollerValue: timecardEditController.selectedShift,
              hint: 'Select Shifts',
              color: AppColors.white),
          SizedBox(
            height: Reponsive_.crosslength * 0.015,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: '    Start Date',
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength * 0.005,
                    ),
                     Obx(
                         ()=> AppWidget().getTextField(
                            textEditingController: timecardEditController.startDateController.value,
                            isReadOnly: true,
                            inputTextStyle: GoogleFonts.inter(
                                color: AppColors.black,
                                fontSize: Reponsive_.px16,
                                fontWeight: FontWeight.w400),
                            onTapFunction: () {
                              DateConverter.RangeDatePicker(
                                  context: context,
                                  monthType: false,
                                  dateRang: false,
                                dateType: true
                              ).then((value){
                                DateFormat inputFormat = DateFormat('dd/MM/yyyy');
                                DateTime input = inputFormat.parse(value!);
                                String datee = DateFormat('EE, MMM dd yyyy').format(input);
                               timecardEditController.startDateController.value=TextEditingController(text: datee);
                              });
                            },
                            filledColor: AppColors.white),
                     ),
                  ],
                ),
              ),
              SizedBox(
                width: Reponsive_.crosslength * 0.015,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: '    Start Time',
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength * 0.005,
                    ),
                    Obx(
                        ()=> AppWidget().getTextField(
                          textEditingController: timecardEditController.startTimeController.value,
                          isReadOnly: true,
                          inputTextStyle: GoogleFonts.inter(
                              color: AppColors.black,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w400),
                          onTapFunction: () {
                            DateConverter.timePicker(context).then((value){
                              DateFormat inputFormat = DateFormat('hh:mm');
                              DateTime input = inputFormat.parse('${value!.hour.toString()}:${value!.minute.toString()}');
                              String time = DateFormat('hh:mm a').format(input);
                              timecardEditController.startTimeController.value=TextEditingController(text: time);
                            });
                          },
                          filledColor: AppColors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.015,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: '    End Date',
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength * 0.005,
                    ),
                    Obx(
                          ()=> AppWidget().getTextField(
                          textEditingController: timecardEditController.endDateController.value,
                          isReadOnly: true,
                          inputTextStyle: GoogleFonts.inter(
                              color: AppColors.black,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w400),
                          onTapFunction: () {
                            DateConverter.RangeDatePicker(
                                context: context,
                                monthType: false,
                                dateRang: false,
                                dateType: true
                            ).then((value){
                              DateFormat inputFormat = DateFormat('dd/MM/yyyy');
                              DateTime input = inputFormat.parse(value!);
                              String datee = DateFormat('EE, MMM dd yyyy').format(input);
                              timecardEditController.endDateController.value=TextEditingController(text: datee);
                            });
                          },
                          filledColor: AppColors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Reponsive_.crosslength * 0.015,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: '    End Time',
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength * 0.005,
                    ),
                    Obx(
                          ()=> AppWidget().getTextField(
                          textEditingController: timecardEditController.endTimeController.value,
                          isReadOnly: true,
                          inputTextStyle: GoogleFonts.inter(
                              color: AppColors.black,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w400),
                          onTapFunction: () {
                            DateConverter.timePicker(context).then((value){
                              DateFormat inputFormat = DateFormat('hh:mm');
                              DateTime input = inputFormat.parse('${value!.hour.toString()}:${value!.minute.toString()}');
                              String time = DateFormat('hh:mm a').format(input);
                              timecardEditController.endTimeController.value=TextEditingController(text: time);
                            });
                          },
                          filledColor: AppColors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.015,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.light_blue.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            padding: EdgeInsets.symmetric(
                horizontal: Reponsive_.crosslength * 0.02,
                vertical: Reponsive_.crosslength * 0.018),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.access_time, color: AppColors.blue, size: 15),
                Obx(
                  ()=> InterText(
                    text: '  ${timecardEditController.getTakenTime()}',
                    fontWeight: FontWeight.w400,
                    fontSize: Reponsive_.px16,
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.015,
          ),
          InterText(
            text: '    Address',
            fontSize: Reponsive_.px16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.005,
          ),
          CommonDropDown(
              context: context,
              list: timecardEditController.addressArr,
              mycontrollerValue: timecardEditController.selectedAddress,
              hint: 'Select Address',
              color: AppColors.white),
          SizedBox(
            height: Reponsive_.crosslength * 0.015,
          ),
          InterText(
            text: '    Notes',
            fontSize: Reponsive_.px16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.005,
          ),
          AppWidget().getTextField(
            textEditingController: _notesController,
            maxLine: 3,
            filledColor: AppColors.white,
            inputTextStyle: GoogleFonts.inter(
                color: AppColors.black,
                fontSize: Reponsive_.px16,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.025,
          ),
          Row(
            children: [
              Expanded(child: CommonButton(text: 'SAVE', onTap: () {
                onBack(context);
              })),
              SizedBox(
                width: Reponsive_.crosslength * 0.005,
              ),
              Expanded(
                  child: CommonButton(
                text: 'CANCEL',
                onTap: () {
                  onBack(context);
                },
                color: AppColors.allGray,
              ))
            ],
          ),
        ],
      ),
    );
  }

  String getDateTime(DateTime dateTime) {
    // final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('EEEE, MMMM dd yyyy');
    return formatter.format(dateTime.toLocal());
  }
}
