import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appUrl.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/data/serverResponse/networkApiServices.dart';
import 'package:instacare/model/GetSingleShiftModel.dart';
class RecurringShiftController extends GetxController {

  var durationValue="01".obs;
  final GlobalKey<PopupMenuButtonState> durationKey = GlobalKey();

  var durationList=[
    "01",
    "02",
    "03",
    "04",
    "05",
  ].obs;


  List<String> weekDayList=[
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ].obs;
List<String> selected_week_days=List<String>.empty(growable: true).obs;

  var loading = true.obs;
  NetWorkApiServices _apiService = NetWorkApiServices();

  var incentive_radio_value = "Pending".obs;
  var incentive_type_radio_value = "Pending".obs;
  var calcellation_radio_value = "Pending".obs;

  final rateController = TextEditingController(text: "").obs;
  final incentiveAmountController = TextEditingController(text: "").obs;
  final notesController = TextEditingController(text: "").obs;


  var selectedFacility = "Select Facility".obs;
  var selectRoleValue = "Select Role".obs;
  var selectedNumberOfPosition = "01".obs;
  var selectedIncentiveBy = "".obs;
  var selectedFloorNo = "Select".obs;
  var selectedSupervisor = "Select".obs;

  var startTime = "01:00".obs;
  var startTimeZone = "PM".obs;
  var endTime = "02:00".obs;
  var endTimeZone = "PM".obs;


  var facilityArr = [
    "Demo",
    "Test",
    "Lorem Ipsum Facility",
  ].obs;

  var rolesArr = [
    "RN",
    "LPN",
    "CNA",
  ].obs;

  var Number_of_Positions_Arr = [
    "01",
    "02",
    "03",
    "04",
    "05",
  ].obs;

  var timeData = [
    "1:00",
    "2:00",
    "3:00",
    "4:00",
    "5:00",
    "6:00",
    "7:00",
    "8:00",
    "9:00",
    "10:00",
    "11:00",
    "12:00",
  ].obs;

  var timeZone = [
    "AM",
    "PM",
  ].obs;

  List<String> supervisorArr = List<String>.empty(growable: true).obs;
  List<String> supervisorIdArr = List<String>.empty(growable: true).obs;
  var incentiveByArr = ["Instacare", "Facility"].obs;
  var floorNumberArr = ["1st", "2nd", "3rd", "3th", "4th", "5th"].obs;

  var facility_id = 0.obs;
  var selectedDate = '2023-07-06'.obs;

  var supervisors_list = [Supervisor()].obs;
  var selected_shift_index = -1.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    try {
      var res = await _apiService.getResponse(AppUrl.get_single_shift_data);
      loading(false);

      GetSingleShiftModel getSingleShiftModel =
          GetSingleShiftModel.fromJson(res);
      print('get_single_shift_data ${getSingleShiftModel.toString()}');
      if (getSingleShiftModel.status == 1) {
        supervisorArr.clear();
        selectedFacility.value = getSingleShiftModel.data![0].name!;
        supervisors_list.value = getSingleShiftModel.data![0].supervisors!;
        facility_id.value=getSingleShiftModel.data![0].id!;
        for (var element in getSingleShiftModel.data![0].supervisors!) {
          supervisorArr.add(element.name!);
          supervisorIdArr.add(element.id!.toString());
        }
        //showSuccessDialog(getSingleShiftModel.message!);
      } else {
        showErrorDialog(getSingleShiftModel.message!);
      }
    } catch (e) {
      print("get_single_shift_data error " + e.toString());
    }
  }

  Future<void> storeRecurringShift(BuildContext context) async {
    if (selectedFacility.value == 'Select Facility') {
      toastMessageError('Please select Facility');
    } else if (selectRoleValue.value == 'Select Role') {
      toastMessageError('Please select Role');
    } else if (selectedDate.value.toString().isEmpty) {
      toastMessageError('Please select Date');
    } else if (selected_shift_index == -1) {
      toastMessageError('Please select shift time');
    } else if (rateController.value.text.isEmpty) {
      toastMessageError('Please enter rate');
    }else if (selected_week_days.isEmpty) {
      toastMessageError('The recurring days is required');
    } else if (calcellation_radio_value.value == "Pending") {
      toastMessageError('Please select Yes or No for cancellation guarantee');
    } else if (incentive_radio_value.value == "Pending") {
      toastMessageError('Please select Yes or No for incentives');
    }else if (selectedIncentiveBy.value.isEmpty) {
      toastMessageError('Please select incentive by');
    } else if (incentive_type_radio_value.value == "Pending") {
      toastMessageError('Please select Yes or No for incentive type');
    } else if (incentiveAmountController.value.text.isEmpty) {
      toastMessageError('Please enter incentive amount');
    } else if (selectedSupervisor.isEmpty) {
      toastMessageError('Please select supervisor');
    }else if (notesController.value.text.isEmpty) {
      toastMessageError('Please enter note');
    } else {
    try {
      var res = await _apiService.postResponse(AppUrl.store_recurring_shift, {
        'type': '2',
        'facility': facility_id.value.toString(),
        'role': selectRoleValue.value.toLowerCase(),
        'number_of_positions': selectedNumberOfPosition.value.toString(),
        'date': selectedDate.value.toString(),
        'shift_time': (selected_shift_index + 1).toString(),
        'rate': rateController.value.text.toString(),
        'floor_number': selectedFloorNo.value.toString(),
        'incentive_by': selectedIncentiveBy.value,
        'incentive_amount': incentiveAmountController.value.text.toString(),
        'supervisor': supervisorIdArr[supervisorArr.indexOf(
            selectedSupervisor.value)],
        'notes': notesController.value.text.toString(),
        'incentives': incentive_radio_value.value.contains('Yes') ? "1" : "0",
        'incentive_type':
        incentive_type_radio_value.value.contains('Yes') ? "1" : "0",
        'cancellation_guarantee':
        calcellation_radio_value.value.contains('Yes') ? "1" : "0",
        'duration': durationValue.value.toString(),
        'rec_shift_time': (selected_shift_index + 1).toString(),
        'recurring_days': selected_week_days.join(','),
        'start_time': "${startTime.value} ${startTimeZone.value.toString()}",
        'end_time': "${endTime.value} ${endTimeZone.value.toString()}"
      });
      loading(false);
      print('store_single_shift ${res.toString()}');
      /*GetSingleShiftModel getSingleShiftModel =
          GetSingleShiftModel.fromJson(res);*/

      if (res == null || res['status'] == 1) {
        showSuccessDialog(res == null ? "success" : "Shift Added Successfully");
        onBack(context);
      } else {
        showErrorDialog(res['message']);
      }
    } on Error catch (e) {
      print("get_single_shift_data error \n" +
          e.toString() +
          '\n' +
          e.stackTrace.toString());
    }
  }
  }
}
