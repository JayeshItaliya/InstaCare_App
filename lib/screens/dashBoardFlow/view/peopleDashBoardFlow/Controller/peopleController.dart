

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/model/peopleDetialModel.dart';
import 'package:instacare/screens/dashBoardFlow/view/peopleDashBoardFlow/modelView/modelView.dart';

class PeopleController extends GetxController{
  /// Account Information TextController
  var firstNameController=TextEditingController().obs;
  var lastNameController=TextEditingController().obs;
  var emailController=TextEditingController().obs;
  var mobileNumberController=TextEditingController().obs;

  var docValue="Document Name".obs;
  var pointValue=0.obs;
  var dateValue=false.obs;
  var shiftValue=false.obs;
  var shiftListValue="".obs;
  var selectReasionValue="".obs;
  RxInt index=(-1).obs;
  RxList documentList=[].obs;

  List<RxBool> switchValues = List.generate(2, (_) => false.obs);

var emailSwitchValue=false.obs;
var messageSwitchValue=false.obs;

  List<String> switchName = [
    "Send Email Notifications",
    "Send Text Message",
  ];

  void toggleSwitch(int index, bool value) {
    switchValues[index].value = !value;
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
    "Test",
    "Test1",
  ];

  PeopleGetData peopleGetData=PeopleGetData();
  late PeopleDetialModel peopleDetialModel;
  var loadingValue=false.obs;
  getData(int id){
    loadingValue.value=true;
    try {
      print(id.toString());
      print(id.runtimeType);
      peopleGetData.getPeopleData(id).then((value){
            print(value);
            if(value!=null){
              peopleDetialModel=value;
              firstNameController.value.text=peopleDetialModel.peopledata.fname.toString();
              lastNameController.value.text=peopleDetialModel.peopledata.lname.toString();
              emailController.value.text=peopleDetialModel.peopledata.email.toString();
              mobileNumberController.value.text=peopleDetialModel.peopledata.phone.toString();
              emailSwitchValue.value=peopleDetialModel.peopledata.userNotificationSettings.email==1;
              messageSwitchValue.value=peopleDetialModel.peopledata.userNotificationSettings.text==1;
              print(value.peopledata.fullname);
              loadingValue.value=false;
            }
            else{
              loadingValue.value=false;
              print("data has Not Found");
            }
          });
    } catch (e) {
      loadingValue.value=false;
      print("Error>>>>>>>");
      print(e);
    }
  }
}