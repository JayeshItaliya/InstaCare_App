import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appUrl.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/Utils/storeToken.dart';
import 'package:instacare/model/getProfileModel.dart';

import '../../../Utils/loader.dart';
import '../../../data/serverResponse/networkApiServices.dart';

class ProfileController extends GetxController {

  @override
  Future<void> onInit() async {
    super.onInit();
    get_profile_data();
  }


  List<RxBool> switchValues = List.generate(3, (_) => false.obs);
  var role = "".obs;
  var id = 0.obs;
  var status = "0".obs;
  var loading = true.obs;
  var img_url = ''.obs;


  List<String> switchName = [
    "Send Email Notifications",
    "Send Reminders",
    "Send Confirmations",
  ];

  void toggleSwitch(int index, bool value) {
    switchValues[index].value = !value;
    if (kDebugMode) {
      print("switchValue==>$value");
    }
  }

  /// Account Information TextController
  var fullNameController = TextEditingController(text: "Joel Newman").obs;
  var firstNameController = TextEditingController(text: "Joel").obs;
  var lastNameController = TextEditingController(text: "Newman").obs;
  var emailController = TextEditingController(text: "joelnewman@gmail.com").obs;
  var mobileNumberController = TextEditingController(text: "8888888888").obs;

  /// Address TextController
  var countryController = "Select".obs;
  List<String> list = [
    "United States",
    "UK States",
    "Canada",
    "Europe",
    "India",
    "Afghanistan",
  ];
  var cityNameController = TextEditingController(text: "Skokie").obs;
  var stateController = TextEditingController(text: "Illinois").obs;
  var zipController = TextEditingController(text: "60077").obs;

  /// general TextController
  var timeZoneController = "Select".obs;
  List<String> timeZone = [
    "Central Time",
    "India Time",
    "Canada Time",
    '(UTC-12:00) International Date Line West'
  ];

  var languageController = "Select".obs;
  List<String> timeLanguage = [
    "English",
    "Hindi",
    "Canada",
  ];

  var selectedSize = "Select".obs;
  List<String> uniformSizeArr = [
    "XL",
    "XXL",
  ];

  /// resetPassword Controller
  var currentPassword = TextEditingController().obs;
  var newPassword = TextEditingController().obs;
  var confirmPassword = TextEditingController().obs;

  NetWorkApiServices _apiService = NetWorkApiServices();

  Future<void> change_pwd(BuildContext context) async {
    try {
      var res = await _apiService.postResponse(AppUrl.reser_pwd,{
        'current_password': currentPassword.value.text.toString().trim(),
        'new_password':newPassword.value.text.toString().trim(),
        'confirm_password': confirmPassword.value.text.toString().trim(),
      });
      if (res["status"]==1) {
            showSuccessDialog(res["message"]);
            Navigator.of(context).pop();
          }else{
        showErrorDialog(res["message"]);
      }

    } catch (e) {
      print(e);
    }
  }
  final cx=Get.put(CommonController());
  Future<void> get_profile_data() async {

    var res = await _apiService.getResponse(AppUrl.profile);
    GetProfile profile = GetProfile.fromJson(res);
    print(profile.toString());
    loading(false);
    fullNameController = TextEditingController(text: '${profile.userdata!.fname!} ${profile.userdata!.lname!}').obs;
    firstNameController = TextEditingController(text: profile.userdata!.fname).obs;
    lastNameController = TextEditingController(text: profile.userdata!.lname).obs;
    emailController = TextEditingController(text: profile.userdata!.email).obs;
    mobileNumberController = TextEditingController(text: profile.userdata!.phone).obs;
    languageController = profile.userdata!.language!.obs;
    timeZoneController = profile.userdata!.timezone!.obs;
    countryController = profile.userdata!.country!.obs;
    role = profile.userdata!.role!.obs;
    id = profile.userdata!.id!.obs;
    status = profile.userdata!.status!.toString().obs;
    img_url = profile.userdata!.imageUrl!.toString().obs;
    cityNameController = TextEditingController(text: profile.userdata!.city!).obs;
    stateController = TextEditingController(text: profile.userdata!.state!).obs;
    zipController = TextEditingController(text: profile.userdata!.zipcode!).obs;
    selectedSize = "Select".obs;
    StorageUtil.setData(StorageUtil.fullName,profile.userdata?.fullname.toString());
    StorageUtil.setData(StorageUtil.profileImage,profile.userdata?.imageUrl.toString());
    StorageUtil.getData(StorageUtil.profileImage).then((value) => cx.profileImage=value);
    StorageUtil.getData(StorageUtil.fullName).then((value) => cx.fullName=value);
    print("updateData");
    print(fullNameController.value.text);
    print(fullNameController.value.text);
    print(lastNameController.value.text);
  }

  Future<void> update_profile(BuildContext context,{File? file}) async {

    dynamic responseJson;
    var userLoginToken;
    await StorageUtil.getData(StorageUtil.userLoginToken).then((value){
      print(value);
      userLoginToken=value.toString();
    });
    try {
      var request = http.MultipartRequest('POST', Uri.parse(AppUrl.profile),);
      print("userToken===>${userLoginToken.toString()}");
      request.headers.addAll({
        'Authorization': 'Bearer $userLoginToken'
      });
      request.fields['fname'] = firstNameController.value.text.toString();
      request.fields['lname'] = lastNameController.value.text.toString();
      request.fields['phone'] = mobileNumberController.value.text.toString();
      request.fields['email'] = emailController.value.text.toString();
      request.fields['country'] = countryController.value.toString();
      request.fields['state'] = stateController.value.text.toString();
      request.fields['city'] = cityNameController.value.text.toString();
      request.fields['zipcode'] = zipController.value.text.toString();
      request.fields['timezone'] = timeZoneController.value.toString();
      request.fields['language'] = languageController.value.toString();
      if (file!=null) {
        request.files.add(http.MultipartFile.fromBytes('image', File(file.path).readAsBytesSync(),filename: file.path));
      }
      var res = await request.send();
      var response = await http.Response.fromStream(res);
        responseJson = jsonDecode(response.body);
        print('update profile res $responseJson');
        if(response.statusCode==200){
          toastMessageSuccess(responseJson["message"]);
          await get_profile_data();
          onBack(context);
        }

  }on SocketException {
      toastMessageError("No Internet Connection");
    }on TimeoutException {
      toastMessageError("Connection Time OUt");
    }on Error catch(e) {
      print(e.stackTrace.toString());
      toastMessageError("Something Waiting Wrong");
    }

}}
