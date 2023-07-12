import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:instacare/Utils/appUrl.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/Utils/storeToken.dart';
import 'package:http/http.dart' as http;
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/view/shiftDetials.dart';


class BulkUplodeController extends GetxController {


  uplodeExcle(String excle,BuildContext context)async{
    dynamic userLoginToken;
    await StorageUtil.getData(StorageUtil.userLoginToken).then((value) {
      userLoginToken = value;
    });
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AppUrl.uplodeExcle),);
      request.headers.addAll({
        'Authorization': 'Bearer ${userLoginToken}'
      });
      request.files.add(await http.MultipartFile.fromPath('excel_file', excle));
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print(response.statusCode);
      print(response.body);
      if(response.statusCode==200){
        toastMessageSuccess("Upload done successfully");
        toPushNavigator(context: context,PageName: ShiftDeatils());
      }
    } on SocketException {
      toastMessageError("No Internet Connection");
    }on TimeoutException {
      toastMessageError("Connection Time OUt");
    }on Error catch(e) {
      print(e.stackTrace.toString());
      toastMessageError("Something Went Wrong");
    }
  }
}