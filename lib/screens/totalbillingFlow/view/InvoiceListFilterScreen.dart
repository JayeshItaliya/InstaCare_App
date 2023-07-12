import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instacare/Utils/Commonwidgets.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/helper/date_conveter.dart';
import '../../../Utils/CommonDropDown.dart';
import '../../../Utils/appColor.dart';
import '../../../Utils/pageNavigator.dart';
import '../controller/InvoiceListFilterController.dart';

class InvoiceListFilterScreen extends StatefulWidget {
  const InvoiceListFilterScreen({super.key});

  @override
  State<InvoiceListFilterScreen> createState() => _InvoiceListFilterScreenState();
}

class _InvoiceListFilterScreenState extends State<InvoiceListFilterScreen> {
  TextEditingController _date_controller = TextEditingController();
  final InvoiceListFilterController c = Get.put(InvoiceListFilterController());
  @override
  void initState() {
    // TODO: implement initState
    c.selected_amount_range.value="Amount (Range)";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    Reponsive_.init(context);
    return Scaffold(

      body: Container(
        padding: EdgeInsets.only(top:Reponsive_.crosslength*0.04,left:Reponsive_.crosslength*0.015,right:Reponsive_.crosslength*0.015, ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InterText(text: 'Apply Filter',color: Colors.black,fontSize: Reponsive_.crosslength*0.025,fontWeight: FontWeight.w700,),
                InkWell(
                    onTap: (){
                      onBack(context);
                    },
                    child: Icon(Icons.close_outlined)),
              ],
            ),
            SizedBox(height: Reponsive_.crosslength*0.025,),
            Obx(() => Commonwidgets.text_field(
                TextInputType.text,
                c.selectDate.value,
                _date_controller,
                hint_color: AppColors.black,
                suffix: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.buttonColor,
                ),
                readOnly: true, ontap: () {
              DateConverter.RangeDatePicker(
                  context: context,
                  monthType: true,
                  dateRang: false
              ).then((value) {
                c.selectDate.value=value.toString();
              });
            }),),
            SizedBox(height: Reponsive_.crosslength*0.01,),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(),
                decoration: BoxDecoration(
                  // color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(50)),
                child: CommonDropDown(
                    context: context,
                    list: c.amount_range_arr,
                    mycontrollerValue: c.selected_amount_range,
                    color: AppColors.backGroundColor,
                  hint: "Amount (Range)"
                ),
                height: Reponsive_.crosslength * 0.055),
            Expanded(child: SizedBox()),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      onBack(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: Reponsive_.crosslength * 0.015),
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: InterText(
                        text: "APPLY",
                        color: Colors.white,
                        fontSize: Reponsive_.crosslength * 0.02,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Reponsive_.crosslength * 0.01,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onBack(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: Reponsive_.crosslength * 0.015),
                      decoration: BoxDecoration(
                          color: AppColors.allGray,
                          borderRadius: BorderRadius.circular(50)),
                      child: InterText(
                        text: "RESET",
                        color: Colors.white,
                        fontSize: Reponsive_.crosslength * 0.02,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
          ],
        ),
      ),
    );
  }


}
