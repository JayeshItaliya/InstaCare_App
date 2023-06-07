import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:intl/intl.dart';

class DateConverter {
  final cx=Get.put(CommonController());
  static String formatDate(DateTime dateTime) {
    return DateFormat('d MMMM yyyy').format(dateTime);
  }

  static String dateMonthYear(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  static DateTime convertStringTimeToDate(String time) {
    return DateFormat('HH:mm').parse(time);
  }

  static Future<String?> displayTimeDialog(BuildContext context) async {
    String? selectedTime;
    final TimeOfDay? time =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) {
        selectedTime = time.format(context);
        print(selectedTime.runtimeType);
    }
    return selectedTime;
  }
  List<DateTime?> rangeDatePickerValueWithDefaultValue = [];
  static  Future<String?> RangeDatePicker({required BuildContext context,required bool monthType,required bool dateRang}) async {
    String? currentDate;
    String? currentDateMonth;
    String? startDate;
    String? endDate;
    var results = (await showCalendarDatePicker2Dialog(
      context: context,
      dialogBackgroundColor: AppColors.backGroundColor,
      barrierDismissible: false,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType:dateRang==true?CalendarDatePicker2Type.range:CalendarDatePicker2Type.single,
        weekdayLabels: [
          "SUN",
          "MON",
          "TUE",
          "WED",
          "THU",
          "FRI",
          "SAT",
        ],
        centerAlignModePicker: true,
        dayBorderRadius: BorderRadius.circular(20),
        selectedDayTextStyle: TextStyle(color: AppColors.white),
        selectedDayHighlightColor: AppColors.blue,
        currentDate: DateTime.now(),
        dayTextStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: const Color.fromRGBO(2, 5, 10, 1)),
        lastDate: DateTime.now(),
      ),
      dialogSize: const Size(325, 400),
      borderRadius: BorderRadius.circular(15),
    ));

    if(monthType==true){
      print("dateValue1");
     return currentDateMonth=DateConverter.formatDate(DateTime.parse(results![0].toString()));
    }
    else if(monthType==true){
      print("dateValue2");

      return currentDate = DateConverter.dateMonthYear(DateTime.parse(results![0].toString()));
    }
    else if(dateRang==true){
      print("dateValue3");
      startDate = results![0].toString().substring(0, 10);
      endDate = results[1].toString().substring(0, 10);
      return "$startDate to $endDate";
    }
  }
}