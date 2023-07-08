import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleShiftController extends GetxController{
  final rateController=TextEditingController(text: "\$45").obs;
  final GlobalKey<PopupMenuButtonState> popUpFacilityKey = GlobalKey();
 final GlobalKey<PopupMenuButtonState> popUpRoleKey = GlobalKey();
 final GlobalKey<PopupMenuButtonState> popUpNumberKey = GlobalKey();

  final GlobalKey<PopupMenuButtonState> startTime = GlobalKey();
  final GlobalKey<PopupMenuButtonState> startTimeZone = GlobalKey();
  final GlobalKey<PopupMenuButtonState> endTime = GlobalKey();
  final GlobalKey<PopupMenuButtonState> endTimeZone = GlobalKey();
  final GlobalKey<PopupMenuButtonState> incentiveBy = GlobalKey();
  final GlobalKey<PopupMenuButtonState> floorNumberKey = GlobalKey();
  final GlobalKey<PopupMenuButtonState> supervisorKey = GlobalKey();


var selectFacilityValue="Select Facility".obs;
var selectRoleValue="Select Role".obs;
var selectNumberValue="Select Number1".obs;
var incentiveByValue="Select".obs;

var setTime="01:00".obs;
var setTimeZone="AM".obs;

var selectFacility=[
  "Demo",
  "Test",
].obs;


var selectRole=[
  "Demo",
  "Test",
].obs;

var selectNumber=[
  "01",
  "02",
  "03",
  "04",
  "05",
].obs;

  var timeData=[
    "1:00",
    "2:00",
    "3:00",
    "4:00",
    "5:00",
    "6:00",
    "7:00",
    "8:00",
    "9:00",
    "10:00",
    "11:00",
    "12:00",
  ].obs;

  var timeZone=[
    "AM",
    "PM",
  ].obs;

  var incentiveByList=[
    "Instacare",
    "Instacare1",
  ].obs;
}