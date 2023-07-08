import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FacilityEmployeeSelectionController extends GetxController{

  RxList facility_emp_arr=['Select All','Maureen Biologist','Jessica Atréides','Jasnah Kholin','Tattersail','Granny Weatherwax','Kimberley','Gemma'].obs;
  RxList emp_position_arr=['','Staff','Manager','Staff','Staff','Staff','Staff','Front Desk'].obs;
  var facility_emp_selection_arr=[false,false,false,false,false,false,false,false].obs;

  void select_instacate_staff(int index){
    if(index==0){
      if (facility_emp_selection_arr[0]) {
        for (var i = 0; i<facility_emp_selection_arr.length; i++) {
                facility_emp_selection_arr[i]=false;
              }
      }else{
        for (var i = 0; i<facility_emp_selection_arr.length; i++) {
          facility_emp_selection_arr[i]=true;
        }
      }
    }
    else {
      if (facility_emp_selection_arr[index]) {
        facility_emp_selection_arr[index] = false;
        facility_emp_selection_arr[0] = false;
      } else {
        facility_emp_selection_arr[index] = true;
      }
    }
  }
}