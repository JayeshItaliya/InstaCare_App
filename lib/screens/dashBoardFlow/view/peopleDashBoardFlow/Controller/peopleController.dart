import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeopleController extends GetxController{
  /// Account Information TextController
  var firstNameController=TextEditingController(text: "Granny").obs;
  var lastNameController=TextEditingController(text: "Joel").obs;
  var emailController=TextEditingController(text: "joelnewman@gmail.com").obs;
  var mobileNumberController=TextEditingController(text: "8888888888").obs;

  var docValue="Document Name".obs;
  var pointValue=0.obs;
  var dateValue=false.obs;
  var shiftValue=false.obs;
  var shiftListValue="Select Shift".obs;
  var selectReasionValue="Select Reason".obs;
  RxList documentList=[].obs;

  List<RxBool> switchValues = List.generate(2, (_) => false.obs);

  List<String> switchName = [
    "Send Email Notifications",
    "Send Text Message",
  ];

  void toggleSwitch(int index, bool value) {
    switchValues[index].value = value;
    if (kDebugMode) {
      print("switchValue==>$value");
    }
  }

  List<String> docTypeList=[
    "Pan Card",
    "Driver Licence",
  ];

  List<String> shiftList=[
    "01:00",
    "02:00",
  ];

  List<String> selectReasion=[
    "01:00",
    "02:00",
    "02:00",
    "02:00",
    "02:00",
  ];
}