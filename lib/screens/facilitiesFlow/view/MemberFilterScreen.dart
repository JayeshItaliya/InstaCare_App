import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/interText.dart';

import '../../../Utils/CommonDropDown.dart';
import '../../../Utils/appColor.dart';
import '../../../Utils/pageNavigator.dart';
import '../controller/MemberfilterController.dart';


class MemberFilterScreen extends StatefulWidget {
  const MemberFilterScreen({super.key});

  @override
  State<MemberFilterScreen> createState() => _MemberFilterScreenState();
}

class _MemberFilterScreenState extends State<MemberFilterScreen> {
  final filterController = Get.put(MemberFilterController());
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(Reponsive_.crosslength*0.015),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: InterText(text: 'Apply Filter',fontWeight: FontWeight.w700,fontSize: Reponsive_.crosslength*0.025,color: Colors.black,)),
                  InkWell(
                      onTap: (){
                        onBack(context);
                      },
                      child: Icon(Icons.cancel_outlined))
                ],
              ),
              SizedBox(
                height: Reponsive_.crosslength * 0.02,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(),
                  decoration: BoxDecoration(
                    // color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(50)),
                  height: Reponsive_.crosslength * 0.055,
                  child: CommonDropDown(
                      context: context,
                      list: filterController.roleList,
                      mycontrollerValue: filterController.selectedRole,
                      color: AppColors.backGroundColor)),
              const Expanded(child: SizedBox()),
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
                          text: "Apply",
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
                      onTap: (){
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
                          text: "Reset",
                          color: Colors.white,
                          fontSize: Reponsive_.crosslength * 0.02,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
