import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appUrl.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/data/serverResponse/networkApiServices.dart';
import 'package:instacare/screens/profileFlow/controller/profileController.dart';

class ChangeStatusController extends GetxController{
  final cx=Get.put(CommonController());
  final profileController=Get.put(ProfileController());
  var changeStatusValue="".obs;


  @override
  void onInit() {
    //status = statusValue[int.parse(cx.status)-1].obs;
    print("+++++++ $status");
    print(cx.status);
    super.onInit();
  }
  final _apiServices = NetWorkApiServices();

  List<String> statusValue = ["Available", "Away", "Busy", "DND", "Offline"];
  var status = "".obs;

  void changeStatus(BuildContext context)async{
    var body={
      'status': changeStatusValue.value.toString().trim(),
    };
    try{
      var response=await _apiServices.postResponse(AppUrl.chnageStaus, body,);
      print(response);
      if(response["status"]==1){
        //toastMessageSuccess(response["message"]);
        profileController.get_profile_data();
      }
      else if(response["status"]==0){
        //toastMessageError(response["message"]);
      }
    }
    catch(e){
      showErrorDialog("Something Went Wrong OOPS!");
    }
  }
}