import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instacare/Utils/appColor.dart';

loadingDialog(){
  return SVProgressHUD.showProgress(0.10, status: 'Loading...',);
}

showSuccessDialog(String message){
  return SVProgressHUD.showSuccess(status:message);
}

showErrorDialog(String error){
  return SVProgressHUD.showError(status: error);
}
toastMessageError(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.redColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG);
}
toastMessageSuccess(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.deepGreen,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG);
}

