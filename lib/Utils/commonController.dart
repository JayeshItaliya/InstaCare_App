import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CommonController extends GetxController{
  late List<Widget> screens = [];
  late List<dynamic> title = [];
  late List<dynamic> drowerTitle = [];
  late List<dynamic> image = [];
  var height=Get.height;
  var width=Get.width;
  //final storage = GetStorage();
  StreamSubscription? subscription;
  var isoffline = false.obs;
  String instacareLoginValue="";
  // dynamic read(String key){
  //   return storage.read('$key');
  //
  // }
  // void write(String key,var value){
  //   storage.write('$key',value);
  // }
  @override
  void onInit() {
    super.onInit();
    checkNetwork();
  }


  checkNetwork() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {

        isoffline.value = true;
      } else if (result == ConnectivityResult.mobile) {
        isoffline.value = false;
      } else if (result == ConnectivityResult.wifi) {
        isoffline.value = false;
      } else {
        Get.snackbar("Network Error", "Failed to get network connection");
        isoffline.value = false;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription?.cancel();
  }
}