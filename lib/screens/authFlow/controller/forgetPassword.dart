import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appUrl.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/Utils/storeToken.dart';
import 'package:instacare/data/serverResponse/networkApiServices.dart';
import 'package:instacare/screens/authFlow/view/forgotPasswordMessage.dart';

class ForgetPasswordController extends GetxController{
  
  final emailController=TextEditingController().obs;
  final _apiServices = NetWorkApiServices();



  void forgetPassword(BuildContext context)async{
    loadingDialog();
    var body={
      'email': emailController.value.text.trim()
    };
    try{
      var response=await _apiServices.postResponse(AppUrl.forgotPassword, body,);
      print(response);
      if(response["status"]==1){
        showSuccessDialog(response["message"]);
        toPushNavigator(context: context,PageName: ForgotPasswordMessage());
      }
      else if(response["status"]==0){
        showSuccessDialog(response["message"]);
      }
    }
    catch(e){
      showErrorDialog("Something Waiting Wrong OOPS!");
    }
  }
}