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
/// Account Information TextController
var fullNameController=TextEditingController(text: "Joel Newman").obs;
var firstNameController=TextEditingController(text: "Joel").obs;
var lastNameController=TextEditingController(text: "Newman").obs;
var emailController=TextEditingController(text: "joelnewman@gmail.com").obs;
var mobileNumberController=TextEditingController(text: "8888888888").obs;

/// Address TextController
var countryController="Select".obs;
List<String> list=[
  "United States",
  "UK States",
  "Canada",
  "Europe",
  "India",
];
var cityNameController=TextEditingController(text:"Skokie").obs;
var stateController=TextEditingController(text: "Illinois").obs;
var zipController=TextEditingController(text: "60077").obs;


/// general TextController
  List<String> timeZone=[
    "Central Time (US/Can) (GMT-6...",
    "India (US/Can) (GMT-6...",
    "Canada (US/Can) (GMT-6...",
  ];

  List<String> timeLanguage=[
    "English",
    "Hindi",
    "Canada",
  ];
}