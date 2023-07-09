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
  var isoffline = false.obs;
  String instacareLoginValue="instacare";
  String firstName="";
  String lastName="";
  String fullName="";
  String profileImage="";
  String role="";
  String status="";
  final formKey = GlobalKey<FormState>();
}