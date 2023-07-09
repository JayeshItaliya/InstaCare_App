import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/Utils/storeToken.dart';
import 'package:instacare/data/serverResponse/baseApiServices.dart';

class NetWorkApiServices extends BaseApiServices {


  /// get Response
  @override
  Future getResponse(String url) async {
    dynamic userLoginToken;
    await StorageUtil.getData(StorageUtil.userLoginToken).then((value) {
     userLoginToken = value;
    });
    var headers = {
      'Authorization': 'Bearer ${userLoginToken}'
    };
    print("header=>$headers");
    print("Url=>$url");
    dynamic responseJson;
    try {
      if(userLoginToken!=null){
        var request = http.Request('GET', Uri.parse(url));
        request.headers.addAll(headers);
        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);
        print("***** Api Call Successfully *****");
        responseJson = returnResponse(response);
      }
      else{
        toastMessageError("Token is Null");
      }
    } on SocketException {
      toastMessageError("No Internet Connection");
    }on TimeoutException {
      toastMessageError("Connection Time OUt");
    }on Error catch(e) {
      print(e.stackTrace.toString());
      toastMessageError("Something Waiting Worng");
    }
    return responseJson;
  }


/// pst Response
  @override
  Future postResponse(String url, dynamic data) async {
    dynamic responseJson;
    dynamic userLoginToken;
    await StorageUtil.getData(StorageUtil.userLoginToken).then((value) {
      userLoginToken = value;
    });
    print("apiUrl==>>${url}");
    print("postData==>>${data}");
    print("header==>>${userLoginToken}");
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url),);
      request.headers.addAll({
        'Authorization': 'Bearer $userLoginToken'
      });
      request.fields.addAll(data);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      responseJson = returnResponse(response);
    } on SocketException {
      toastMessageError("No Internet Connection");
    }on TimeoutException {
      toastMessageError("Connection Time OUt");
    }on Error catch(e) {
      print(e.stackTrace.toString());
      toastMessageError("Something Waiting Ring");
    }
    return responseJson;
  }


/// Api Response
  dynamic returnResponse(http.Response response) {
    print("statusCode=>>${response.statusCode}");
    switch (response.statusCode) {
      case 200:dynamic responseJson = jsonDecode(response.body);
      return responseJson;
      case 500:throw toastMessageError("Server Error OOPS!");
      default:toastMessageError("Error accured while communication with server with status Ced${response.statusCode}");
    }
  }

}
