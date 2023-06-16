import 'package:get/get.dart';

class CreateReminderController extends GetxController {

  var selectedDate = "Select Date".obs;
  var currentTime = "Select Time".obs;
  var currentDateTime = DateTime.now().obs;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  final List<String> items1 = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  var selectedValue="".obs;
  var selectedValue1="".obs;
}
