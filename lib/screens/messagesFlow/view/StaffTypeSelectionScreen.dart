import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instacare/Utils/Commonwidgets.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';

import '../../../Utils/CommonDropDown.dart';
import '../../../Utils/appAssets.dart';
import '../controller/StaffTypeSelectionController.dart';

class StaffTypeSelectionScreen extends StatefulWidget {
  const StaffTypeSelectionScreen({super.key});

  @override
  State<StaffTypeSelectionScreen> createState() =>
      _StaffTypeSelectionScreenState();
}

class _StaffTypeSelectionScreenState extends State<StaffTypeSelectionScreen> {
  int selectedIndex = -1;
  TextEditingController _search_name_controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final StaffTypeSelectionController c =
        Get.put(StaffTypeSelectionController());
    Reponsive_.init(context);
    return Container(
      padding: EdgeInsets.only(
        left: Reponsive_.crosslength * 0.02,
        right: Reponsive_.crosslength * 0.02,
        bottom: Reponsive_.crosslength * 0.02,
      ),
      height: Reponsive_.crosslength * 0.8,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    width: 100,
                    height: 5,
                    color: AppColors.yallow,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
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
                child: CommonDropDown(
                    context: context,
                    list: c.staff_type_arr,
                    mycontrollerValue: c.selected_staff_type,
                    color: AppColors.backGroundColor),
                height: Reponsive_.crosslength * 0.055),
              Obx(()=>Visibility(
                visible: c.selected_staff_type=='Employee',
                child: SizedBox(
                  height: Reponsive_.crosslength * 0.01,
                ),
              )),
              Obx(()=>Visibility(
                visible: c.selected_staff_type=='Employee',
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Commonwidgets.text_field(
                            TextInputType.text, 'Search Name',
                            _search_name_controller)),
                    SizedBox(
                      width: Reponsive_.crosslength * 0.01,
                    ),
                    Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(),
                          decoration: BoxDecoration(
                            // color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: CommonDropDown(
                              context: context,
                              list: c.employee_type_arr,
                              mycontrollerValue: c.selected_emp_type,
                              color: AppColors.backGroundColor),
                          height: Reponsive_.crosslength * 0.055),
                    ),
                  ],
                ),
              )),
            Expanded(
              child: ListView.builder(
                itemCount: c.insta_care_staff_arr.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Obx(() => InkWell(
                    onTap: () {
                      if (c.selected_insta_care_staff_arr.contains(index)) {
                        c.selected_insta_care_staff_arr.remove(index);
                      } else {
                        c.select_instacate_staff(index);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Reponsive_.crosslength * 0.02,
                        left: Reponsive_.crosslength * 0.015,
                        right: Reponsive_.crosslength * 0.015,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            c.selected_insta_care_staff_arr.contains(index)
                                ? 'assets/x/check.png'
                                : 'assets/x/uncheck.png',
                            height: Reponsive_.crosslength * 0.03,
                          ),
                          SizedBox(
                            width: Reponsive_.crosslength * 0.02,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: Reponsive_.crosslength * 0.06,
                                  width: Reponsive_.crosslength * 0.06,
                                  decoration: BoxDecoration(
                                      shape: c.selected_staff_type=='Facility'?BoxShape.rectangle:BoxShape.circle,
                                      borderRadius: c.selected_staff_type!='Facility'?null:BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            AppAssets.completed,
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                InterText(
                                  text: '   ${c.insta_care_staff_arr[index]}',
                                  color: Color(0xff02050A),
                                  fontSize: Reponsive_.crosslength * 0.015,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Reponsive_.crosslength * 0.01,
                                vertical: Reponsive_.crosslength * 0.003),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Reponsive_.crosslength * 0.02),
                                border: Border.all(color: AppColors.yallow),
                                color: AppColors.light_yallow),
                            child: InterText(
                              text: 'Staff',
                              color: AppColors.yallow,
                              fontSize: Reponsive_.crosslength * 0.015,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  );
                },
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            Row(
              children: [
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
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: InterText(
                        text: "SELECT",
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
                        text: "CANCEL",
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
