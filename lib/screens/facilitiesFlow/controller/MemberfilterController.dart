import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MemberFilterController extends GetxController {
  var selectedRole = "Role".obs;


  List<String> roleList = [
    "Role",
    "Role1",
    "Role2",
    "Role3",
  ];
}
