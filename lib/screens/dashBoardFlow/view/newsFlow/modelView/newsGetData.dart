import 'package:instacare/Utils/appUrl.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/data/serverResponse/networkApiServices.dart';
import 'package:instacare/model/newsModel.dart';

class NewsGetData{
  final _apiServices = NetWorkApiServices();


  Future<List<NewsListModel>?> getDataNew()async{
    try{
      var response=await _apiServices.getResponse(AppUrl.newsList);
      if(response["status"]==1){
        var data=NewsListModel.getListFromJson(response["data"]);
        return data;
      }
      else{
        print("data has Not Found");
      }
    }catch(e){
      toastMessageError("OOPS!");
      print(e.toString());
    }
    return [];
  }
}