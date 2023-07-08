import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeCardEditController extends GetxController{
  var selectedShift=''.obs;
  var selectedFacility=''.obs;
  var selectedEmp=''.obs;
  var selectedAddress=''.obs;
  var startDateController = TextEditingController(text: 'Wed, Feb 01 2023').obs;
  var startTimeController =
  TextEditingController(text: '07:00 AM').obs;
  var endDateController =
  TextEditingController(text: 'Wed, Feb 16 2023').obs;
  var endTimeController =
  TextEditingController(text: '03:00 PM').obs;

  List<String> shiftsArr=[
    "12 March, 2023  7:00AM - 3:00PM",
    "13 March, 2023  7:00AM - 3:00PM",
    "14 March, 2023  7:00AM - 3:00PM",
    "15 March, 2023  7:00AM - 3:00PM",
  ];

  List<String> facilityArr=[
    "Care Center - LPN",
    "A Care Center",
    "B Care Center",
    "C Care Center",
  ];

  List<String> empArr=[
    "Emp1",
    "Emp2",
    "Emp3",
    "Emp4",
  ];

  List<String> addressArr=[
    "Address1",
    "Address2",
    "Address3",
    "Address4",
  ];

  String getTakenTime(){
    try {
      DateFormat inputFormat = DateFormat('EE, MMM dd yyyy hh:mm a');
      DateTime start = inputFormat.parse(startDateController.value.text+" "+startTimeController.value.text);
      DateTime end = inputFormat.parse(endDateController.value.text+" "+endTimeController.value.text);
      return '${end.difference(start).toString().split(':')[0]} Hours ${end.difference(start).toString().split(':')[1]} Minutes';
    } catch (e) {
      return '---';
    }
  }
}