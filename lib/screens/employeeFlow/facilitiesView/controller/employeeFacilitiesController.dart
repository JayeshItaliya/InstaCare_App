import 'package:get/get.dart';

class EmployeeFacilitiesController extends GetxController {

  RxInt selectedValue = 0.obs;
  RxString dallyServicesValue = "".obs;

  var shiftValue="Select Shift".obs;
  var selectedDate="Select Date".obs;

  List<String> dallyServices = [
    "Based on my availability",
    "Specific Shift",
  ];


  List<String> shift = [
    "Morning",
    "AfterNon"
    "Night",
  ];
}