import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SendMessageController extends GetxController {
  var selectedCenter = "Beacon Health Center".obs;
  var selectedQuickMsg = "Select quick message".obs;


  List<String> centerList = [
    "Beacon Health Center",
    "Abc Health Center",
    "Xyz Health Center",
  ];

  List<String> quickMsgList = [
    "Quick Message 1",
    "Quick Message 2",
    "Quick Message 3",
  ];
}
