import 'package:get/get.dart';

class PayrollAccessController extends GetxController {
  RxInt selectedValue = 0.obs;
  RxString dallyServicesValue = "".obs;



  List<String> dallyServices = [
      "Weekly",
      "Daily",
  ];
}