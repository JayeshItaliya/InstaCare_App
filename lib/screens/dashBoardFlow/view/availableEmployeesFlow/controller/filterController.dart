import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FilterController extends GetxController {
  var roleListValue = "Select".obs;
  var rangeDateValue = "Select".obs;

  var morningShift=false.obs;
  var afterNoonShift=false.obs;
  var nightShift=false.obs;

  List<String> roleList = [
    "Instacare Staff",
    "Facilities",
    "Employees",
    "For All",
  ];
}
