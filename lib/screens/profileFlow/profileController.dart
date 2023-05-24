import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  List<RxBool> switchValues = List.generate(3, (_) => false.obs);

  List<String> switchName = [
    "Send Email Notifications",
    "Send Reminders",
    "Send Confirmations",
  ];

  void toggleSwitch(int index, bool value) {
    switchValues[index].value = value;
    if (kDebugMode) {
      print("switchValue==>$value");
    }
  }

}