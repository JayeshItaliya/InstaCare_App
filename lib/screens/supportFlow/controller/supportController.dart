import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/model/supportReasonModel.dart';
import '../../../Utils/appUrl.dart';
import '../../../data/serverResponse/networkApiServices.dart';

class SupportController extends GetxController{
  var selected_reason="Select reason".obs;
  var msgController=TextEditingController(text: '').obs;
  var loading = true.obs;
  NetWorkApiServices _apiService = NetWorkApiServices();
  List<String> supportList=[''].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    get_reason_list();
  }

  Future<void> get_reason_list() async {
    try {
      var res = await _apiService.getResponse(AppUrl.reason_list);
      loading(false);
      ReasonListModel reasonListModel = ReasonListModel.fromJson(res);
      print('reason_list ${reasonListModel.toString()}');
      supportList.clear();
      for (var element in reasonListModel.data!) {
            supportList.add(element.reason!);
          }
    } catch (e) {
      print(e);
    }
  }

Future<void> submit_reason(BuildContext context) async {
    try {
      var res = await _apiService.postResponse(AppUrl.submit_reason,{
        'reason':selected_reason.value,
        'message':msgController.value.text.toString(),
      });
      loading(false);

      ReasonListModel reasonListModel = ReasonListModel.fromJson(res);
      if (reasonListModel.status==1) {
        onBack(context);
        showSuccessDialog(reasonListModel.message!);
      }else{
        showErrorDialog(reasonListModel.message!);
      }
      print('reason_list ${reasonListModel.toString()}');


    } catch (e) {
      print(e);
    }
  }


}