import 'package:get/get.dart';

class EmployeeTimeController extends GetxController{

  RxInt selectedTile = (-1).obs;
  var selectReasonValue="Select the reason".obs;
  List<String>  selectReasonList=[
    "Test 1",
    "Test 2",
    "Test 3",
    "Test 4",
    "Test 5",
  ];
}