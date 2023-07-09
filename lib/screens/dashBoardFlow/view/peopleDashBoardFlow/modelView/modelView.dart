import 'package:instacare/Utils/appUrl.dart';
import 'package:instacare/data/serverResponse/networkApiServices.dart';
import 'package:instacare/model/peopleDetialModel.dart';
import 'package:instacare/model/peopleModel.dart';

class PeopleGetData {
  final _apiServices = NetWorkApiServices();
  Future<PeopleDetialModel?> getPeopleData(int id) async {
    try {
      var response = await _apiServices.getResponse(AppUrl.getPeopleDeatial+id.toString());
      if (response["status"] == 1) {
        PeopleDetialModel peopleModel = PeopleDetialModel.fromJson(response);
        return peopleModel;
      } else {
        print(response["message"]);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
