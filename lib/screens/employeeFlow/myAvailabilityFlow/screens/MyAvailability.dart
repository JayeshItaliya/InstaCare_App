import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import '../../../../Utils/appAssets.dart';
import '../controllers/MyAvailabilityController.dart';
import 'FacilitySelectionScreen.dart';

class MyAvailability extends StatefulWidget {
  const MyAvailability({super.key});

  @override
  State<MyAvailability> createState() => _MyAvailabilityState();
}

class _MyAvailabilityState extends State<MyAvailability> {
  @override
  Widget build(BuildContext context) {
    final MyAvailabilityController c = Get.put(MyAvailabilityController());
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: EdgeInsets.all(Reponsive_.crosslength * 0.015),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            InterText(
              text: '  Week',
              color: Colors.black,
              fontSize: Reponsive_.crosslength * 0.016,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.01,
            ),
            CommonDropDown(
                context: context,
                list: c.week_option_list,
                color: Colors.white,
                mycontrollerValue: c.selected_week_option,hint: 'Select Week'),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: InterText(
                    text: '  Select Days',
                    color: Colors.black,
                    fontSize: Reponsive_.crosslength * 0.016,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: InterText(
                    text: '  Select Time',
                    color: Colors.black,
                    fontSize: Reponsive_.crosslength * 0.016,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.01,
            ),
            Obx(() => ListView.builder(
              itemCount: c.days_arr.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: Reponsive_.crosslength * 0.005),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Obx(
                              () => InkWell(
                            onTap: () {
                              c.selectDay(index);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: Reponsive_.crosslength * 0.015,
                                horizontal: Reponsive_.crosslength * 0.01,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Reponsive_.crosslength * 0.01),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Container(
                                    height: Reponsive_.crosslength * 0.025,
                                    width: Reponsive_.crosslength * 0.025,
                                    decoration: c.days_selection_arr[index]
                                        ? const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/x/check.png')))
                                        : const BoxDecoration(
                                        color: AppColors.backGroundColor,
                                        shape: BoxShape.circle),
                                  ),
                                  InterText(
                                    text: '  ${c.days_arr[index]}',
                                    color: AppColors.hintTextGrey,
                                    fontSize: Reponsive_.crosslength * 0.018,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Reponsive_.crosslength * 0.005,
                      ),
                      Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                child: dropDown(index,c.fromTimeList[index], true, c),
                              ),
                              SizedBox(
                                width: Reponsive_.crosslength * 0.005,
                              ),
                              Expanded(
                                  child:
                                  dropDown(index,c.toTimeList[index], false, c)),
                            ],
                          )),
                    ],
                  ),
                );
              },
            )),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            InterText(
              text: '  My Preferred Facility',
              color: Colors.black,
              fontSize: Reponsive_.crosslength * 0.016,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(Reponsive_.crosslength * 0.02)),
              child: TextField(
                readOnly: true,
                onTap: () {
                  toPushNavigator(
                      context: context, PageName: FacilitySelectionScreen());
                },
                decoration: InputDecoration(
                  suffixIcon: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.buttonColor,
                      )),
                  isDense: true,
                  fillColor: Colors.blue,
                  border: InputBorder.none,
                  hintText: 'Select Facility',
                  helperStyle: GoogleFonts.inter(
                      color: AppColors.hintTextGrey,
                      fontWeight: FontWeight.w400),
                  contentPadding: EdgeInsets.only(
                      top: Reponsive_.crosslength * 0.015,
                      left: Reponsive_.crosslength * 0.015),
                ),
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            Expanded(child: SizedBox()),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: "SAVE",
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: Reponsive_.crosslength * 0.01,
                ),
                Expanded(
                  child: CommonButton(
                    text: "RESET",color: AppColors.allGray,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dropDown(int index,
      String selected_value, bool isFrom, MyAvailabilityController c) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(Reponsive_.crosslength * 0.01)),
        ),
        padding: EdgeInsets.symmetric(
          vertical: Reponsive_.crosslength * 0.001,
          horizontal: Reponsive_.crosslength * 0.015,
        ),
        child: Obx(() => DropdownButtonHideUnderline(
               child: DropdownButton(

                 items: c.timeList.map((value) => DropdownMenuItem(
                     value: value,
                     child: InterText(
                       text: value,
                       color: AppColors.hintTextGrey,
                       fontSize: Reponsive_.crosslength * 0.018,
                       fontWeight: FontWeight.w400,
                     )))
                     .toList(),
                 onChanged: (value) {
                   if (isFrom) {
                     c.fromTimeList[index] = value.toString();
                   } else {
                     c.toTimeList[index] = value.toString();
                   }
                   print("selected_value ${c.timeList.indexOf(value!)} $value ${c.fromTimeList}");
                 },
                 isExpanded: false,
                 icon: Image.asset(AppAssets.dropDown),
                 value: isFrom?c.fromTimeList[index]:c.toTimeList[index],
               ))
           ),
        );
  }
}
