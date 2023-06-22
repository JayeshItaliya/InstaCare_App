import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MyAvailabilityController extends GetxController {
  RxString selected_week_option = '15 May - 21 May 2023'.obs;
  RxString selected_Facility = 'Select Facility'.obs;
  RxString selectedTime1 = '01'.obs;
  RxString selectedTime2 = '012'.obs;

  var week_option_list = [
    '15 May - 21 May 2023',
    '22 May - 28 May 2023',
    '29 May - 4 June 2023'
  ].obs;
  var facility_list = ['Select Facility'].obs;
  var days_arr = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ].obs;
  var days_selection_arr =
      [false, false, false, false, false, false, false].obs;

  void selectDay(int index) {
    if (days_selection_arr[index]) {
      days_selection_arr[index] = false;
    } else {
      days_selection_arr[index] = true;
    }
  }

  List selectTime = [
    "01",
    '02',
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    '15',
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24"
  ];
}
