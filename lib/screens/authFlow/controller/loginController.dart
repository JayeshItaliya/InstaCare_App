import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appUrl.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/Utils/storeToken.dart';
import 'package:instacare/data/serverResponse/networkApiServices.dart';
import 'package:instacare/model/loginModel.dart';
import 'package:instacare/screens/dashBoardFlow/view/dashBoardMainScreen.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final _apiServices = NetWorkApiServices();

  void loginApi(BuildContext context)async{
    loadingDialog();
    var data = {
      'email': emailController.value.text.trim(),
      'password': passwordController.value.text.trim()
    };
    print(data);
    var errorData;
    try{
      var response=await _apiServices.postResponse(AppUrl.login, data,);
      errorData=response;
      print(response);
      if(errorData["status"]==1){
        LoginModel loginData=LoginModel.fromJson(response);
        StorageUtil.setData(StorageUtil.loginValue,true);
        StorageUtil.setData(StorageUtil.userLoginToken,loginData.token.toString());
        StorageUtil.setData(StorageUtil.firstName,loginData.userdata.fname.toString());
        StorageUtil.setData(StorageUtil.lastName,loginData.userdata.lname.toString());
        StorageUtil.setData(StorageUtil.profileImage,loginData.userdata.imageUrl.toString());
        StorageUtil.setData(StorageUtil.role,loginData.userdata.role.toString());
        StorageUtil.setData(StorageUtil.fullName,loginData.userdata.fullname.toString());
        StorageUtil.setData(StorageUtil.status,loginData.userdata.status.toString());
        showSuccessDialog(loginData.message);
        await offNavigator(context: context,PageName: DashBoardScreen());
      }
      else if(response["status"]==0){
        showErrorDialog(response["message"]);
      }
    }
    catch (e){
      showErrorDialog(errorData["errors"]["password"][0]);
      print(e.toString());
    }
  }
}
