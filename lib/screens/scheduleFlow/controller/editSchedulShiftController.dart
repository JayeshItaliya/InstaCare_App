import 'package:get/state_manager.dart';

class EditScheduleShiftController extends GetxController{

  var facilityValue ="".obs;
  var roleValue ="".obs;
  var numberOfPositionValue ="".obs;
  var startDate ="Start Date".obs;
  var endDate ="End Date".obs;

  List<String> facilityList=[
    "Elevate Care North Branch 1",
    "Elevate Care North Branch 2",
    "Elevate Care North Branch 3",
  ];
  List<String> roleList=[
    "LPN 1",
    "LPN 2",
    "LPN 3",
  ];
  List<String> numberOfPositionList=[
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
  ];
  List<String> shiftTime=[
    "Morning Shift:  7:00AM - 3:00PM",
    "Noon Shift:  3:00PM - 11:00PM",
    "Night Shift:  11:00PM - 7:00AM",
    'Custom'
  ].obs;
  RxInt selectedIndex=(-1).obs;

  Incentives incentives = Incentives.Yes;
  IncentiveType incentiveType = IncentiveType.$hr;

}
enum Incentives { Yes, No, }
enum IncentiveType { $hr, Fixed, }