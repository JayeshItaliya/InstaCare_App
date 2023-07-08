import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class InvoiceListFilterController extends GetxController{
  RxString selected_amount_range='1000-2000'.obs;

  var amount_range_arr=['1000-2000','3000-4000','5000-6000','7000-8000','9000-10000',].obs;

  var selectDate="Date".obs;
}