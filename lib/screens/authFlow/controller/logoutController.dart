import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appUrl.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/Utils/storeToken.dart';
import 'package:instacare/data/serverResponse/networkApiServices.dart';
import 'package:instacare/screens/authFlow/view/loginScreen.dart';

class LogOutController extends GetxController{
  final _apiServices = NetWorkApiServices();
  void logOut(BuildContext context)async{
    loadingDialog();
    try{
      var response=await _apiServices.getResponse(AppUrl.logOut);
      if(response["status"]==1){
        showSuccessDialog("User Logged Out Successfully");
        offNavigator(context: context,PageName: LoginScreen());
        StorageUtil.clearData();
      }
      else{
        showErrorDialog("Unauthenticated");
      }
    }
    catch(e){
      showErrorDialog(e.toString());
    }
  }
}