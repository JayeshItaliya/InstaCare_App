import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StaffTypeSelectionController extends GetxController{
  RxString selected_staff_type='Instacare Staff'.obs;
  RxString selected_emp_type='All'.obs;
  var staff_type_arr=['Instacare Staff','Facility','Employee'].obs;
  var employee_type_arr=['All','Type 1','Type 2'].obs;

  RxList selected_insta_care_staff_arr=[].obs;
  RxList insta_care_staff_arr=['Select All','ABCD','EFG','HGIJ','DEFRG FGVBF',].obs;

  void select_instacate_staff(int i){
    selected_insta_care_staff_arr.add(i);
    // update();
  }
}