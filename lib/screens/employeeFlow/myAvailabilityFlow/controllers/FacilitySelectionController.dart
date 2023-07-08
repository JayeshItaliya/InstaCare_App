import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FacilitySelectionController extends GetxController{

  RxList facility_arr=['Select All','Care Center','Elevate care north branch','Community Health Center','Care Center','Elevate care north branch','Community Health Center','Care Center','Elevate care north branch',].obs;
  var facility_selection_arr=[false,false,false,false,false,false,false,false,false].obs;

  void select_instacate_staff(int index){
    if(index==0){
      if (facility_selection_arr[0]) {
        for (var i = 0; i<facility_selection_arr.length; i++) {
                facility_selection_arr[i]=false;
              }
      }else{
        for (var i = 0; i<facility_selection_arr.length; i++) {
          facility_selection_arr[i]=true;
        }
      }
    }
    else {
      if (facility_selection_arr[index]) {
        facility_selection_arr[index] = false;
        facility_selection_arr[0] = false;
      } else {
        facility_selection_arr[index] = true;
      }
    }
  }
}