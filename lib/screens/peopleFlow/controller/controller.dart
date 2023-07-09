

import 'package:get/get.dart';
import 'package:instacare/model/peopleModel.dart';
import 'package:instacare/screens/peopleFlow/modelView/getPeopleData.dart';

class PeopleControllerFilter extends GetxController{

  var roleValue="Role".obs;
  var statusValue="Status".obs;
  var ratingValue="Rating".obs;
  var pointsValue="Points".obs;
  var activeValue="Latest Activity".obs;

List<String> role=[
  "Doctor",
  "Employee",
  "People",
];
List<String> status=[
  "Available",
  "Busy",
  "Offline",
];
List<String> rating=[
  "5.0",
  "6.0",
  "4.0",
  "3.0",
];
List<String> points=[
  "5",
  "6",
  "7",
  "8",
  "9",
];
List<String> lastActive=[
  "12:10 PM",
  "10:10 AM",
  "07:30 AM",
  "04:26 PM",
];
  @override
  void onInit() {
    getData();
    super.onInit();
  }
  GetPeopleData getPeopleData=GetPeopleData();
  List<PeopleList> peopleData = List<PeopleList>.empty(growable: true).obs;
 var loadingValue=false.obs;
  getData(){
    loadingValue.value=true;
    try{
      getPeopleData.getData().then((value){
        if(value!=null){
          peopleData.addAll(value);
          loadingValue.value=false;
        }
        else{
          print("No Item List Data");
          peopleData=[];
          loadingValue.value=false;
        }
      });
    }catch(e){
      print(e.toString());
    }
  }
}