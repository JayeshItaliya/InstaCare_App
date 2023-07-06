import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Commonwidgets.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import '../controller/FacilityEmployeeSelectionController.dart';

class FacilityEmployeeSelectionScreen extends StatefulWidget {
  const FacilityEmployeeSelectionScreen({super.key});

  @override
  State<FacilityEmployeeSelectionScreen> createState() =>
      _FacilityEmployeeSelectionScreenState();
}

class _FacilityEmployeeSelectionScreenState extends State<FacilityEmployeeSelectionScreen> {
  int selectedIndex = -1;
  TextEditingController _search_name_controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FacilityEmployeeSelectionController c = Get.put(FacilityEmployeeSelectionController());
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Reponsive_.crosslength * 0.05,
            ),
            InterText(
              text: 'Facilities Employees',
              color: AppColors.blue,
              fontSize: Reponsive_.crosslength * 0.023,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.01,
            ),
            InterText(
              text: 'Please select the person to whom you want to send message.',
              color: AppColors.black,
              fontSize: Reponsive_.crosslength * 0.015,
              fontWeight: FontWeight.w400,
              maxLines: 2,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: Reponsive_.crosslength*0.01),
                itemCount: c.facility_emp_arr.length,
                itemBuilder: (context, index) {
                  return Obx(() => InkWell(
                    onTap: () {
                      c.select_instacate_staff(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Reponsive_.crosslength * 0.018,
                        left: Reponsive_.crosslength * 0.015,
                        right: Reponsive_.crosslength * 0.015,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            c.facility_emp_selection_arr[index]
                                ? 'assets/x/check.png'
                                : 'assets/x/uncheck.png',
                            height: Reponsive_.crosslength * 0.028,
                          ),
                          SizedBox(
                            width: Reponsive_.crosslength * 0.02,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: Reponsive_.crosslength * 0.04,
                                  width: Reponsive_.crosslength * 0.04,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/x/fecility_img.png',
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                Expanded(
                                  child: InterText(
                                    text: '   ${c.facility_emp_arr[index]}',
                                    color: AppColors.black,
                                    textOverflow: TextOverflow.ellipsis,
                                    fontSize: Reponsive_.crosslength * 0.015,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if(index!=0)...{
                            SizedBox(
                              width: Reponsive_.crosslength * 0.12,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Reponsive_.crosslength *
                                            0.02,
                                        vertical: Reponsive_.crosslength *
                                            0.007),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Reponsive_.crosslength * 0.02),
                                        border: Border.all(
                                            color: getBorderColor(
                                                c.emp_position_arr[index])),
                                        color: getBgColor(
                                            c.emp_position_arr[index])),
                                    child: InterText(
                                      text: c.emp_position_arr[index],
                                      color: getBorderColor(
                                          c.emp_position_arr[index]),
                                      fontSize: Reponsive_.crosslength * 0.013,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          }
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
                  child: CommonButton(text: 'SELECT', onTap: (){onBack(context);},height: Reponsive_.crosslength*0.06)
                ),
                SizedBox(
                  width: Reponsive_.crosslength * 0.01,
                ),
                Expanded(
                  child: CommonButton(text: 'CANCEL', onTap: (){onBack(context);},color: AppColors.allGray,height: Reponsive_.crosslength*0.06,)
                ),
              ],
            ),
            SizedBox(width: Reponsive_.crosslength*0.01,),
          ]),
      ),
      );
  }

  Color getBorderColor(position) {
    if(position=='Staff'){
      return AppColors.yallow;
    }else if(position=='Manager'){
      return AppColors.dark_purple;
    }else{
      return AppColors.dark_green;
    }
  }

  Color getBgColor(position) {
    if(position=='Staff'){
      return AppColors.light_yallow;
    }else if(position=='Manager'){
      return AppColors.light_purple;
    }else{
      return AppColors.light_green;
    }
  }
}
