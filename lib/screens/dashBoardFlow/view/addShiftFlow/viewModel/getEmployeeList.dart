import 'package:instacare/Utils/appUrl.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/data/serverResponse/networkApiServices.dart';
import 'package:instacare/model/employeeModel.dart';

class GetEmployeeList{
  final _apiServices = NetWorkApiServices();

  Future<List<EmployeeList>?> getEmployeeData()async{
    try{
      var response=await _apiServices.getResponse(AppUrl.employeeList);
      print("jsonResponse");
      print(response["data"]);
      if(response["status"]==1){
        var data=EmployeeList.getListFromJson(response["data"]);
        return data;
      }
      else{
        print("data has Not Found");
      }
    }catch(e){
      toastMessageError("OOPS!");
      print(e.toString());
    }
    return null;
  }
}