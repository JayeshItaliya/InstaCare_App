import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/model/newsModel.dart';
import 'package:instacare/screens/dashBoardFlow/view/newsFlow/modelView/newsGetData.dart';

class NewsController extends GetxController {
  List<NewsListModel> newsListModel = List<NewsListModel>.empty(growable: true).obs;

  RxBool loadingData = false.obs;
  NewsGetData newsGetData = NewsGetData();

  void onInit() {
    getData();
    super.onInit();
  }

  void getData() {
    loadingData.value=true;
    try {
      newsGetData.getDataNew().then((value) {
        if (value != null) {
          newsListModel.addAll(value);
          loadingData.value=false;
        } else {
          toastMessageError("Data Has Not Found!");
          loadingData.value=false;
        }
      });
    } catch (e) {
      loadingData.value=false;
      print(e);
    }
  }
}
