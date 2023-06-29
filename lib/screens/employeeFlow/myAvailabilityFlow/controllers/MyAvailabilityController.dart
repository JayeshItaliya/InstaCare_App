import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MyAvailabilityController extends GetxController{
  RxString selected_week_option='15 May - 21 May 2023'.obs;
  RxString selected_Facility='Select Facility'.obs;

  var week_option_list=['15 May - 21 May 2023','22 May - 28 May 2023','29 May - 4 June 2023'].obs;
  var facility_list=['Select Facility'].obs;
  var days_arr=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'].obs;
  var days_selection_arr=[false,false,false,false,false,false,false].obs;

  final List<String> timeList = [
    "00:00",
    "01:00",
    "02:00",
    "03:00",
    "04:00",
    "05:00",
    "06:00",
    "07:00",
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00",
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
    "19:00",
    "20:00",
    "21:00",
    "22:00",
    "23:00",
  ].obs;

  List<String> fromTimeList = [
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
  ].obs;
  List<String> toTimeList = [
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
    "00:00",
  ].obs;

  void selectFromTime(int index,String time){
    fromTimeList[index]=time;
  }

  void selectToTime(int index,String time){
    toTimeList[index]=time;
  }

  void selectDay(int index){
    if (days_selection_arr[index]) {
      days_selection_arr[index]=false;
    }else{
      days_selection_arr[index]=true;
    }
  }
}