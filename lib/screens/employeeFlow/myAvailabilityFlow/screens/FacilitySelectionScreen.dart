import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Commonwidgets.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import '../controllers/FacilitySelectionController.dart';

class FacilitySelectionScreen extends StatefulWidget {
  const FacilitySelectionScreen({super.key});

  @override
  State<FacilitySelectionScreen> createState() =>
      _FacilitySelectionScreenState();
}

class _FacilitySelectionScreenState extends State<FacilitySelectionScreen> {
  int selectedIndex = -1;
  TextEditingController _search_name_controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FacilitySelectionController c =
        Get.put(FacilitySelectionController());
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Reponsive_.crosslength * 0.06,
            ),
            InterText(
              text: 'Facilities ',
              color: AppColors.blue,
              fontSize: Reponsive_.crosslength * 0.022,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.01,
            ),
            InterText(
              text: 'Please select the person to whom you want to send message.',
              color: AppColors.hintTextGrey,
              fontSize: Reponsive_.crosslength * 0.015,
              fontWeight: FontWeight.w400,
              maxLines: 2,
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.01,
            ),
            Commonwidgets.text_field(TextInputType.text,'Search Name',_search_name_controller,weight: FontWeight.w600),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: Reponsive_.crosslength*0.01),
                itemCount: c.facility_arr.length,
                itemBuilder: (context, index) {
                  return Obx(() => InkWell(
                    onTap: () {
                      c.select_instacate_staff(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Reponsive_.crosslength * 0.01,
                        left: Reponsive_.crosslength * 0.015,
                        right: Reponsive_.crosslength * 0.015,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            c.facility_selection_arr[index]
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
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/x/fecility_img.png',
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                InterText(
                                  text: '   ${c.facility_arr[index]}',
                                  color: AppColors.black,
                                  fontSize: Reponsive_.crosslength * 0.015,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
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
          ]),
      ),
      );
  }
}
