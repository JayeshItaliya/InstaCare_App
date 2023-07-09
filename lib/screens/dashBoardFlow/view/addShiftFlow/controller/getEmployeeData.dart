import 'package:get/get.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/model/employeeModel.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/viewModel/getEmployeeList.dart';

class EmployeeDataController extends GetxController {
  List<EmployeeList> employeeList =
      List<EmployeeList>.empty(growable: true).obs;
  var loadingData = false.obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  GetEmployeeList getEmployeeList = GetEmployeeList();

  void getData() {
    loadingData.value = true;
    try {
      getEmployeeList.getEmployeeData().then((value) {
        if (value != null) {
          employeeList.addAll(value);
          loadingData.value = false;
        } else {
          toastMessageError("data has Not Found! OOPS!!");
          loadingData.value = false;
        }
      });
    } catch (e) {
      loadingData.value = false;
      toastMessageError(e.toString());
      print(e);
    }
  }
}
