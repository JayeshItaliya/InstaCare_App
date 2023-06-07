import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeopleController extends GetxController{
  /// Account Information TextController
  var firstNameController=TextEditingController(text: "Granny").obs;
  var lastNameController=TextEditingController(text: "Joel").obs;
  var emailController=TextEditingController(text: "joelnewman@gmail.com").obs;
  var mobileNumberController=TextEditingController(text: "8888888888").obs;

  var docValue="".obs;

  List<String> docTypeList=[
    "Pan Card",
    "Driver Licence",
  ];
}