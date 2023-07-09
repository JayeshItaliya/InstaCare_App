import 'package:instacare/Utils/appUrl.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/data/serverResponse/networkApiServices.dart';
import 'package:instacare/model/peopleModel.dart';

class GetPeopleData{
  final _apiServices = NetWorkApiServices();

 Future<List<PeopleList>?> getData()async{
    try{
      var response=await _apiServices.getResponse(AppUrl.peopleList);
      if(response["status"]==1){
        var data=PeopleList.getListFromJson(response["people_list"]);
        return data;
      }
      else{
        print("data has Not Found");
      }
    }catch(e){
      toastMessageError("OOPS!");
      print(e.toString());
    }
  }
}