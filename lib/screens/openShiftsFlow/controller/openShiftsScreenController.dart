import 'package:get/get.dart';

class OpenShiftsScreenController extends GetxController{
  List<String> openShift=[
    "Today",
    "Last 7 Days",
    "Month",
  ];
  var openShiftValue="".obs;
  var checkBoxValue=false.obs;
}