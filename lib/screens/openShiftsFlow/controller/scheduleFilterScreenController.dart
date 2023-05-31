import 'package:get/get.dart';

class ScheduleFilterController extends GetxController{

  List<String> facilities=[
    "Facilities 1",
    "Facilities 2",
    "Facilities 3",
    "Facilities 4",
    "Facilities 5",
  ];

  List<String> employeeName=[
    "Employee Name Employee Name 1",
    "Employee Name 2",
    "Employee Name 3",
    "Employee Name 4",
    "Employee Name 5",
  ];

  List<String> role=[
    "Role 1",
    "Role 2",
    "Role 3",
    "Role 4",
    "Role 5",
  ];

  var facilitiesValue="Facilities".obs;
  var employeeNameValue="Employee Name".obs;
  var roleValue="Role".obs;
}