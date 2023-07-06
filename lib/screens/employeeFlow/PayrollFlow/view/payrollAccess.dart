import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/employeeFlow/PayrollFlow/controller/payrollAccessController.dart';
import 'package:instacare/screens/employeeFlow/PayrollFlow/view/payrollScreen.dart';

class PayrollAccessScreen extends StatefulWidget {
  const PayrollAccessScreen({super.key});

  @override
  State<PayrollAccessScreen> createState() => _PayrollAccessScreenState();
}

class _PayrollAccessScreenState extends State<PayrollAccessScreen> {
  final payrollAccessController = Get.put(PayrollAccessController());
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: ListView(
        padding: padding,
        children: [
          SizedBox(
            height: Reponsive_.crosslength / 15,
          ),
         CommonContainer(
           child: ListView(
             shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             children: [
               InterText(
                 text: "To access to your payroll please\nclick on the below link",
                 fontWeight: FontWeight.w400,
                 fontSize: Reponsive_.px16,
                 color: AppColors.black,
                 textAlign: TextAlign.center,
                 maxLines: 2,
               ),
               SizedBox(
                 height: Reponsive_.crosslength / 25,
               ),
               GestureDetector(
                 onTap: () {
                   toPushNavigator(context: context, PageName: PayrollScreen());
                 },
                 child: InterText(
                   text: "Login to ADP",
                   fontWeight: FontWeight.w700,
                   fontSize: Reponsive_.px16,
                   color: AppColors.blue,
                   textAlign: TextAlign.center,
                   maxLines: 2,
                 ),
               ),
             ],
           ),
         ),
          SizedBox(
            height: Reponsive_.crosslength / 25,
          ),
          CommonContainer(
            child: SizedBox(
                width: 200,
                height: 60,
                child:
                ListView.builder(
                    itemCount: payrollAccessController.dallyServices.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Transform.scale(
                            scale: 1.3,
                            child: Theme(
                                data: ThemeData(unselectedWidgetColor: AppColors.buttonColor),
                                child: Obx(()=>
                                    Radio(
                                      groupValue: payrollAccessController.dallyServicesValue.value,
                                      value: payrollAccessController.dallyServices[index],
                                      activeColor: AppColors.buttonColor,
                                      onChanged: (newValue) {
                                        payrollAccessController.dallyServicesValue.value=newValue.toString();
                                        print(payrollAccessController.dallyServicesValue.value);
                                      },
                                    ),
                                )

                            ),
                          ),
                          InterText(
                            text: payrollAccessController.dallyServices[index].toString(),
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: AppColors.black,
                          ),
                        ],
                      );
                    })

            ),
          )
        ],
      ),
    );
  }
}
