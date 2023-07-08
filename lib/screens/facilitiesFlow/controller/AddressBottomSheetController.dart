import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddressBottomSheetController extends GetxController {
  var selectedCountry = "United States".obs;


  List<String> countryList = [
    "United States",
    "England",
    "South Africa",
    "France",
  ];
}
